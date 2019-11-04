#include "Persona.h"

struct PersonaSt
{
    string nombre;
    int edad;
    int dni;
};

Persona crearPersona(string nombre, int edad, int dni)
{
    Persona p = new PersonaSt;
    p->edad   = edad;
    p->nombre = nombre;
    p->dni = dni;
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

int getDNI(Persona p)
{
    return p->dni;
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
    cout << "  dni: " << p->dni << endl;
    cout << "}" << endl;
}
