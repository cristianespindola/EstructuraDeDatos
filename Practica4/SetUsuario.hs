import Set
data Arbol a =  Nodo a (Arbol a) (Arbol a) | Vacio deriving (Eq, Show)

losQuePertenecen :: Eq a => [a] -> Set a -> [a]
losQuePertenecen [] cs = []
losQuePertenecen (x:xs) cs = if (belongs x cs)	
									then x : (losQuePertenecen xs cs)
									else losQuePertenecen xs cs
									
sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos xs = setToList (conjuntoSinRepetidos xs)

conjuntoSinRepetidos :: Eq a => [a] -> Set a
conjuntoSinRepetidos [] = emptyS
conjuntoSinRepetidos (x:xs) = if (elem x xs)
								then conjuntoSinRepetidos xs
								else addS x (conjuntoSinRepetidos xs)

unirTodos :: Eq a => Arbol (Set a) -> Set a
unirTodos Vacio = emptyS 
unirTodos (Nodo x ti td) = agregar (setToList x) (unionS (unirTodos ti) (unirTodos td))

agregar :: Eq a => [a] -> Set a -> Set a
agregar [] s 	 = s
agregar (x:xs) s = addS x (agregar xs s)