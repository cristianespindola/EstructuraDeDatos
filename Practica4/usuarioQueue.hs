--Cuenta la cantidad de elementos de la cola.
lenQ :: Queue a -> Int
lenQ q = if isEmpltyQ q 
		then 0
		else 1 + lenQ (dequeue q)

--Dada una cola de personas, devuelve la lista de las mismas, donde el orden de la lista es de la cola.
atender :: Queue Persona -> [Persona]
atender q = if isEmpltyQ q 
			then []
			else firstQ q : atender(dequeue q)

--Inserta todos los elementos de la segunda cola en la primera.
unirQ :: Queue a -> Queue a -> Queue a 
unirQ q1 q2 = if isEmpltyQ q2
				then q1
				else unirQ (queue (firstQ q2) q1) dequeue q2