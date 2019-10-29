#include "perro.h"

// Funciones de construcción
// -------------------------

Perro crearPerro(string nombre, int edad){
    Perro p;
    p.nombre = nombre;
    p.edad = edad;
    return p;
}

// Funciones para acceder a los campos
// -----------------------------------

int getEdad(Perro p){
    return p.edad;
}

string getNombre(Perro p){
    return p.nombre;
}

// Funciones de modificación
// -----------------------------------

Perro incrementarEdad(Perro p){
    p.edad++;
    return p;
}


// Imprimir estructura
// -------------------

void imprimir(Perro p){
    cout << "PERRO" << endl;
    cout << "Nombre: " << p.nombre << endl;
    cout << "Edad: " << p.edad << endl << endl;
}
