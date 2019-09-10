data Tree a = EmplyT | NodeT a (Tree a) (Tree a) deriving Show

tree :: Tree Int 
tree = NodeT 1 (EmplyT)(EmplyT)
tree1 = NodeT 2 (tree) (EmplyT)
tree2 = NodeT 3 (tree1) (NodeT 4 EmplyT EmplyT)

treeS :: Tree String
treeS = NodeT "Hola" (EmplyT) (EmplyT)

sumarT :: Tree Int -> Int
--Dado un arbol binario de enteros devuelve la suma entre sus elementos.

sumarT EmplyT          = 0
sumarT (NodeT x t1 t2) = x + sumarT t1 + sumarT t2 

mapDobleT :: Tree Int -> Tree Int
--Dado un arbol de enteros devuelve un arbol con el doble de cada numero.
mapDobleT EmplyT		  = EmplyT
mapDobleT (NodeT x t1 t2) = NodeT (x*2) (mapDobleT t1) (mapDobleT t2)

mapLongitudT :: Tree String -> Tree Int
--Dado un arbol de palabras devuelve un arbol con la longitud de cada palabra.
mapLongitudT EmplyT			 = EmplyT
mapLongitudT (NodeT x t1 t2) = NodeT (length x) (mapLongitudT t1) (mapLongitudT t2)

perteneceT :: Eq a => a -> Tree a -> Bool
--Dados un elemento y un arbol binario devuelve True si existe un elemento igual a ese en el arbol.
perteneceT n  EmplyT		 = False
perteneceT n (NodeT x t1 t2) = n == x || perteneceT n t1 || perteneceT n t2 

aparicionesT :: Eq a => a -> Tree a -> Int
--Dados un elemento e y un arbol binario devuelve la cantidad de elementos del arbol que son iguales a e.
aparicionesT n EmplyT			= 0
aparicionesT n (NodeT x t1 t2)  = if n == x
									then 1 + (aparicionesT n t1) + (aparicionesT n t2)
									else (aparicionesT n t1) + (aparicionesT n t2)
									
leaves :: Tree a -> Int
--Dado un arbol devuelve su cantidad de hojas.
--Nota: una hoja (leaf en ingles) es un nodo que no tiene hijos.
leaves EmplyT 			= 0
leaves (NodeT x t1 t2)  = if esLeave t1 && esLeave t2
							then 1
							else leaves t1 + leaves t2

esLeave :: Tree a -> Bool
--Dado un arbol devuelve true si es leave
esLeave EmplyT = True
esLeave _ 		= False

heightT :: Tree a -> Int
--Dado un arbol devuelve su altura.
--Nota: la altura (height en ingles) de un arbol es la cantidad maxima de nodos entre la raız y alguna de sus hojas. La altura de un arbol vacıo es cero y la de una hoja es 1.
heightT EmplyT			= 0
heightT (NodeT x t1 t2) = 1 + longitudMasGrandeT t1 t2

longitudMasGrandeT :: Tree a -> Tree a -> Int
--Dados 2 arboles me devuelve el arbol con mayor longitud
longitudMasGrandeT 	t1     t2     	= if(heightT t1) > (heightT t2)   
										then heightT t1
										else heightT t2
										
nodes :: Tree a -> Int
--Dado un arbol devuelve el numero de nodos que no son hojas. ¿Como podrıa resolverla sin utilizar recursion? Primero defınala con recursion y despues sin ella.
nodes EmplyT			= 0
nodes (NodeT x t1 t2) 	= if not (esLeave t1 && esLeave t2)
							then 1 + nodes t1 + nodes t2
							else 0
listInOrder :: Tree a -> [a]
--Dado un arbol devuelve una lista que representa el resultado de recorrerlo en modo in-order.
--Nota: En el modo in-order primero se procesan los elementos del hijo izquierdo, luego la raiz y luego los elementos del hijo derecho.
listInOrder EmplyT			= []
listInOrder (NodeT x t1 t2) = listInOrder t1 ++ x:listInOrder t2

levelN :: Int -> Tree a -> [a]
--Dados un numero n y un arbol devuelve una lista con los nodos de nivel n.
--Nota: El primer nivel de un arbol (su raız) es 0.
levelN n EmplyT			= 	[]
levelN n (NodeT x t1 t2)= 	if n == 0
							then [x]
							else (levelN (n-1) t1) ++ (levelN (n-1) t2)

listPorLevel :: Tree a -> [[a]]
--Dado un  ́arbol devuelve una lista de listas en la que cada elemento representa un nivel de dicho arbol.
listPorLevel EmplyT 		 = []
listPorLevel (NodeT x t1 t2) = [x] : (unirListas (listPorLevel t1)  (listPorLevel t2))

unirListas :: [[a]] -> [[a]] -> [[a]]
unirListas [] yss = yss
unirListas xss [] = xss
unirListas (xs:xss) (ys:yss) = (xs ++ ys) : (unirListas xss yss)

