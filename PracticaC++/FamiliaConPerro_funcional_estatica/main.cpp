#include <iostream>
#include "familia.h"
using namespace std;

int main()
{


    cout << "Le asigno un perro a la familia. Recuerden que decidimos que la persona tenga un perro a pesar que " <<
    "la mejor solución es asignar el perro a la familia." << endl;
    Perro perro = crearPerro("Lazy", 1);


    cout << "Muestro los datos de perro accediendo desde el padre" << endl << endl;
    imprimir(getEdad(perro));


    return 0;
}
