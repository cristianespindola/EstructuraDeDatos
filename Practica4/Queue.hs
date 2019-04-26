module Queue(Queue, emptyQ, queue, dequeue, firstQ, isEmptyQ, lenQ) where

data Queue a = MkQ [a] Int  deriving (Show,Eq)
--   Tipo        Constructor   Tipo de representacion
--   Abstracto

{- Inv. Rep. 
+ El numero debe ser igual al largo de la Queue
-}

-- MkQ :: [a] -> List a

emptyQ :: Queue a  -- O(1)
emptyQ = MkQ [] 0

queue  :: a -> Queue a -> Queue a -- O(1)
queue x (MkQ xs n) = MkQ (xs ++ [x]) (n+1)

dequeue  :: Queue a -> Queue a -- O(1)
dequeue (MkQ (x:xs) n) = MkQ xs (n-1) 

firstQ  :: Queue a -> a -- O(1)
firstQ (MkQ xs n) = head xs 

isEmptyQ :: Queue a -> Bool -- O(1)
isEmptyQ (MkQ xs n) = n == 0

lenQ :: Queue a -> Int
lenQ (MkQ xs n) = n