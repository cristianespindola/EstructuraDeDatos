data Dir = Norte | Sur | Este | Oeste

-- Dada una dirección devuelve su opuesta
opuesto :: Dir -> Dir
opuesto Norte = Sur
opuesto Sur   = Norte
opuesto Oeste = Este
opuesto Este  = Oeste

-- Dada una dirección devuelve su siguiente, en sentido horario.
siguiente :: Dir -> Dir
siguiente Norte = Este
siguiente Este = Sur
siguiente Sur = Oeste
siguiente Oeste = Norte

--------------------------------------------------

data Persona = ConsP String Int deriving (Eq, Show)

persona :: Persona
persona = ConsP "Pepe" 10
persona2 = ConsP "Pepa" 11

-- Devuelve el nombre de una persona
nombre :: Persona -> String
nombre (ConsP n e) = n

-- Devuelve la edad de una persona
edad :: Persona -> Int
edad (ConsP n e) = e

-- Dada una persona la devuelve con su edad aumentada en 1.
crecer :: Persona -> Persona
crecer (ConsP n e) = ConsP n (e+1) 

-- Dados un nombre y una persona, reemplaza el nombre de la persona por este otro.
cambioDeNombre :: String -> Persona -> Persona
cambioDeNombre nuevo (ConsP _ e) = ConsP nuevo e

-- Dadas dos personas indica si la primera es más joven que la segunda.
esMenorQueLaOtra :: Persona -> Persona -> Bool
esMenorQueLaOtra p1 p2 = edad p1 < edad p2

-- Dados una edad y una lista de personas devuelve todas las personas que son mayores a esa edad.						
mayoresA :: Int -> [Persona] -> [Persona]
mayoresA n []	  = []	
mayoresA n (p:ps) =	if edad p > n
					then p : mayoresA n ps
					else  mayoresA n ps

-- Dada una lista de personas devuelve el promedio de edad entre esas personas. 
-- Prec: La lista al menos posee una persona.
promedioEdad :: [Persona] -> Int
promedioEdad ps = div (edades ps) (length ps) 

-- Dada una lista de personas devuelve la suma de todas las edades de las persona
edades :: [Persona] -> Int
edades []     = 0
edades (p:ps) = edad p + edades ps

-- Dada una lista de personas devuelve la persona más vieja de la lista.
-- Prec: La lista al menos posee una persona.
elMasViejo :: [Persona] -> Persona
elMasViejo (p:ps) = personaMayor p (elMasViejo ps)

-- Dadas dos personas devuelve la persona con mayor edad
personaMayor :: Persona -> Persona -> Persona
personaMayor p1 p2 = if esMenorQueLaOtra p1 p2
						then p1
						else p2
						
--------------------------------------------------------------------------
data Pokemon = ConsPoke Int   TipoDePokemon deriving (Show, Eq)
--                      energia  tipo
--                      0%-100%

data TipoDePokemon =
    Agua | Planta | Fuego deriving (Show, Eq)

data Entrenador = ConsE String [Pokemon] deriving (Show, Eq)
--                      nombre pokemones

poke1 :: Pokemon
poke1 = ConsPoke 2 Agua
poke2 = ConsPoke 3 Planta
poke3 = ConsPoke 4 Fuego
poke4= ConsPoke 4 Agua
poke5= ConsPoke 5 Fuego
poke6= ConsPoke 1 Agua

entrenador :: Entrenador
entrenador = ConsE "" [poke1, poke2]
entrenador1 = ConsE "" [poke1, poke2, poke3]
entrenador2 = ConsE "" [poke4]
--------------------------------------------------------------------

elementoGanador :: TipoDePokemon -> TipoDePokemon
--Dado un TipoDePokemon devuelve el elemento que le gana a ese.
--Agua le gana a fuego, fuego a planta y planta a agua.
elementoGanador Agua 	= Planta
elementoGanador Planta 	= Fuego
elementoGanador Fuego 	=Agua

leGanaA :: Pokemon -> Pokemon -> Bool
--Dados dos pokemon indica si el primero le puede ganar al segundo.
--Se considera que gana si su elemento es opuesto al del otro pokemon.
--Si poseen el mismo elemento se considera que no gana.
leGanaA (ConsPoke _ t1) (ConsPoke _ t2) = elementoGanador t1 == t2

