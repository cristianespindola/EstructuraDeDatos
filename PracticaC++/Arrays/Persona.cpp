#include "Persona.h"

struct PersonaSt
{
    string nombre;
    int edad;
};

Persona crearPersona(string nombre, int edad)
{
    Persona p = new PersonaSt;
    p->edad   = edad;
    p->nombre = nombre;
    return p;
}

string getNombre(Persona p)
{
    return p->nombre;
}

int getEdad(Persona p)
{
    return p->edad;
}

void crecer(Persona& p)
{
    p->edad++;
}

void imprimirPersona(Persona p)
{
    cout << "Persona " << p << " { " << endl;
    cout << "  edad: " << p->edad << endl;
    cout << "  nombre: " << p->nombre << endl;
    cout << "}" << endl;
}
