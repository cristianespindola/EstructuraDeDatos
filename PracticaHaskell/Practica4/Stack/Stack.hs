module Stack(Stack, emptyS, isEmptyS, push, pop, top, isEmptyS) where

data Stack a = MkS [a] Int  deriving (Show,Eq)
--   Tipo        Constructor   Tipo de representacion
--   Abstracto

-- INV.REP.: NINGUNO! Toda lista es aceptable.


--Crea una pila vacía.
emptyS :: Stack a  -- O(1)
emptyS = MkS [] 0

--Dada una pila indica si está vacía.
isEmptyS :: Stack a -> Bool -- O(1)
isEmptyS (MkS xs n) = n==0

--Dados un elemento y una pila, agrega el elemento a la pila.
push  :: a -> Stack a -> Stack a -- O(1)
push x (MkS xs n) = MkS (x:xs) (n+1)

--Dada una pila devuelve la pila sin el primer elemento.
pop  :: Stack a -> Stack a -- O(1)
pop (MkS (x:xs) n) = MkS xs (n-1)

--Dada un pila devuelve el elemento del tope de la pila.
top  :: Stack a -> a -- O(1)
top (MkS (x:xs) n) = x 
