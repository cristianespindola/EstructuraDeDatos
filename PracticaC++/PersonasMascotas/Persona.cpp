#include "Persona.h"

struct PersonaSt {
    string nombre;
    Mascota mascota;
};

Persona crearPersona(string nombre, Mascota mascota)
{
    Persona p = new PersonaSt;
    p->nombre = nombre;
    p->mascota = mascota;
}

Mascota getMascota(Persona p)
{
    return p->mascota;
}
