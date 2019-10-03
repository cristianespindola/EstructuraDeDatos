module MappingSinRep(Map, emptyM, assocM, deleteM, lookupM, domM) where

data Map clave valor = ConsM [ (clave, valor) ]
                      {- INV.REP.: no hay claves repetidas en la lista -}
                      
--------------                 
-- INTERFAZ
--   OBS: * se necesita que las claves se puedan comparar por (==) para evitar repetidos
--        * llamamos n al número de claves almacenadas
--------------                 
emptyM  :: Map k v
assocM  :: Eq k => Map k v -> k -> v -> Map k v
deleteM :: Eq k => Map k v -> k -> Map k v
lookupM :: Eq k => Map k v -> k -> Maybe v 
domM    :: Eq k => Map k v -> [ k ] -- La lista resultante NO tiene repetidos

--------------                 
-- Implementacion
--------------                 
emptyM                  = ConsM []                    -- O(1)
assocM  (ConsM kvs) k v = ConsM (assocRep kvs k v)    -- O(n), porque assocRep es O(n)
deleteM (ConsM kvs) k   = ConsM (deleteRep kvs k)     -- O(n), porque deleteRep es O(n)
lookupM (ConsM kvs) k   = lookupRep kvs k             -- O(n), porque lookupRep es O(n)
domM    (ConsM kvs)     = domRep kvs                  -- O(n), porque es O(n)

--------------                 
-- Funciones auxiliares de representacion
--------------
assocRep :: Eq k => [(k,v)] -> k -> v -> [(k,v)]
-- PROPOSITO: agrega (o reemplaza) el valor de v asociado a la clave k. La lista resultado NO tiene claves repetidas
-- PRECOND: la lista argumento no tiene claves repetidas
-- EFICIENCIA: O(n) 
assocRep []       k v = [(k,v)]
assocRep (kv:kvs) k v = if(k == fst kv)
						then (k,v):kvs
						else kv: assocRep kvs k v

deleteRep :: Eq k => [(k,v)] -> k -> [(k,v)]
-- PROPOSITO: la clave k no aparece en la lista resultante
-- PRECOND: la lista argumento no tiene claves repetidas
-- EFICIENCIA: O(n)
deleteRep []       k v = []
deleteRep (kv:kvs) k v = if(k == fst kv)
						then kvs
						else kv: deleteRep kvs k v

lookupRep :: Eq k => [(k,v)] -> k -> Maybe v
-- PROPOSITO: retorna el valor asociado a k en la lista, si existe
-- PRECOND: la lista argumento no tiene claves repetidas
-- EFICIENCIA: O(n)
lookupRep [] _		= Nothing
lookupRep (kv:kvs) k = if(k == fst kv)
					then Just(snd kv)
					else buscar kvs k

domRep :: Eq k => [(k,v)] -> [ k ]
-- PROPOSITO: retorna la lista de claves, sin repetidos
-- PRECOND: la lista argumento no tiene claves repetidas
-- EFICIENCIA: O(n)
domRep [] 		= []
domRep (kv:kvs) =  fst kv: domRep kvs
