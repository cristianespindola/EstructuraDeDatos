module Set(Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList) where

data Set a = MKS [a] deriving (Show) 
-- Set Con Repetidos
-- el TIPO DE REPRESENTACIÓN 
  -- INV.REP.: NINGUNO! Toda lista es aceptable.	

-- Crea un Set vacío.
emptyS :: Set a 
emptyS = MKS []

--Dados un elemento y un Set, agrega el elemento al Set.
addS :: Eq a => a -> Set a -> Set a
addS x (MKS xs) =  MKS (x:xs) 

{-
--implementacion de addS Sin repetidos
addS :: Eq a => a -> Set a -> Set a
addS x (MKS xs) = if elem e es
                    then MKS xs
					else MKS (x:xs) 
-}

--Dados un elemento y un Set indica si el elemento pertenece al Set.
belongs :: Eq a => a -> Set a -> Bool
belongs x (MKS xs) = elem x xs

--Devuelve la cantidad de elementos distintos de un Set
sizeS :: Eq a => Set a -> Int
sizeS (MKS xs)  = length ( listaSinRepetidos xs)

listaSinRepetidos :: Eq a => [a] -> [a]
listaSinRepetidos [] = []
listaSinRepetidos (x:xs) = if elem x xs
				then listaSinRepetidos xs
				else x:(listaSinRepetidos xs)

{-
-- implementacion de sizeS sin repetidos
sizeS :: Eq a => Set a -> Int
sizeS (MKS xs)  = length xs
-}

--Devuelve el Set sin ese elemento
removeS :: Eq a => a -> Set a -> Set a
removeS n (MKS xs) = MKS (borrar n xs)

borrar :: Eq a => a -> [a] -> [a]
borrar n []		= []
borrar n (x:xs) = if n == x
					then borrar n xs
					else x : borrar n xs

--Dados dos Sets devuelve un Set con todos los elementos de ambos Sets.
unionS :: Eq a => Set a -> Set a -> Set a
unionS (MKS xs) (MKS ys) = (MKS (xs ++ ys))

--Dados dos conjuntos devuelve un conjunto con todos los elementos en común entre ambos.
intersectionS :: Eq a => Set a -> Set a -> Set a
intersectionS (MKS xs) (MKS []) 	= MKS xs
intersectionS (MKS xs) (MKS (y:ys)) = if elem y xs
											then intersectionS (MKS xs) (MKS ys)
											else intersectionS (MKS (y:xs)) (MKS ys)

--Dado un Set devuelve una lista con todos los elementos distintos del Set.
setToList :: Eq a => Set a -> [a]
setToList (MKS xs) = listaSinRepetidos xs

{-
-- implementacion de setToList sin repetidos
setToList :: Eq a => Set a -> [a]
setToList (MKS xs) = listaSinRepetidos xs

-}