capturarPokemon :: Pokemon -> Entrenador -> Entrenador
--Agrega un pokemon a la lista de pokemon del entrenador.
capturarPokemon p (ConsE s ps)	= ConsE s (p:ps)

cantidadDePokemons :: Entrenador -> Int
--Devuelve la cantidad de pokemons que posee el entrenador.
cantidadDePokemons (ConsE s ps)	= longitud ps


--Prop: Dada un lista de elementos de algun tipo devuelve el largo de esa lista, es decir, la cantidad de elementos que posee
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

cantidadDePokemonsDeTipo :: TipoDePokemon -> Entrenador -> Int
--Devuelve la cantidad de pokemons de determinado tipo que posee el entrenador.
cantidadDePokemonsDeTipo tp (ConsE n []) 	 = 0
cantidadDePokemonsDeTipo tp (ConsE n (p:ps)) = if tp == tipoPoke p
												then 1 + cantidadDePokemonsDeTipo tp (ConsE n ps)
												else cantidadDePokemonsDeTipo tp (ConsE n ps) 

tipoPoke :: Pokemon -> TipoDePokemon
--Dado un pokemon me devuelve su tipo
tipoPoke (ConsPoke _ t) = t

lePuedeGanar :: Entrenador -> Pokemon -> Bool
--Dados un entrenador y un pokemon devuelve T rue si el entrenador posee un pokemon que le gane ese pokemon.
lePuedeGanar (ConsE _ [])	pk		= False
lePuedeGanar (ConsE n (p:ps)) pk 	= leGanaA p pk || lePuedeGanar (ConsE n ps) pk

puedenPelear :: TipoDePokemon -> Entrenador -> Entrenador -> Bool
--Dados un tipo de pokemon y dos entrenadores, devuelve True si ambos entrenadores tiene al menos un pokemon de ese tipo y que tenga energía para pelear.
puedenPelear tp entr1 entr2 	= puedePelear tp entr1 && puedePelear tp entr2

puedePelear :: TipoDePokemon -> Entrenador -> Bool
puedePelear tp (ConsE n []) 	 = False
puedePelear tp (ConsE n (p:ps))  = puedenPelearPokemon tp p || puedePelear tp (ConsE n ps)

puedenPelearPokemon :: TipoDePokemon -> Pokemon -> Bool
puedenPelearPokemon tp p = tp == tipoPoke p && tieneEnergia p

tieneEnergia :: Pokemon -> Bool
tieneEnergia (ConsPoke e _) = e > 0

esExperto :: Entrenador -> Bool
--Dado un entrenador devuelve True si ese entrenador posee al menos un pokemon de cada tipo posible.
esExperto (ConsE _ ps) = tienePokemosAgua ps && tienePokemosFuego ps && tienePokemosPlanta ps

tienePokemosAgua :: [Pokemon] -> Bool
tienePokemosAgua []		= False
tienePokemosAgua (p:ps)	= tipoPoke p == Agua || tienePokemosAgua ps

tienePokemosFuego :: [Pokemon] -> Bool
tienePokemosFuego []		= False
tienePokemosFuego (p:ps)	= tipoPoke p == Fuego || tienePokemosFuego ps

tienePokemosPlanta :: [Pokemon] -> Bool
tienePokemosPlanta []		= False
tienePokemosPlanta (p:ps)	= tipoPoke p == Planta || tienePokemosPlanta ps

fiestaPokemon :: [Entrenador] -> [Pokemon]
--Dada una lista de entrenadores devuelve una lista con todos los pokemon de cada entrenador.
fiestaPokemon []	 = []
fiestaPokemon (e:es) = pokemons e ++ fiestaPokemon es

pokemons :: Entrenador -> [Pokemon]
pokemons (ConsE _ p) = p

----------------------------------------------------------------------------------------------

--Ejercicio 4

data Pizza = Prepizza | Agregar Ingrediente Pizza  	deriving (Show,Eq)

data Ingrediente = Salsa | Queso | Jamon | AceitunasVerdes Int deriving(Show, Eq)

sacar :: [Ingrediente] -> Pizza -> Pizza
--Saca los ingredientes de la pizza que se encuentren en la lista
sacar []	 p = p
sacar (x:xs) p = if(hayIngrediente x p)
					then sacarIngrediente x (sacar xs p)
					else sacar xs p

