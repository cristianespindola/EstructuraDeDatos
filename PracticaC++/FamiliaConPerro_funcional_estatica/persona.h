#include <iostream>
#include "perro.h"
using namespace std;

struct Persona
// LAS PROXIMAS 5 LINEAS SON PARTE DE LA IMPLEMENTACIÓN. DEBERIAN ABSTRAERSE.
{
    string nombre;
    int edad;
    Perro perro;
};

// Funciones de construcción
// -------------------------

Persona crearPersona(string nombre, int edad);


// Funciones para acceder a los campos
// -----------------------------------

int getEdad(Persona p);

string getNombre(Persona p);

Perro getPerro(Persona p);

// Funciones de modificación
// -------------------------

Persona tienePerro(Persona p, Perro bobi);

Persona incrementarEdad(Persona p);

Persona incrementarEdadDelPerro(Persona p);

// Imprimir estructura
// -------------------

void imprimir(Persona p);
