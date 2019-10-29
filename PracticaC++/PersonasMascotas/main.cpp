#include <iostream>
#include "Persona.h"

using namespace std;

int main()
{
    Mascota m = crearMascota("perro", "firu");
    Persona p = crearPersona("Carlos", m);

    cout << "Mi nombre es: " <<
        getNombre(getMascota(p)) << endl;

    cambiarNombre(m, "tito");

    cout << "Mi nombre es: " <<
        getNombre(getMascota(p)) << endl;

    return 0;
}
