#include "Mascota.h"

struct PersonaSt;
typedef PersonaSt* Persona;

Persona crearPersona(string nombre, Mascota mascota);
Mascota getMascota(Persona p);
void cambiarNombre(Persona& p, string nombre);
