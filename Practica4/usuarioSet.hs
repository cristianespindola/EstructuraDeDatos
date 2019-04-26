import Set
data Arbol a =  Nodo a (Arbol a) (Arbol a) | Vacio deriving (Eq, Show)

losQuePertenecen :: Eq a => [a] -> Set a -> [a]
losQuePertenecen [] cs = []
losQuePertenecen (x:xs) cs = if (perteneceC x cs)	
									then x : (losQuePertenecen xs cs)
									else losQuePertenecen xs cs
									
sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos xs = listaC (conjuntoSinRepetidos xs)

conjuntoSinRepetidos :: Eq a => [a] -> Set a
conjuntoSinRepetidos [] = vacioC
conjuntoSinRepetidos (x:xs) = if (elem x xs)
								then conjuntoSinRepetidos xs
								else agregarC x (conjuntoSinRepetidos xs)

unirTodos :: Eq a => Arbol (Set a) -> Set a
unirTodos Vacio = vacioC 
unirTodos (Nodo x ti td) = addS x (unionC (unirTodos ti)(unirTodos td))
