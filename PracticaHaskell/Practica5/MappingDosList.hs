module MappingDosList(Map, emptyM, assocM, deleteM, lookupM, domM) where

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
emptyM                  = ConsM [] []                   -- O(1)
assocM  (ConsM ks vs) k v = ConsM (assocK ks k) (assocV vs (indice ks k) v)    -- O(n), porque assocRep es O(n)
deleteM (ConsM ks vs) k   = ConsM (deleteK ks k) (deleteV (indice k ks)vs k)     -- O(n), porque deleteRep es O(n)
lookupM (ConsM ks vs) k   = lookupRep ks vs k             -- O(n), porque lookupRep es O(n)
domM    (ConsM ks vs)     = ks                  -- O(n), porque es O(n)

--------------                 
-- Funciones auxiliares de representacion
--------------
assocK :: Eq k => [k] -> k -> [k]
-- PROPOSITO: agrega (o reemplaza) el valor de v asociado a la clave k. La lista resultado NO tiene claves repetidas
-- PRECOND: la lista argumento no tiene claves repetidas
-- EFICIENCIA: O(n) 
assocK []     e  = [e]
assocK (k:ks) e  = if(e == k)
						then e:ks
						else k: assocK ks e v

assocV :: Eq v => Int -> v -> [v] -> [v]
assocV 0 e xs		= (e:xs)
assocV n e (x:xs) 	= x:assocV (n-1) e xs

indice :: Eq v => v -> [v] -> Int 
indice e []		= 0
indice e (x:xs)	= if(x==e)
					then 0
					else 1 + indice e xs

deleteK :: Eq k => k -> [k] -> [k]
-- PROPOSITO: la clave k no aparece en la lista resultante
-- PRECOND: la lista argumento no tiene claves repetidas
-- EFICIENCIA: O(n)
deleteK e []     = []
deleteK e (k:ks) = if(k == e)
						then ks
						else k: deleteK e ks 

deleteV :: Eq v => Int -> v -> [v] -> [v]
deleteV 0 _ (x:xs) = xs
deleteV n v (x:xs) = x:deleteV (n-1) v xs

lookupRep :: Eq k => k -> [k] -> [v]  -> Maybe v
-- PROPOSITO: retorna el valor asociado a k en la lista, si existe
-- PRECOND: la lista argumento no tiene claves repetidas
-- EFICIENCIA: O(n)
lookupRep e [] _		= Nothing
lookupRep e (k:ks) (v:vs) = if(k == e)
							then Just v
							else buscar e ks vs
