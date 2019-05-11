module Heap (Heap, emptyH, isEmptyH,insertH, findMinH, deleteMin, splitMin) where

{--
		Inv.Rpe:  + El arbol tiene orden heap-Min
						* La raiz es el mas chico de todos los elementos.
						* Los subarboles tambien tienen orden heap.
					    *El arbol es completo.
					  + La ocurrencia indica el proximo lugas a agregar para que siga completo.
--}

data Tree a = Vacio | Nodo a (Tree a) (Tree a)

isEmptyT :: Tree a -> Bool
isEmptyT Vacio = True
isEmptyT (Nodo _ _ _) = False

data Dir = Izq | Der

type Ocurrencia = [Dir]

data Heap a = H  (Tree a) Ocurrencia

emptyH :: Heap a 
-- O(1)
-- PROPÓSITO: Retorna un heap vacío.
emptyH = H Vacio []

isEmptyH ::  Heap a -> Bool
-- O(1)
-- PROPÓSITO: Dado un heap, indica si éste es vacío.
isEmptyH  (H Vacio []) = True
isEmptyH _ = False

insertH :: Ord a => a -> Heap a -> Heap a
-- PROPÓSITO: Dado un elemento y un heap, retorna un heap que contiene al elemento insertado.
-- log(n)
insertH n (H  t ds) = H (insertIn (reverse ds) t n) (nextPos ds)

insertIn ::Ord a => Ocurrencia -> Tree a -> a -> Tree a
-- PROPÓSITO: Dado un elemento, un Dirs y un árbol, retorna un árbol (que respeta los invariantes de heap) 
-- que contiene el elemento a insertar.
-- log(n)
insertIn [] Vacio n = Nodo n Vacio Vacio
insertIn (d:ds) (Nodo x ti td) n = case d of
									Izq ->  percoleUpIzq  x (insertIn ds ti n) td 
									Der -> percoleUpDer x ti (insertIn ds td n) 
 
percoleUpIzq ::  Ord a => a -> Tree a -> Tree a -> Tree a 
-- PRECONDICIÓN: Los árboles son heap.
-- PROPÓSITO: Dado una raíz y dos subarboles, arma un árbol con invariantes heap
-- reordenando los elementos del subarbol izquierdo y la raíz.
-- O(1)
percoleUpIzq n t1@(Nodo x ti td) t2 = if n < x
												then Nodo n t1  t2 
												else  Nodo x (Nodo n ti td ) t2

percoleUpDer :: Ord a => a -> Tree a -> Tree a -> Tree a 
-- PRECONDICIÓN: Los árboles son heap.
-- PROPÓSITO: Dado una raíz y dos subarboles, arma un árbol con invariantes heap
-- reordenando los elementos del subarbol derecho y la raíz.
-- O(1)
percoleUpDer n t1 t2@(Nodo x ti td ) = if n < x
													then Nodo n t1  t2
													else Nodo x t1  (Nodo n ti td)

nextPos :: [Dir] ->[Dir]
nextPos []			= [Izq]
nextPos (d:ds)	= case d of
							Izq -> Der : ds 
							Der -> Izq : nextPos ds

findMinH :: Ord a => Heap a -> a -- Parcial en emptyH
-- PROPÓSITO: Dado un heap, retorna su elemento mínimo.
-- PRECONDICIÓN: El heap debe tener al menos un elemento.
-- O(1)
findMinH  (H t ds) = findMinT t 

findMinT :: Tree a -> a 
findMinT Vacio 			 = error "sin elemento"
findMinT (Nodo x ti td) = x 

deleteMin :: Ord a => Heap a -> Heap a -- Parcial en emptyH
-- PROPÓSITO: Dado un heap, retorna el mismo heap sin el mínimo.							
-- PRECONDICIÓN: El heap debe tener al menos un elemento.
-- log(n)
deleteMin  (H t ds) = H (deleteIn (reverse ds) t) (prevPos ds)

deleteIn :: Ord a => Ocurrencia -> Tree a -> Tree a
-- Dado un Dirs y un heap, retorna al heap sin su elemento mínimo.
-- PRECONDICIÓN: El heap debe tener al menos un elemento.
-- log(n)
deleteIn  lp t =	case (splitLast lp t)	of
				(m', Vacio) -> Vacio
				(m', Nodo m ti' td') -> orderDown m' ti' td'

orderDown :: Ord a => a -> Tree a -> Tree a -> Tree a
-- PRECONDICIÓN: Los subarboles son Heaps. Si el subárbol izquierdo es vacío, el derecho también (digamos que cumplen 
-- los invariantes de los subarboles de un heap).
-- PROPÓSITO: Dado un elemento raíz y dos subarboles, ordena los elementos retornando un
-- árbol que es Heap. Baja el elemento raíz hasta donde deba estar.

orderDown m Vacio Vacio = Nodo m Vacio Vacio

orderDown m (ti@(Nodo mi tii tid)) Vacio =	if m <= mi 
												then Nodo m ti Vacio
												else Nodo mi (orderDown m tii tid) Vacio

orderDown m (ti@(Nodo mi tii tid)) 
			(td@(Nodo md tdi tdd)) =	if m <= mi && m <= md 
										then Nodo m ti td
										else 	if mi <= md  -- m es mayor que el mas chico de mi y md
												then Nodo mi (orderDown m tii tid) td
												else Nodo md ti (orderDown m tdi tdd)

splitLast :: Ord a => Ocurrencia -> Tree a -> (a, Tree a)	
-- PROPÓSITO: Dado un Dirs y un Heap, retorna una tupla con el elemento que se encuentra en la última posición que se insertó
-- y el heap sin ese elemento.
-- log(n)

splitLast []  (Nodo m Vacio Vacio) = (m, Vacio)

splitLast (Izq:oc) (Nodo m ti td) =	let (m', ti') = splitLast oc ti
										in (m', Nodo m ti' td)

splitLast (Der :oc) (Nodo m ti td) = 	let (m', td') = splitLast oc td
										in (m', Nodo m ti td')	

-- PROPÓSITO: Dado un Dirs, retorna un Dirs que representa la anterior posición en un heap.
-- PRECONDICIÓN: El Dirs debe tener al menos un elemento.
-- O(n)
prevPos [Izq]    = []
prevPos (Der :oc) = Izq : oc
prevPos (Izq:oc) = Der : prevPos oc

splitMin :: Ord a => Heap a -> (a, Heap a ) -- Parcial en emptyH
-- PROPÓSITO: Dado un heap, retorna un par que contiene el element mínimo del heap y el heap sin el mínimo.
-- PRECONDICIÓN: El heap debe tener al menos un elemento.
-- log(n)
splitMin h = (findMinH h, deleteMin h)