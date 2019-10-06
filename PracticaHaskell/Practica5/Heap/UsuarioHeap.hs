import Heap

heapList :: Heap a -> [a]
heapList h = if (isEmptyH h)
				then []
				else findMinH h : heapList (deleteMin h)

ordenar:: Ord a => [a] -> [a],
ordenar hs = heapList (listToHeap hs)

listToHeap :: [a] -> Heap a 
listToHeap [] = isEmptyH
listToHeap (x:xs) = insertH x (listToHeap xs)