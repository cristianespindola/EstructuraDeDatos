#include <iostream>
#include "Persona.h"
#include "ArrayList.h"

using namespace std;

void imprimirNumeros(int numeros[], int cantidad)
{
    int i = 0;
    cout << "[" << endl;
    while(i < cantidad)
    {
        cout << "  " << i << ": " <<numeros[i] << endl;
        i++;
    }
    cout << "]" << endl;
}

void setearATodos(int numeros[], int cantidad, int elemento)
{
    for(int i = 0; i < cantidad; i++)
    {
        numeros[i] = elemento;
    }
}

int sumarTodos(int numeros[], int cantidad)
{
    int r = 0;
    for(int i = 0; i < cantidad; i++)
    {
        r += numeros[i];
    }
    return r;
}

void incrementarTodos(int numeros[], int cantidad)
{
    int r = 0;
    for(int i = 0; i < cantidad; i++)
    {
       numeros[i]++;
    }
}

int* devuelvoUnArrayMalo(int cantidad)
{
    int numeros[cantidad];
    return numeros; // MAL!!! ESTOY DEVOLVIENDO MEMORIA DE STACK QUE SE DESTRUYE
}

int* crearArray(int cantidad)
{
    return new int[cantidad]; // BIEN!! PUEDO DEVOLVER MEMORIA DE LA HEAP
}

int main()
{
    /******* NUMEROS *******/
    cout << "******* NUMEROS *******" << endl << endl;

    int x = 1;
    int y = 5;

    int numeros[5];
    numeros[0] = 15;
    numeros[1] = 2;
    numeros[2] = 7;
    numeros[3] = x;
    numeros[4] = y;

    cout << "En la posicion 0 tengo el numero: " << numeros[0] << endl << endl;

    cout << "En el resto de las posiciones: " << endl;
    imprimirNumeros(numeros, 5);
    cout << endl;

    cout << "Seteo a uno todos los elementos: " << endl;
    setearATodos(numeros, 5, 1);
    imprimirNumeros(numeros, 5);
    cout << endl;

    cout << "Sumo todos: " << sumarTodos(numeros, 5) << endl << endl;

    cout << "Incremento a todos en uno: " << endl;
    incrementarTodos(numeros, 5);
    imprimirNumeros(numeros, 5);
    cout << endl;

    int* otraFormaDeVerLoMismo = numeros;
    // la variable 'numeros' simplemente es un puntero a la primera posicion del array

    /******* PERSONAS *******/
    cout << "******* PERSONAS *******" << endl << endl;

    Persona pers1 = crearPersona("Jorge", 32);
    Persona pers2 = crearPersona("Maria", 21);

    Persona personas[2];

    personas[0] = pers1;
    personas[1] = pers2;

    cout << "En el array 'personas', en la posicion 0: " << endl;
    imprimirPersona(personas[0]);
    cout << endl;

    cout << "En el array 'personas', en la posicion 1: " << endl;
    imprimirPersona(personas[1]);
    cout << endl;

    /******* ARRAY DINAMICO *******/
    cout << "******* ARRAY DINAMICO *******" << endl << endl;

    int* otrosNumeros = new int[10];

    numeros[0] = 15;
    numeros[1] = 2;
    numeros[2] = 7;
    numeros[3] = 1;
    numeros[4] = 5;

    cout << "Seteo a uno todos los elementos: " << endl;
    setearATodos(numeros, 5, 1);
    imprimirNumeros(numeros, 5);
    cout << endl;

    // libero el array dinamico
    delete[] otrosNumeros;

    /******* ARRAYLISTs *******/
    cout << "******* ARRAYLISTs *******" << endl << endl;

    cout << "Agrego 5 elementos a un 'xs'" << endl << endl;
    ArrayList xs = crearArrayListDe(2);
    add(xs, 1);
    add(xs, 2);
    add(xs, 3);
    add(xs, 4);
    add(xs, 5);

    imprimirArrayList(xs);
    cout << endl;

    cout << "Borro 2 elementos" << endl << endl;
    remove(xs);
    remove(xs);

    imprimirArrayList(xs);
    cout << endl;

    cout << "El indice del 3 es: " << indexOf(xs, 3) << endl << endl;

    cout << "El indice del 4 es: " << indexOf(xs, 4) << endl << endl;

    cout << "Creo 'ys'" << endl << endl;
    ArrayList ys = crearArrayList();
    add(ys, 4);
    add(ys, 5);
    add(ys, 6);
    add(ys, 7);
    add(ys, 8);

    imprimirArrayList(ys);
    cout << endl;

    cout << "Agrego 'ys' en 'xs'" << endl << endl;
    addAll(xs, ys);

    imprimirArrayList(xs);
    cout << endl;

    cout << "Agrego el numero 99 en la posicion 3 de 'xs'" << endl << endl;
    addAt(xs, 3, 99);

    imprimirArrayList(xs);
    cout << endl;

    cout << "Borro el elemento del indice 3 de 'xs'" << endl << endl;
    removeAt(xs, 3);

    imprimirArrayList(xs);
    cout << endl;

    cout << "Hago una copia de 'xs' llamada 'zs'" << endl << endl;
    ArrayList zs = copiar(xs);

    imprimirArrayList(zs);
    cout << endl;

    cout << "Hago una sublista de 'xs', del indice 3 al 6" << endl << endl;
    ArrayList sub = sublist(xs, 3, 6);

    imprimirArrayList(sub);
    cout << endl;

    destroyArrayList(xs);
    destroyArrayList(ys);
//    destroyArrayList(zs);
//    destroyArrayList(sub);

    return 0;
}
