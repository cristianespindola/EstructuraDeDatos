#include <iostream>
using namespace std;

struct Perro
// LAS PROXIMAS 4 LINEAS SON PARTE DE LA IMPLEMENTACIÓN. DEBERIAN ABSTRAERSE.
{
    string nombre;
    int edad;
};

// Funciones de construcción
// -------------------------

Perro crearPerro(string nombre, int edad);


// Funciones para acceder a los campos
// -----------------------------------

int getEdad(Perro p);

string getNombre(Perro p);

// Funciones de modificación
// -----------------------------------

Perro incrementarEdad(Perro p);


// Imprimir estructura
// -------------------

void imprimir(Perro p);
