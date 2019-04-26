module StackM(Stack, emptyS, isEmptyS, push, top, pop, maxS) where

data Stack a = ConsS [a] [a]

-- Inv. Rep.:
-- maximum xs == head ms
-- length xs  == length ms

emptyS :: Stack a -- O(1)
emptyS = ConsS [] []

isEmptyS :: Stack a -> Bool -- O(1)
isEmptyS (ConsS xs ms) = null ms

push :: Ord a => a -> Stack a -> Stack a -- O(1)
push x (ConsS xs ms) = ConsS (x:xs) (actualizar x ms)

-- Prec. ms a lo sumo tiene un elemento
actualizar x []  = [x]
actualizar x ms = max x (head ms) : ms

-- Prec. parcial en pila vacia
top :: Stack a -> a -- O(1)
top (ConsS xs ms) = head xs

maxS :: Ord a => Stack a -> Quizas a -- O(1)
maxS (ConsS xs ms) = head ms

{-
-- Prec. parcial en pila vacia
maxS :: Ord a => Stack a -> Quizas a -- O(1)
maxS (ConsS xs ms) = if null ms
	                    then Nada
	                    else Resultado (head ms)
-}

-- Prec. parcial en pila vacia
pop :: Stack a -> Stack a -- O(1)
pop (ConsS xs ms) = ConsS (tail xs) 
                          (tail ms)
                          -- [maximum (tail xs)]