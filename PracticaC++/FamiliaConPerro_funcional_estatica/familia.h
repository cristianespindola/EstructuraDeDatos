#include <iostream>
#include "persona.h"
using namespace std;

struct Familia
// LAS PROXIMAS 5 LINEAS SON PARTE DE LA IMPLEMENTACIÓN. DEBERIAN ABSTRAERSE.
{
    Persona padre;
    Persona madre;
    Persona hijo;
};

// Funciones de construcción
// -------------------------

Familia crearFamilia();

// Funciones para acceder a los campos
// -----------------------------------

Persona getPadre(Familia f);

Persona getMadre(Familia f);

Persona getHijo(Familia f);

// Funciones para asignar
// ----------------------

Familia asignarPadre(Familia f, Persona p);

Familia asignarMadre(Familia f, Persona p);

Familia asignarHijo(Familia f, Persona p);

Familia asignarPerro(Familia f, Perro p);

// Otras funciones
// ---------------

Familia todosCrecenUnAnio(Familia f);

Familia sePierdeElPerro(Familia f);
