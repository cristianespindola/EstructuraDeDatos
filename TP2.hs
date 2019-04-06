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
leGanaA (ConsPoke _ t1) (ConsPoke _ t2) = if t1 == t2
											then False
											else elementoGanador t1 == t2

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