data a = Nothing | Just a

--Versión de head que es total
headM :: [a] -> Maybe a
headM []	 = Nothing
headM (x:xs) = Just x

lastM :: [a] -> Maybe a
--Dada una lista, devuelve su último elemento.
lastM []	 = Nothing
lastM [x]	 = Just x
lastM (x:xs) = lastM xs

maximumM :: Ord a => [a] -> Maybe a
--Dada una lista de elementos devuelve el máximo.
maximumM []		= Nothing
maximumM (x:xs) = maxM (Just x) (maximumM xs)

maxM :: Ord a => Maybe a -> Maybe a -> Maybe a
maxM Nothing y			= y
maxM x Nothing			= x
maxM (Just x) (Just y) 	= Just (max x y)

initM :: [a] -> Maybe [a]
--Dada una lista quita su último elemento.
initM []	 = Nothing
initM [x] 	 = Just []
initM (x:xs) = initM xs

get :: Int -> [a] -> Maybe a
--Dado un índice devuelve el elemento de esa posición.
get _ []	 = Nothing
get 0 (x:xs) = Just x
get n (x:xs) = get (n-1) xs

indiceDe :: Eq a => a -> [a] -> Maybe Int
--Dado un elemento y una lista devuelve la posición de la lista en la que se encuentra dicho elemento.
indiceDe _ []		= Nothing
indiceDe e (x:xs)	= if( e == x)
						then Just 0
						else sumarM (indiceDe e xs)

sumarM :: Maybe Int -> Maybe Int
sumarM Nothing  = Nothing
sumarM (Just n) = Just (n+1)

lookupM :: Eq k => [(k,v)] -> k -> Maybe v
--Dada una lista de pares (clave, valor) y una clave devuelve el valor asociado a la clave.
lookupM [] e 		 = Nothing
lookupM ((x,y):xs) e = if(x == e)
						then Just y
						else lookupM xs e

fromJusts :: [Maybe a] -> [a]
--Devuelve los valores de los Maybe que no sean Nothing.
fromJusts []	 = []
fromJusts (x:xs) = if(isNothing x)
					then fromJusts xs
					else fromJust x : fromJusts xs

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _ 	 = False

minT :: Ord a => Tree a -> Maybe a
--Dado un árbol devuelve su elemento mínimo.
minT EmptyT = Nothing
minT (NodeT x EmptyT EmptyT) = Just x
minT (NodeT x t1 t2) = minN (Just x)(minN (minT t1) (minT t2))

minN :: Maybe a -> Maybe a -> Maybe a
minN Nothing y			= Just y
minN x Nothing 			= Just x
minN (Just x) (Just y) 	= Just (min x y)