hayIngrediente :: Ingrediente -> Pizza -> Bool
hayIngrediente i Prepizza		= False
hayIngrediente i (Agregar x p)	= i == x || hayIngrediente i p

sacarIngrediente :: Ingrediente -> Pizza -> Pizza
sacarIngrediente x Prepizza			= Prepizza
sacarIngrediente x (Agregar i p)	= if (x == i)
										then p
										else sacarIngrediente x p 


cantJamon :: [Pizza] -> [(Int, Pizza)]
--Dada una lista de pizzas devuelve un par donde la primera componente es la cantidad de jamón de la pizza que es la segunda componente.
cantJamon []		= []
cantJamon (x:xs)	= tuplaConCantJamon x : cantJamon xs

tuplaConCantJamon :: Pizza -> (Int, Pizza)
tuplaConCantJamon Prepizza			= (0,Prepizza)
tuplaConCantJamon (Agregar Jamon p) = ( 1 + fst (tuplaConCantJamon p), snd (tuplaConCantJamon p))
tuplaConCantJamon p 				=  tuplaConCantJamon p 

mayorNAceitunas :: Int -> [Pizza] -> [Pizza]
--Devuelve las pizzas con más de “n” aceitunas.
mayorNAceitunas n []		= []
mayorNAceitunas n (x:xs)	= if(cantAceitunas x > n)
								then x: mayorNAceitunas n xs
								else mayorNAceitunas n xs

cantAceitunas :: Pizza -> Int
cantAceitunas Prepizza 							= 0	
cantAceitunas (Agregar (AceitunasVerdes n) p)	= 1 + cantAceitunas p
cantAceitunas (Agregar _ p)						= 0 + cantAceitunas p

---------------------------------------------------------------------------------------------------------------------------------------------

-- Ejercicio 5 

data Objeto = Cacharro | Tesoro
data Camino = Fin | Cofre [Objeto] Camino | Nada Camino

objeto1 = [Cacharro, Tesoro]
objeto2 = [Cacharro, Cacharro]

caminoConTesoro = Cofre objeto1 (Nada Fin)
caminoSinTesoro = Cofre objeto2 (Nada Fin)
camino3 = Cofre objeto1 caminoConTesoro

hayTesoro :: Camino -> Bool
--Indica si hay un cofre con un tesoro en el camino.
hayTesoro Fin			= False
hayTesoro (Nada c)		= False || hayTesoro c
hayTesoro (Cofre obs c)	= hayTesoroC obs || hayTesoro c

hayTesoroC :: [Objeto] -> Bool
hayTesoroC []		= False
hayTesoroC (x:xs)	= esTesoro x || hayTesoroC xs

esTesoro ::  Objeto -> Bool
esTesoro Cacharro 	= False
esTesoro Tesoro 	= True


pasosHastaTesoro :: Camino -> Int
--Indica la cantidad de pasos que hay que recorrer hasta llegar al primer
--cofre con un tesoro. Si un cofre con un tesoro está al principio del camino, la cantidad de pasos a recorrer es 0.
pasosHastaTesoro Fin			= 0
pasosHastaTesoro (Nada c)		= 1 + pasosHastaTesoro c
pasosHastaTesoro (Cofre obs c)	= if(hayTesoroC obs) 
									then 0
									else 1 + pasosHastaTesoro c 


hayTesoroEn :: Int -> Camino -> Bool
--Indica si hay un tesoro en una cierta cantidad exacta de pasos. Por ejemplo, si el número de pasos es 5, indica si hay un tesoro en 5 pasos.
hayTesoroEn 0 c = hayTesoroEnPasos c 
hayTesoroEn n c = hayTesoroEn (n-1) c

hayTesoroEnPasos :: Camino -> Bool
hayTesoroEnPasos Fin		   = False
hayTesoroEnPasos (Nada c)      = hayTesoroEnPasos c
hayTesoroEnPasos (Cofre obs c) = hayTesoroC obs

alMenosNTesoros :: Int -> Camino -> Bool
--Indica si hay al menos “n” tesoros en el camino.
alMenosNTesoros n Fin			= False
alMenosNTesoros n (Nada c)		= alMenosNTesoros n c 
alMenosNTesoros n c				= cantTesoro c > n 


cantTesoro :: Camino -> Int
cantTesoro Fin				= 0
cantTesoro (Nada c )		= 0 +  cantTesoro c 
cantTesoro (Cofre objs c ) 	= if(hayTesoroC objs)
								then 1 + cantTesoro c
								else 0 + cantTesoro c

