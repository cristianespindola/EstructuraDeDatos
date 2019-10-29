#include "persona.h"

// Funciones de construcción
// -------------------------

Persona crearPersona(string nombre, int edad){
    Persona p;
    p.nombre = nombre;
    p.edad = edad;
    return p;
}

// Funciones para acceder a los campos
// -----------------------------------

int getEdad(Persona p){
    return p.edad;
}

string getNombre(Persona p){
    return p.nombre;
}

Perro getPerro(Persona p){
    return p.perro;
}

// Funciones de modificación
// -------------------------

Persona tienePerro(Persona p, Perro bobi){
    p.perro = bobi;
    return p;
}

Persona incrementarEdad(Persona p){
    p.edad++;
    return p;
}

Persona incrementarEdadDelPerro(Persona p){
    p.perro = incrementarEdad(p.perro);
    return p;
}

// Imprimir estructura
// -------------------

void imprimir(Persona p){
    cout << "PERSONA" << endl;
    cout << "Nombre: " << p.nombre << endl;
    cout << "Edad: " << p.edad << endl << endl;
}
