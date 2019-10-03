import Queue

data Persona = ConsP String Int

--Cuenta la cantidad de elementos de la cola.
lenQ :: Queue a -> Int
lenQ q = if isEmptyQ q 
		then 0
		else 1 + largoQ (dequeue q)

--Dada una cola de personas, devuelve la lista de las mismas, donde el orden de la lista es de la cola.
atender :: Queue Persona -> [Persona]
atender q = if isEmptyQ q 
			then []
			else firstQ q : atender(dequeue q)

--Inserta todos los elementos de la segunda cola en la primera.
unirQ :: Queue a -> Queue a -> Queue a 
unirQ q1 q2 = if isEmptyQ q2
				then q1
				else unirQ (queue (firstQ q2) q1) (dequeue q2)

pepe = ConsP "pepe" 10

pepa = ConsP "pepa" 20

queueString = enqueue pepe (enqueue pepa emptyQ)
                                                                                                                                                           
queuePar = enqueue 6 (enqueue 4 (enqueue 2 emptyQ))

queueImpar = enqueue 5 (enqueue 3 (enqueue 1 emptyQ))
