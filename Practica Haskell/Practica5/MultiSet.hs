module MultiSet(MSet, vacio, agregar, eliminar, cuantosHay, elems) where

import MappingSinRep as Map
--import MappingConRep as Map -- Si usásemos esta implementación, la eficiencia sería otra!!!!!

data MSet a = MS (Map a Int)
                 {- INV.REP.: el map NO guarda valores <= 0 -}
--------------                 
-- INTERFAZ   
--   OBS: * Se necesita que a pueda usar (==) para ver repetidos
--        * Llamamos n al número de elementos diferentes que hay en el MultiSet
--------------                 
vacio      :: MSet a
agregar    :: Eq a => a -> MSet a -> MSet a
eliminar   :: Eq a => a -> MSet a -> MSet a
cuantosHay :: Eq a => MSet a -> a -> Int
elems      :: Eq a => MSet a -> [ a ] -- La lista resultante NO tiene repetidos

--------------                 
-- Implementacion
--------------                 
vacio               = MS (Map.emptyM)       -- O(1), porque Map.emptyM es O(1)
agregar    x (MS m) = MS (agregarRep x m)   -- O(n), porque agregarRep es O(n)
eliminar   x (MS m) = MS (eliminarRep x m)  -- O(n), porque eliminarRep es O(n) 
cuantosHay (MS m) x = cuantosHayRep x m     -- O(n), porque cuantosHayRep es O(n)
elems (MS m)        = elemsRep m            -- O(n), porque elemsRep es O(n)

--------------                 
-- Funciones auxiliares de representacion
--------------                 
agregarRep :: Eq a => a -> Map a Int -> Map a Int
-- PROPOSITO: agrega el elemento al map, para que haya uno más
-- PRECOND: el map argumento NO guarda valores <= 0
-- EFICIENCIA: O(n), pues usa una vez Map.lookup y una vez Map.assocM, y ambas son O(n)
agregarRep x m = case (Map.lookupM m x) of
                   Nothing -> Map.assocM m x 1       -- 1 es > 0
                   Just n  -> Map.assocM m x (n+1)   -- n+1 es > 0, si n es > 0

eliminarRep :: Eq a => a -> Map a Int -> Map a Int
-- PROPOSITO: elimina el elemento al map, para que haya uno menos, pero NO guarda valores <= 0
-- PRECOND: el map argumento NO guarda valores <= 0
-- EFICIENCIA: O(n), pues usa una vez Map.lookup y una vez o bien Map.deleteM o bien Map.assocM, y todas son O(n)
eliminarRep x m = case (Map.lookupM m x) of
                    Nothing -> m
                    Just n  -> if (n==1)
                                then Map.deleteM m x      -- Si no se considera este caso, guarda un 0 en el map!!!!!!
                                else Map.assocM m x (n-1) -- No guarda 0, porque n>1 (el valor de n NO es <= 0, por precondición)

cuantosHayRep :: Eq a => a -> Map a Int -> Int
-- PROPOSITO: informa la cantidad de veces que el map informa para el elemento, o cero si no está
-- PRECOND: el map argumento NO guarda valores <= 0
-- EFICIENCIA: O(n), pues usa una vez Map.lookupM que es O(n)
cuantosHayRep x m = case (Map.lookupM m x) of
                      Nothing -> 0
                      Just n  -> n

elemsRep :: Eq a => Map a Int -> [ a ]
-- PROPOSITO: da la lista de elementos que están guardados en el map, SIN repetidos
-- PRECOND: el map argumento NO guarda valores <= 0
-- EFICIENCIA: O(n), pues usa una vez Map.domM que es O(n)
elemsRep m = Map.domM m  
             -- NO tiene repetidos, por propiedad de Map.domM
   
