data Tree a =  Nodo a (Tree a) (Tree a) | Vacio deriving (Eq, Show)
-- Suposicion: es un BST.

isEmptyT Vacio = True
isEmptyT _ = False

arbol1 :: Tree Int
arbol1 = Nodo 10 
		(Nodo 2 Vacio Vacio) 		(Nodo 30 Vacio Vacio)
					
arbol2 = Nodo 20 
				(Nodo 2 Vacio Vacio) 
				(Nodo 31 Vacio 
						(Nodo 41 Vacio Vacio))

---prof (t) = log (size(t) = n
-- la profundidad del arbol es igual al logatidmo del tamaño del arbol.
--sea Node x ti td , x < valores t1 x > valores td.

insertBST :: Ord a => a ->Tree a -> Tree a 
-- Prop: Dado un BST inserta un elemento en el arbol.
-- Prec.: recibo un BST
insertBST n Vacio = (Nodo n Vacio Vacio )
insertBST n (Nodo x ti td) = if (n > x)
							then (Nodo x td (insertBST  n   ti)) 
							else  (Nodo x (insertBST  n ti) td)

perteneceBST :: Ord a => a -> Tree a -> Bool
--Prop: Dado un Bst dice si el elemento pertenece o no al arbol.
perteneceBST n Vacio			= False
perteneceBST n (Nodo x ti td) =	if (n == x)
								then True
								else if (n > x)
										then perteneceBST n td
										else perteneceBST n ti
													
splitMinBST :: Ord a =>  Tree a -> (a, Tree a)
--Prop: Dado un BST devuelve un par con el minimo elemento y el arbol sin el mismo.
-- Prec.: parcial en EmptyT
splitMinBST  Vacio			       = error "No hay minimo"
splitMinBST   (Nodo x Vacio  td)   =  (x, td) 
splitMinBST  (Nodo x ti Vacio)     = (ultimoElemento ti, (Nodo x (arbolSinMinimo ti) Vacio)) 
splitMinBST  (Nodo x ti td )	   = (ultimoElemento ti, (Nodo x (arbolSinMinimo ti) td))

ultimoElemento :: Ord a => Tree a -> a
-- Prec.: El arbol no es Vacio.
ultimoElemento (Nodo x Vacio td ) = x
ultimoElemento (Nodo x ti td )    = ultimoElemento ti 

arbolSinMinimo :: Ord a => Tree a -> Tree a 
arbolSinMinimo Vacio 				= Vacio
arbolSinMinimo (Nodo x Vacio td)	= td 
arbolSinMinimo (Nodo x ti td ) 		= (Nodo x (arbolSinMinimo ti) td )

elMaximoMenorA :: Ord a => a -> Tree a -> Maybe a
-- Prop: Dado un BST y un elemento, devuelve el maximo elemento que sea menor al elemento dado.
elMaximoMenorA n Vacio			= Nothing
elMaximoMenorA n (Nodo x ti td) = if n < x
									then elMaximoMenorA n ti 
									else elementoMaximoArbol x (elMaximoMenorA n td)

elementoMaximoArbol :: Ord a => a -> Maybe a ->  Maybe a
elementoMaximoArbol	n Nothing     = Just n
elementoMaximoArbol n m 		  = m

elMinimoMayorA :: Ord a => a -> Tree a -> Maybe a
-- Prop: Dado un BST y un elemento, devuelve el minimo elemento que sea mayor al elemento dado.
elMinimoMayorA n Vacio			= Nothing
elMinimoMayorA n (Nodo x ti td) = if n > x
									then elMinimoMayorA n td
									else elementoMinimoArbol x (elMinimoMayorA n ti)	

elementoMinimoArbol :: Ord a => a -> Maybe a -> Maybe a 
elementoMinimoArbol n Nothing = Just n
elementoMinimoArbol n m 	  = m