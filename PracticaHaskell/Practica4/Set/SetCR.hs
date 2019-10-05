module SetCR(Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList) where

data Set a = MKS [a] deriving (Show) 
-- Set Con Repetidos
-- el TIPO DE REPRESENTACIÓN 
  -- INV.REP.: NINGUNO! Toda lista es aceptable.	

--O(1)
-- Crea un Set vacío.
emptyS :: Set a 
emptyS = MKS []

--O(1)
--Dados un elemento y un Set, agrega el elemento al Set.
addS :: Eq a => a -> Set a -> Set a
addS x (MKS xs) =  MKS (x:xs) 

--O(n)
--Dados un elemento y un Set indica si el elemento pertenece al Set.
belongs :: Eq a => a -> Set a -> Bool
belongs x (MKS xs) = elem x xs

--O(n*2)
--Devuelve la cantidad de elementos distintos de un Set
sizeS :: Eq a => Set a -> Int
sizeS (MKS xs)  = length ( listaSinRepetidos xs)

listaSinRepetidos :: Eq a => [a] -> [a]
listaSinRepetidos [] = []
listaSinRepetidos (x:xs) = if elem x xs
				then listaSinRepetidos xs
				else x:(listaSinRepetidos xs)

--O(n)
--Devuelve el Set sin ese elemento
removeS :: Eq a => a -> Set a -> Set a
removeS n (MKS xs) = MKS (borrar n xs)

borrar :: Eq a => a -> [a] -> [a]
borrar n []		= []
borrar n (x:xs) = if n == x
					then borrar n xs
					else x : borrar n xs

--O(n)
--Dados dos Sets devuelve un Set con todos los elementos de ambos Sets.
unionS :: Eq a => Set a -> Set a -> Set a
unionS (MKS xs) s = agregar xs s

agregar :: Eq a => [a] -> Set a -> Set a
agregar [] s = s
agregar (x:xs) s = addS x (agregar xs s)

--O(n*2)
--Dados dos conjuntos devuelve un conjunto con todos los elementos en común entre ambos.
intersectionS :: Eq a => Set a -> Set a -> Set a
intersectionS s (MKS xs) = intersectionL xs s 

intersectionL :: Eq a => [a] -> Set a -> Set a 
intersectionL [] s 	= emptyS
intersectionL (x:xs) s = if belongs x s 
							then addS x (intersectionL xs s)
							else intersectionL xs s

--O(n*2)
--Dado un Set devuelve una lista con todos los elementos distintos del Set.
setToList :: Eq a => Set a -> [a]
setToList (MKS xs) = listaSinRepetidos xs