widthT :: Tree a -> Int
--Dado un ́arbol devuelve su ancho (width en ingl ́es), que es la cantidad de nodos del nivel con mayor cantidad de nodos.
widthT EmplyT			= 0
widthT tree	= maximaLongitud (mapLongitudes (listPorLevel tree))

mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x : xs) = (longitud x) : (mapLongitudes xs)

--Prop: Dada un lista de elementos de algun tipo devuelve el largo de esa lista, es decir, la cantidad de elementos que posee
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

maximaLongitud :: [Int] -> Int
maximaLongitud [] = 0
maximaLongitud (x:xs) = maxDelPar (x, maximaLongitud xs)

maxDelPar :: (Int , Int) -> Int
maxDelPar (x,y) = maximo x y

maximo :: Int -> Int -> Int
maximo x y = if x > y
           then x
           else y

todosLosCaminos :: Tree a -> [[a]]
todosLosCaminos EmplyT			= []
todosLosCaminos (NodeT x t1 t2)	= unir x (todosLosCaminos t1 ++ todosLosCaminos t2) 

unir :: a -> [[a]] -> [[a]]
unir x [] = [[x]]
unir x (y:ys) 	= (x: y) : unir x ys 

-------------------------------------------------------------------------------------------------------------

data Dir = Izq | Der
data Objeto = Tesoro | Chatarra
data Mapa = Cofre Objeto | Bifurcacion Objeto Mapa Mapa


hayTesoro :: Mapa -> Bool
--indica si el obj es tesoro
hayTesoro (Cofre obj)			  = hayTesoroO obj
hayTesoro (Bifurcacion obj m1 m2) = hayTesoroO obj || hayTesoro m1 || hayTesoro m2

hayTesoroO :: Objeto -> Bool
--Indica si hay un tesoro en alguna parte del mapa.
hayTesoroO Tesoro = True
hayTesoroO _ 	  = False	 

--Indica si al final del camino hay un tesoro. Nota: el final del camino es la lista vacía de direcciones.
hayTesoroEn :: [Dir] -> Mapa -> Bool
hayTesoroEn [] m 	 					 = hayTesoro m
hayTesoroEn ds (Cofre obj) 				 = False
hayTesoroEn (Izq:ds) (Bifurcacion _ m1 m2) = hayTesoroEn ds m1
hayTesoroEn (Der:ds) (Bifurcacion _ m1 m2) = hayTesoroEn ds m2

--Indica el camino al tesoro. Precondición: hay un sólo tesoro en el mapa.
caminoAlTesoro :: Mapa -> [Dir]
caminoAlTesoro (Cofre obj)				= []
caminoAlTesoro (Bifurcacion obj m1 m2)	= if(hayTesoro m1)
											then Izq : caminoAlTesoro m1
											else Der : caminoAlTesoro m2 

--Indica el camino de la rama más larga.
caminoRamaMasLarga :: Mapa -> [Dir]
caminoRamaMasLarga (Cofre obj)				= []
caminoRamaMasLarga (Bifurcacion obj m1 m2)	= if(heightT m1 > heightT m2)
												then Izq : caminoRamaMasLarga m1
												else Der : caminoRamaMasLarga m2

-- Devuelve una lista con los tesoroos, sino una lista vacia.
tesorosPerLevel :: Mapa -> [[Objeto]]
tesorosPerLevel (Cofre obj)				= [tesoro obj]
tesorosPerLevel (Bifurcacion obj m1 m2)	= tesoro obj : unirListas (tesorosPerLevel m1) (tesorosPerLevel m2)

--Devuelve los tesoros separados por nivel en el árbol.
tesoro :: Objeto -> [Objeto]
tesoro Tesoro = [Tesoro]
tesoro _ 	  = []

todosLosCaminos' :: Mapa -> [[Dir]]
--Devuelve todos lo caminos en el mapa.
todosLosCaminos' (Cofre obj) = [[]]
todosLosCaminos' (Bifurcacion obj mi md) = agregarA Izq (todosLosCaminos' mi) ++ agregarA Der (todosLosCaminos' md)  
{--
todosLosCaminos (Cofre obj)						= []
todosLosCaminos (Bifurcacion _ (Cofre _) (Cofre _)) = [[Izq], [Der]]
todosLosCaminos (Bifurcacion obj m1 (Cofre _))  = agregarDir Izq (todosLosCaminos m1) ++ [[Der]]
todosLosCaminos (Bifurcacion obj (Cofre _)) m2  = [[Izq]] ++ agregarDir Der (todosLosCaminos m2)
todosLosCaminos (Bifurcacion obj m1 m2)		    = agregarDir Izq (todosLosCaminos m1) ++ 
													agregarDir Der (todosLosCaminos m2)
--}
agregarA :: a -> [[a]] -> [[a]]
agregarA a [] = []
agregarA a (x:xs) = ([a] ++ x) : agregarA a xs

agregarDir :: Dir -> [[Dir]] -> [[Dir]]
agregarDir d []			= [[d]]
agregarDir d (ds:dss)	= (d:ds) : agregarDir d dss