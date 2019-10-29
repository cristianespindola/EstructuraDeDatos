#include <iostream>
#include "Mascota.h"

using namespace std;

struct MascotaSt {
    string tipo;
    string nombre;
};

Mascota crearMascota(string tipo, string nombre)
{
   Mascota m = new MascotaSt;
   m->tipo = tipo;
   m->nombre = nombre;
   return m;
}

string getNombre(Mascota m)
{
    return m->nombre;
}

void cambiarNombre(Mascota& m, string nuevo)
{
    m->nombre = nuevo;
}

void matarMascota(Mascota& m)
{
    delete m;
    m = NULL;
}
