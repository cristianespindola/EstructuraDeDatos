import Stack

data Tree a =  Nodo a (Tree a) (Tree a) | Vacio deriving (Eq, Show)
--Dada una lista devuelve una pila sin alterar el orden de los elementos.
apilar :: [a] -> Stack a 
apilar []		= emptyS
apilar (x:xs)	= push x (apilar xs)


--Dada una pila devuelve una lista sin alterar el orden de los elementos.
desapilar :: Stack a -> [a]
desapilar s = if (isEmptyS s)
				then []
				else top s:desapilar(pop s)

--Dado un árbol devuelve una pila con los elementos apilados inorder.
treeToStack :: Tree a -> Stack a
treeToStack Vacio = emptyS
treeToStack (Nodo x t1 t2) = agregar(treeToStack t1) (push x (treeToStack t2))
--apilar(listInOrden t)

agregar :: Stack a -> Stack a -> Stack a
agregar s1 s2 = if(isEmptyS s1)
					then s2
					else push (top s1) (agregar (pop s1) s2)


{-Toma un string que representa una expresión aritmética, por ejemplo ”(2 + 3) ∗ 2”,
y verifica que la cantidad de paréntesis que abren se corresponda con los que cierran.
Para hacer esto utilice una stack. Cada vez que encuentra un paréntesis que abre, lo
apila. Si encuentra un paréntesis que cierra desapila un elemento. Si al terminar de
recorrer el string se desapilaron tantos elementos como los que se apilaron, ni más ni
menos, entonces los paréntesis están balaceados. Pista: recorra una stack pasada por
parámetro a una subtarea que devuelve un booleano, que indifica si los parentesis están
balanceados.
-}
balanceado :: String -> Bool
balanceado xs = v xs emptyS

v:: String -> Stack Char -> Bool
v [] s = isEmptyS s 
v (x:xs) s = if( x == '(')
				then  v xs (push x s)
				else if( x == ')')
						then v xs (pop s)
						else v xs s 