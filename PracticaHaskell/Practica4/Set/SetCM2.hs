module SetCM2(Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList, maximoC) where

data Set a = MKS [a] [a] Int deriving (Show) 
-- Set Sin Repetidos
-- el TIPO DE REPRESENTACIÓN 
  -- INV.REP.: NINGUNO! Toda lista es aceptable.	

--O(1)
-- Crea un Set vacío.
emptyS :: Set a 
emptyS = MKS [] [] 0

--O(n*2)
--Dados un elemento y un Set, agrega el elemento al Set.
addS :: Ord a => a -> Set a -> Set a
addS x (MKS xs ys n) = if elem x xs
                    then MKS xs ys n
					else MKS (x:xs) (actualizarMax x ys) (n+1)

-- Prec. ms a lo sumo tiene un elemento
actualizarMax :: Ord a => a -> [a] -> [a]
actualizarMax x []  = [x]
actualizarMax x ms = max x (head ms) : ms

--O(n)
--Dados un elemento y un Set indica si el elemento pertenece al Set.
belongs :: Eq a => a -> Set a -> Bool
belongs x (MKS xs _ n) = elem x xs

--O(1)
--Devuelve la cantidad de elementos distintos de un Set
sizeS :: Eq a => Set a -> Int
sizeS (MKS xs _ n)  = n

--O(n)
--Devuelve el Set sin ese elemento
removeS :: Eq a => a -> Set a -> Set a
removeS e (MKS xs (y:ys) n) = MKS (borrar e xs) ys (n+1)

borrar :: Eq a => a -> [a] -> [a]
borrar n []		= []
borrar n (x:xs) = if n == x
					then borrar n xs
					else x : borrar n xs

--O(n*2)
--Dados dos Sets devuelve un Set con todos los elementos de ambos Sets.
unionS :: Ord a => Set a -> Set a -> Set a
unionS (MKS xs mx n) s = agregar xs s

agregar :: Ord a => [a] -> Set a -> Set a
agregar [] s = s
agregar (x:xs) s = addS x (agregar xs s)

--O(n*2)
--Dados dos conjuntos devuelve un conjunto con todos los elementos en común entre ambos.
intersectionS :: Ord a => Set a -> Set a -> Set a
intersectionS s (MKS xs mx n) = agregarI xs s

agregarI :: Ord a => [a] -> Set a -> Set a
agregarI [] s = emptyS
agregarI (x:xs) s = if(belongs x s)
					then addS x (agregarI xs s)
					else agregarI xs s

--O(1)
--Dado un Set devuelve una lista con todos los elementos distintos del Set.
setToList :: Eq a => Set a -> [a]
setToList (MKS xs _ _) = xs

--Devuelve el máximo elemento en un conjunto
maximoC :: Ord a => Set a -> a
maximoC (MKS _ (y:ys) _) = y