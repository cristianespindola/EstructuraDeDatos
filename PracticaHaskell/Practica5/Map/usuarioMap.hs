import MappingSinRep

buscarClaves :: Eq k => [k] -> Map k v -> [Maybe v]
--Busca todas las claves dadas en la lista.
buscarClaves [] 	m = []
buscarClaves (x:xs) m = lookupM m x: buscarClaves xs m

estanTodas :: Eq k => [k] -> Map k v -> Bool
--Indica si en el map se encuenrtan todas las claves dadas.
estanTodas s m = estan s (domM m)

estan:: Eq a => [a] -> [a] -> Bool
estan []	 _  = True
estan (x:xs) ys = elem x ys && estan xs ys

actualizarClaves :: Eq k => [(k, v)] -> Map k v -> Map k v
--Actualiza todas las claves dadas por las primeras componentes con los valores de las segundas componentes de cada par.
actualizarClaves [] 	m = emptyM
actualizarClaves (x:xs) m = assocM (actualizarClaves xs m) (fst x) (snd x)

unirDoms :: Eq k => [Map k v] -> [k]
--Une los doms de una lista de maps. En el resultado no hay claves repetidas.
unirDoms  []   = []
unirDoms (x:xs)= domM x ++ unirDoms xs

mapSuccM :: Eq k => [k] -> Map k Int -> Map k Int
--Dada una lista de claves de tipo k y un mapa que va de k a int, le suma uno a cada número asociado con dichas claves.
mapSuccM []		m = emptyM
mapSuccM (x:xs) m = if(isNothing(lookupM m x))
					then mapSuccM xs m
					else assocM (mapSuccM xs m) x (fromJust(lookupM m x) + 1)

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _ = False

fromJust :: Maybe a -> a
fromJust (Just x) = x 

agregarMap:: Eq k => Map k v -> Map k v -> Map k v
--Dado dos maps se agregan las claves y valores del primer map en el segundo. Si una clave del primero existe en el segundo, es reemplazada por la del primero.
agregarMap m1 m2 = agregar (domM m1) m1 m2

agregar:: Eq k => [k] -> Map k v -> Map k v -> Map k v
agregar []		m1 m2 = m2
agregar (x:xs)  m1 m2 = assocM (agregar xs m1 m2) x (fromJust(lookupM m1 x))

----------------------------------------------------------------------------------------------

--Dada una lista de elementos construye un Map que relaciona cada elemento 
--con su posición en la lista.
indexar :: [a] -> Map Int a
indexar xs = index xs 0

index :: [a] -> Int -> Map Int a 
index [] n = emptyM 
index (x:xs) n = assocM (index xs (n+1)) n x 

ocurrencias :: String -> Map Char Int
--Dado un string cuenta las ocurrencias de cada caracter utilizando un Map.
ocurrencias []	 	= emptyM
ocurrencias (x:xs) 	= agregar' x (ocurrencias xs)

agregar' :: Char -> Map Char Int -> Map Char Int
agregar' c m = assocM m c (masUno (lookupM m c))	

masUno :: Maybe Int -> Int
masUno Nothing = 1
masUno (Just x) = x +1