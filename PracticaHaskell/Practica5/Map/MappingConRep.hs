module MappingConRep(Map, emptyM, assocM, deleteM, lookupM, domM) where

data Map clave valor = ConsM [ (clave, valor) ]
                      
--------------                 
-- INTERFAZ
--   OBS: * se necesita que las claves se puedan comparar por (==) para buscar. 
--           El resto de las funciones lo tienen por compatibilidad con las otras implementaciones
--        * llamamos n al número de claves almacenadas y m al número de veces que se agregan o borran claves
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
assocM  (ConsM kvs) k v = ConsM ((k,v):kvs)   -- O(1), porque assocRep es O(1)
deleteM (ConsM kvs) k   = ConsM (deleteRep kvs k)     -- O(m), porque deleteRep es O(m)
lookupM (ConsM kvs) k   = lookupRep kvs k             -- O(m), porque lookupRep es O(m)
domM    (ConsM kvs)     = domRep kvs                  -- O(m^2), porque domRep es O(m^1)

--------------                 
-- Funciones auxiliares de representacion
--------------
deleteRep :: Eq k => [(k,v)] -> k -> [(k,v)]
-- PROPOSITO: la clave k no aparece en la lista resultante
-- EFICIENCIA: O(m)
deleteRep []       k = []
deleteRep (kv:kvs) k = if(fst kv == k) 
							then kvs
							else kv:(deleteRep kvs k) 


lookupRep :: Eq k => [(k,v)] -> k -> Maybe v
-- PROPOSITO: retorna el primer valor asociado a k en la lista, si existe
-- EFICIENCIA: O(m)
lookupRep [] _		= Nothing
lookupRep (kv:kvs) k = if(k == fst kv)
					then Just(snd kv)
					else lookupRep kvs k

domRep :: Eq k => [(k,v)] -> [ k ]
-- PROPOSITO: retorna la lista de claves, sin repetidos
-- EFICIENCIA: O(m^2)
domRep []		= []
domRep ((k,v):kvs)	= if(perteneceK k kvs)
					then domRep kvs
					else k:domRep kvs

perteneceK :: Eq k => k-> [(k,v)] -> Bool
perteneceK x []		= False
perteneceK x (y:ys) = x == fst y || perteneceK x ys