#include <iostream>

using namespace std;

struct PersonaSt;
typedef PersonaSt* Persona;

Persona crearPersona(string nombre, int edad);

string getNombre(Persona p);
int getEdad(Persona p);

void crecer(Persona& p);

void imprimirPersona(Persona p);
