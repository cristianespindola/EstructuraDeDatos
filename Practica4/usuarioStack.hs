import Stack
--Dada una lista devuelve una pila sin alterar el orden de los elementos.
apilar :: [a] -> Stack a 
apilar []		= emptyS
apilar (x:xs)	= push x (apilar xs)


--Dada una pila devuelve una lista sin alterar el orden de los elementos.
desapilar :: Stack a -> [a]
desapilar s = if (isEmpltyS s)
				then []
				else top s:desapilar(pop s)

--Dado un árbol devuelve una pila con los elementos apilados inorder.
treeToStack :: Tree a -> Stack a
treeToStack t = apilar(listInOrden t)

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
balanceado []		=
balanceado (x:xs)	=