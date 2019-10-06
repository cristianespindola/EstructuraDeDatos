module MappingSinRep(Map, emptyM, assocM,lookupM, deleteM, domM, pertenece) where 

data Map k v = M [(k,v)] deriving Show

--O(1)
emptyM :: Map k v
emptyM = M []

--O(n^2)
assocM :: Eq k => Map k v -> k -> v -> Map k v
assocM (M xs) k v = if(pertenece k (domM (M xs))) then (M xs) else M ((k,v):xs)

--O(n)
lookupM :: Eq k => Map k v -> k -> Maybe v
lookupM (M []) k = Nothing
lookupM (M ((k, v):xs)) key = if(k == key) then Just v else lookupM (M xs) key

--O(n)
deleteM :: Eq k => Map k v -> k -> Map k v
deleteM (M []) key = (M [])
deleteM (M ((k, v):xs)) key = if(k == key) then (M xs) else assocM (deleteM (M xs) key) k v 

--O(n)
domM :: Map k v -> [k]
domM (M []) = []
domM (M ((k, v):xs)) = k : domM(M xs)

--O(n)
pertenece :: Eq a => a -> [a] -> Bool
pertenece a [] = False
pertenece a (x:xs) = a == x || pertenece a xs