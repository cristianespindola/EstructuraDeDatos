data Color = Rojo | Verde

instance Eq Color where
	(==) Rojo Rojo = True
	(==) Verde Verde = True
	(==) _ _ = False

esRojo :: Color -> Bool
esRojo Rojo = True
esRojo _    = False

esRojo x = x == Rojo

-- sumatoria (1+x) = (1+x) + sumatoria x

sucesor :: Int -> Int
sucesor x = x + 1

maximo :: Int -> Int -> Int
maximo x y = if x > y
                then x
                else y

andLogico :: Bool -> Bool -> Bool
andLogico True True = True
andLogico _    _    = False

--andLogico True False = False
--andLogico False True = False
--andLogico False False = False

primera :: (a, b) -> a
primera (x, y) = x

loMismo :: a -> a
loMismo x = x

loSegundo :: a -> b -> b
loSegundo x y = y

-- fold (devuelve un unico valor)
sumatoriaL :: [Int] -> Int
sumatoriaL [] = 0
sumatoriaL (x:xs) = x + sumatoriaL xs

pertenece :: Eq a => a -> [a] -> Bool
pertenece n [] = False
pertenece n (x:xs) =
	if n == x
	   then True 
	   else pertenece n xs

-- map (mantiene la cantidad)
mapSucesor :: [Int] -> [Int]
mapSucesor []     = []
mapSucesor (x:xs) = x+1 : mapSucesor xs

-- filter (se queda con elementos dado un criterio)
mayoresA :: Int -> [Int] -> [Int]
mayoresA n []     = []
mayoresA n (x:xs) = 
	if n < x 
	   then x : mayoresA n xs
	   else mayoresA n xs

-------------------------
-- prop: Dado un booleano, si es True devuelve False, y si es False devuelve True.
negar :: Bool -> Bool
negar True = False
negar False = True

--prop: Dado dos boobleano si alguno es True devuelve True, sino devuelve False
orLogico :: Bool -> Bool -> Bool
orLogico False False = False
orLogico _ _ = True

--Prop: Dado un par de numeros devuelva la segunda componente
segunda :: (Int , Int) -> Int
segunda (a , b) = b

--Prop: Dado un par numeeros devuelve la sumar
sumarPar :: (Int, Int) -> Int
sumarPar (x,y) = x + y

--Prop: Dado un par de numeros devuelve el mayor de ellos
maxDelPar :: (Int, Int) -> Int
maxDelPar (x,y) = if x > y 
				  then x
				  else y

--Prop: Dado un elemento de algun tipo devuelve el numero 7
siempreSiete :: a -> Int
siempreSiete x = 7

--Prop: Dado un elemento de algun tipo devuelve un par con ese elemento en ambas componentes
duplicar :: a -> (a,a)
duplicar x = (x,x)

--Prop: Dado un elemento de algun tipo devuelve una lista con ese mismo elemento
sigleton :: a -> [a]
sigleton x = [x]

-- prop: Dada una lista de elementos, si es vacia devuelve True, sino devuelve False
isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

-- Prop: Dada una lista devuelve su primer elemento
head' :: [a] -> a
head' [] = error "La lista esta vacia, NO tiene elementos"
head' (x:xs) = x 

--Prop: Dada una lista devuelve esa lista menos el primer elemento
tail :: [a] -> [a]
tail [] = error "La lista esta vacia, No tiene elementos"
tail (x:xs) = xs
-------------------------------------------------------------
--Prop: Dada una lista de enteros devuelve la suma de todos los elementos
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--Prop: Dada un lista de elementos de algun tipo devuelve el largo de esa lista, es decir, la cantidad de elementos que posee
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--Prop: Dada un lista de enteros, devuelve un numero que es el promedio entre todos los elementos de la lista
promedio :: [Int] -> Int
promedio xs = div (sumatoria xs)  (longitud xs) 

--Prop: Dada una lista de pares de enteros, devuelve una nueva lista en la que cada elementos es la suma de los elementos de cada par
mapSumarPar :: [(Int,Int)] -> [Int]
mapSumarPar [] = []
mapSumarPar (x:xs) = sumarPar x : mapSumarPar xs

--Prop: Dada una lista de pares, devuelve una nueva lista en la que cada elemento es la mayor de las componentes de cada par
mapMaxDelPar :: [(Int,Int)] -> [Int]
mapMaxDelPar [] = []
mapMaxDelPar (x:xs) = maxDelPar x : mapMaxDelPar xs

--Prop: Dada una lista de booleanos devuelve True si alguno de sus elementos es True
todoVerdad :: [Bool] -> Bool
todoVerdad [] = True
todoVerdad (x:xs) = andLogico x (todoVerdad xs)

