module QueueCM(Queue, emptyQ, isEmptyQ, queue, dequeue, firstQ, isEmptyQ, largoQ) where

data Queue a = MkQ [a] [a] Int (Maybe a)  deriving (Show,Eq)
--   Tipo        Constructor   Tipo de representacion
--   Abstracto

{- Inv. Rep. 
+ El numero debe ser igual al largo de la Queue
-}

-- MkQ :: [a] -> List a

emptyQ :: Queue a  -- O(1)
emptyQ = MkQ [] [] 0 Nothing

queue  :: Ord a => a -> Queue a -> Queue a -- O(1)
queue x (MkQ [] _ _ n) 			= MkQ [x] [] 1 (Just x)
queue x (MkQ xs ys s (Just n))  = MkQ xs (x:ys) (s+1) (Just(max x n))

dequeue  :: Queue a -> Queue a -- O(1)
dequeue (MkQ [x] ys n m) 	= MkQ (reverse ys) [] (n-1) m
dequeue (MkQ (x:xs) ys n m) = MkQ xs ys (n-1) m

firstQ  :: Queue a -> a -- O(1)
firstQ (MkQ xs ys n m) = head xs 

isEmptyQ :: Queue a -> Bool -- O(1)
isEmptyQ (MkQ xs ys n m) = n == 0

largoQ :: Queue a -> Int
largoQ (MkQ xs ys n m) = n