module MAPBST(Map, emptyM, assocM,lookupM, deleteM, domM, pertenece) where 

import BST as Bst

data Map k v = M (Bst(k,v)) deriving Show

--Inv Rep.
	-- es Bst => t = BodeT x t1 t2
--					elems t1 < x && elems t2 > x
--					t1 y t2 son Bst
--O(1)
emptyM :: Map k v
emptyM = M Vacio

--O(n^2)
assocM :: Eq k => Map k v -> k -> v -> Map k v
assocM (M t) k v = agregar t k v 

agregar :: Eq k => Bst -> k -> v -> Bst
agregar Vacio k v = NodeT (k,v) Vacio Vacio 
agregar (NodeT x t1 t2) k v = if(k == fst x)
								then NodeT (k,v) t1 t2  
								else if(k < fst x)
										then NodeT x (agregar t1 k v) t2
										else NodeT x t1 (agregar t2 k v)
--O(n)
lookupM :: Eq k => Map k v -> k -> Maybe v
lookupM (M t) k = buscar k t

buscar :: Eq k => Bst -> k -> Maybe v
buscar Vacio k = Nothing
buscar (NodeT x t1 t2) k = if(x == k) 
							then Just snd x 
							else if (k < fst x
								then buscar t1 k
								else buscar t2 k

--O(n)
deleteM :: Eq k => Map k v -> k -> Map k v
deleteM (M t) k = M (sacar t k)

sacar :: Eq k => Bst -> k -> Bst
sacar Vacio k = error "no se puede borrar"
sacar (NodeT x t1 t2) k = if(x == fst k) 
							then subirMayor t1 t2 
							else if (x < fst k)
									then NodeT x (sacar t1 k) t2
									else NodeT x t1 (sacar t2 k)

subirMayor Vacio t2 = t2
subirMayor t1 t2 = NodeT (maxT t1) (sacarMax t1) t2

maxT Vacio = erro ""
maxT (NodeT x t1 Vacio) = x
maxT (NodeT x t1 t2) = maxT t2

sacarMax (NodeT x t1 Vacio) = t1
sacarMax (NodeT x t1 t2) = NodeT x t1 (sacarMax t2)

--O(n)
domM :: Map k v -> [k]
domM (M t) = domT t

domT Vacio = []
domT (NodeT x t1 t2) = fst x : (domT t1 ++ domT t2)