--Prop: Dada una lista de booleanos devuelve True si alguno de sus elementos es True
algunaVerdad :: [Bool] -> Bool
algunaVerdad [] = False
algunaVerdad (x:xs) = orLogico x (algunaVerdad xs)

--Prop: Dados un elemento e y una lista xs cuenta la cantidad de apariciones de e en xs
apariciones :: Eq a => a -> [a] -> Int
apariciones n [] = 0
apariciones n (x:xs) = if n == x
						then 1 + apariciones n xs
						else apariciones n xs

--Prop: Dados un n ́umero n y una lista xs, devuelve todos los elementos de xs que son menores a n.
filtrarMenoresA :: Int -> [Int] -> [Int]
filtrarMenoresA n [] = []
filtrarMenoresA n (x:xs) = if n > x
							then x : (filtrarMenoresA n xs)
							else filtrarMenoresA n xs

--Prop: Dados un elemento y una lista filtra (elimina) todas las ocurrencias de ese elemento en la lista.
filtrarElemento :: Eq a => a -> [a] -> [a]
filtrarElemento e [] = []
filtrarElemento e (x:xs) = if e == x 
							then filtrarElemento e xs
							else x : (filtrarElemento e xs)

--Prop: Dada una lista de listas, devuelve la lista de sus longitudes.
mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x : xs) = (longitud x) : (mapLongitudes xs)

--Prop: Dados un n ́umero n y una lista de listas, devuelve la lista de aquellas listas que tienen mas de n elementos.
longitudMayorA :: Int -> [[a]] -> [[a]]
longitudMayorA n [] = []
longitudMayorA n (x:xs) = if n < longitud x
							then x : (longitudMayorA n xs)
							else longitudMayorA n xs

--Prop: Dado un elemento e y una lista xs, ubica a e entre medio de todos los elementos de xs.
intercalar :: a -> [a] -> [a]
intercalar e [] = []
intercalar e (x:xs) = 	if longitud (x:xs) > 1
						 then x:e : (intercalar e xs)
						else x : (intercalar e xs)

--Prop: Dados una lista y un elemento, devuelve una lista con ese elemento agregado al final de la lista.
snoc :: [a] -> a -> [a]
snoc [] e = []
snoc (x:xs) e = if longitud (x:xs) == 1
				then x:e : (snoc xs e)
				else x : (snoc xs e)

--Prop: Dadas dos listas devuelve la lista con todos los elementos de la primera lista y todos los elementos de la segunda a continuacion.
append :: [a] -> [a] -> [a]
append (xs) (ns) = xs ++ ns

--Prop: Dada una lista de listas, devuelve una  ́unica lista con todos sus elementos.
aplanar :: [[a]] -> [a]
aplanar [] = []
aplanar (ns:xs) = ns ++ aplanar xs

--Prop: Dada una lista devuelve la lista con los mismos elementos de atr ́as para adelante.
reversa :: [a] -> [a]
reversa [] = []
reversa xs = reverse xs

--Prop: Dadas dos listas de enteros, devuelve una lista donde el elemento en la posici ́on n es el maximo entre el elemento n de la primera lista y de la segunda lista, teniendo en cuenta que las listas no necesariamente tienen la misma longitud.
zipMaximos :: [Int] -> [Int] -> [Int]
zipMaximos [] [] = []
zipMaximos ns [] = ns
zipMaximos [] xs = xs
zipMaximos (n:ns) (x:xs) = maximo n x : zipMaximos ns xs

--Prop: Dadas dos lista de enteros de igual longitud, devuelve una lista de pares (min, max), donde min y max son el minimo y maximo entre los elementos de ambas listas en la misma posicion
zipSort :: [Int] -> [Int] -> [(Int, Int)]
zipSort [] [] = []
zipSort (n:ns) (x:xs) = if maxDelPar(n,x) == n
						then (x,n) : zipSort ns xs
						else (n,x) : zipSort ns xs

--------------------------------------------------------------------------------------------

--Prop: Dado un numero n se devuelve la multiplicacion de este numero y todos sus anteriores hasta llegar a 0. Si n es 0 devuelve 1. La funcion en parcial si n es negativo
factorial :: Int -> Int
factorial 0 = 1
factorial n = if n < 0
				then error "numero Negativo"
				else n * (factorial (n-1))

--Prop: Dado un numero n devuelve una lista cuyos elementos sean los numeros comprendidos entre n y 1 (incluidos). Si n es 0 devuelve una lista vacia.
cuentaRegresiva :: Int -> [Int]
cuentaRegresiva 0 = []
cuentaRegresiva n = n : cuentaRegresiva (n-1)

--Prop: Dado un numero n devuelve una lista cuyos elementos sean los numeros entre 1 y n (incluidos).
contarHasta :: Int -> [Int]
contarHasta 0 = []
contarHasta n = n : contarHasta (n-1)