cantTesorosEntre :: Int -> Int -> Camino -> Int
--Dado un rango de pasos, indica la cantidad de tesoros que hay en ese
--rango. Por ejemplo, si el rango es 3 y 5, indica la cantidad de tesoros
--que hay entre hacer 3 pasos y hacer 5. Están incluidos tanto 3 como 5 en el resultado.
cantTesorosEntre 0 0 Fin			= 0
cantTesorosEntre 0 0 (Nada c )		= 0
cantTesorosEntre 0 0 (Cofre objs c)	= cantTesoroC objs
cantTesorosEntre 0 m (Nada c )		= cantTesorosEntre 0 (m-1) c 
cantTesorosEntre 0 m (Cofre objs c)	= cantTesoroC objs + cantTesorosEntre 0 (m-1) c
cantTesorosEntre n m Fin			= 0
cantTesorosEntre n m (Nada c )		= cantTesorosEntre (n-1) (m-1) c 
cantTesorosEntre n m (Cofre objs c)	= cantTesorosEntre (n-1) (m-1) c


cantTesoroC :: [Objeto] -> Int
cantTesoroC []		= 0
cantTesoroC (x:xs)	= if (esTesoro x )
						then 1 + cantTesoroC xs
						else 0 + cantTesoroC xs
----------------------------------------------------------------------------------------------------------

-- Ejercicio 6

data ListaNoVacia a = Unit a | Cons a (ListaNoVacia a) deriving (Show,Eq)

lengthL :: ListaNoVacia a -> Int
--Retorna la longitud de la lista.
lengthL (Unit x) 	= 0
lengthL (Cons x l)	= 1 + lengthL l 

headL :: ListaNoVacia a -> a
--Devuelve el primer elemento de la lista. ¿Es una función parcial o total? es total
headL (Unit x)	= x
headL (Cons x l)	= headL l

tailL :: ListaNoVacia a -> ListaNoVacia a
--Devuelve el resto de la lista sacando el primer elemento. Pensar bien
--qué pasa en caso de que la lista tenga un sólo elemento. ¿Es una
--función parcial o total?
tailL (Unit x)		= error"La lista tiene un solo elemento"
tailL (Cons x l)	= l 


minimoL :: ListaNoVacia Int -> Int
--Dada una lista retorna el mínimo de dicha lista. ¿Es una función parcial o total?
minimoL (Unit x)		= x
minimoL (Cons x l)	= min x (minimoL l)

---------------------------------------------------------------------------------------------------------

--Ejercicio 7

data T a = A | B a | C a a | D (T a) | E a (T a) deriving (Show,Eq)

size :: T a -> Int
--Retorna la cantidad de elementos de una estructura T.
size A 			= 0
size (B x)		= 1 
size (C x s)	= 2
size (D t)		= 0 + size t
size (E x t)	= 1 + size t

sumT :: T Int -> Int
--Retorna la suma de todos los elementos.
sumT A 			= 0
sumT (B n)		= n
sumT (C n m)	= n + m
sumT (D t)		= sumT t
sumT (E n t)	= n + sumT t

hayD :: T a -> Bool
--Indica si existe al menos una aparición de D en la estructura.
hayD A 			= False
hayD (B n)		= False
hayD (C n m)	= False
hayD (D t)		= True
hayD (E n t)	= False || hayD t

cantE :: T a -> Int
--Retorna la cantidad de D que existen en la estructura.
cantE A 		= 0
cantE (B n)		= 0
cantE (C n m)	= 0
cantE (D t)		= 1 + cantE t
cantE (E n t)	= 0 + cantE t

recolectarC :: T a -> (a, a)
--Retorna los valores del constructor C. Notar que ese constructor puede no darse en la estructura.
recolectarC A 		= error "el constructor es A"
recolectarC (B x)	= error "el constructor es B"
recolectarC (C x z)	= (x, z)
recolectarC (D t)	= recolectarC t
recolectarC (E x t)	= recolectarC t

toList :: T a -> [a]
--Convierte la estructura a una lista, conservando el orden de los elementos.
toList A 		= []
toList (B x)	= [x]
toList (C x z)	= x:[z]
toList (D t)	= toList t
toList (E x t)	= x : toList t