--Prop: Dado un numero n y un elemento e devuelve una lista en la que el elemento e repite n veces.
replicarN :: Int -> a -> [a]
replicarN 0 e = []
replicarN n e = e : replicarN (n-1) e

--Prop: Dados dos numeros n y m devuelve una lista cuyos elementos sean los numeros entre n y m(incluidos).
desdeHasta :: Int -> Int -> [Int]
desdeHasta x n = if x == n
					then [x]
					else x : desdeHasta (x+1) n

--Prop: Dados un numero n y una lista xs, devuelve una lista con los primeros n elementos de xs. Si xs posee menos de n elementos, se devuelve la lista completa.
takeN :: Int -> [a] -> [a]
takeN 0 _ = []
takeN _ [] = []
takeN n (x:xs) = if n > longitud (x:xs)
				then (x:xs)
				else x : takeN (n-1) xs

--Prop: Dados un numero n y una lista xs, devuelve una lista sin los primeros n elementos de lista recibida. Si la lista posee menos de n elementos, se devuelve una lista vacia.
dropN :: Int -> [a] -> [a]
drpoN _ [] = []
dropN 0 xs = xs
dropN n (x:xs) = if n > longitud (x:xs)
				then []
				else dropN(n-1)xs

--Prop: Dados un numero n y una lista xs, devuelve un par donde la primera componente es la lista que resulta de aplicar takeN a xs, y la seguna componente el resultado de aplicar dropN a xs.
splitN :: Int -> [a] -> ([a], [a])
splitN n xs = (takeN n xs, dropN n xs)

agruparDeA :: Int -> [a] -> [[a]]
agruparDeA _ [] = []
agruparDeA n xs = if n > longitud xs
					then [xs]
					else takeN n xs : agruparDeA n (dropN n xs)

particionPorSigno :: [Int] -> ([Int],[Int])
particionPorSigno xs = (numerosPositivos xs, numerosNegativos xs)

numerosPositivos :: [Int] -> [Int]
--numerosPositivos [] = []
numerosPositivos (x:xs) = if x >= 0 
							then x : (numerosPositivos xs)
							else numerosPositivos xs

numerosNegativos :: [Int] -> [Int]
numerosNegativos [] = []
numerosNegativos (x:xs) = if x < 0
							then x : (numerosNegativos xs)
							else numerosNegativos xs

particionPorParidad :: [Int] -> ([Int],[Int])
particionPorParidad [] = ([],[])
particionPorParidad (x:xs) = ubicarPorSigno x (particionPorParidad xs)

ubicarPorSigno :: Int -> ([Int], [Int]) -> ([Int], [Int])
ubicarPorSigno x (ns, ps) =
    if x >= 0
       then (ns, x:ps)
       else (x:ns, ps)

subtails :: [a] -> [[a]]
subtails [] = []
subtails (x:xs) = (x:xs) : subtails (xs)


-- Prec. Dada una lista xs devuelve una lista de listas donde cada sublista contiene elementos contiguos iguales de xs.
agrupar :: Eq a => [a] -> [[a]]
agrupar []		= []
agrupar (x:xs)	= agregar x (agrupar xs)

agregar :: Eq a => a -> [[a]] -> [[a]]
agregar e []	 = [[e]]
agregar e (xs:xss) = if (e == head' xs)
						then (e:xs):xss
						else [e]:xs:xss

--Devuelve T rue si la primera lista es prefijo de la segunda.
esPrefijo :: Eq a => [a] -> [a] -> Bool
esPrefijo [] [] = True
esPrefijo xs [] = False
esPrefijo [] ys = True
esPrefijo (x:xs) (y:ys) = x == y && esPrefijo xs ys

--Devuelve T rue si la primera lista es sufijo de la segunda.
esSufijo :: Eq a => [a] -> [a] -> Bool
esSufijo xs ys = esPrefijo (reverse xs) (reverse ys)

-- Prec. xs tiene elementos
minimo :: [Int] -> Int
minimo [] = error "no tiene elementos"
minimo (x:[]) = x
minimo (x:xs) = 
    min x (minimo xs)

-- Alternativa
--  if x < minimo xs
--      then x
--      else minimo xs

maxLista :: [Int] -> Int
maxLista [] = error "no tiene elementos"
maxLista (x:[]) = x
maxLista (x:xs) = 
    max x (maxLista xs)
-- Prec. xs tiene elementos
splitMin :: [Int] -> (Int, [Int])
splitMin xs = 
    (minimo xs, listaSinNum (minimo xs) xs)

listaSinNum :: Int -> [Int] -> [Int]
listaSinNum n [] = []
listaSinNum n (x:xs) = 
    if n == x
        then xs
        else x : listaSinNum n xs