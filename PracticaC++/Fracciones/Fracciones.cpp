#include "Fracciones.h"

struct FraccionSt {
    int numerador;
    int denominador;
};

Fraccion fraccion(int x, int y) {
    FraccionSt* f = new FraccionSt;
    f->numerador = x;
    f->denominador = y;
    return f;
}

int denominador(Fraccion f1) {
    return f1->denominador;
}

int numerador(Fraccion f1) {
    return f1->numerador;
}

Fraccion sumar(Fraccion f1, Fraccion f2) {
    FraccionSt* f = new FraccionSt;
    f->denominador = f1->denominador * f2->denominador;
    f->numerador = (f->denominador / f1->denominador * f1->numerador) + (f->denominador / f2->denominador * f2->numerador);
    return f;
}

Fraccion restar(Fraccion f1, Fraccion f2) {
    FraccionSt* f = new FraccionSt;
    f->denominador = f1->denominador * f2->denominador;
    f->numerador = (f->denominador * f1->denominador + f1->numerador) - (f->denominador * f2->denominador + f2->numerador);
    return f;
}
Fraccion multiplicar(Fraccion f1, Fraccion f2) {
    FraccionSt* f = new FraccionSt;
    f->denominador = f1->denominador * f2->denominador;
    f->numerador = f1->numerador * f2->numerador;
    return f;
}

Fraccion dividir(Fraccion f1, Fraccion f2) {
    FraccionSt* f = new FraccionSt;
    f->denominador = f1->denominador * f2->numerador;
    f->numerador = f1->numerador * f2->denominador;
    return f;
}

void invertir(Fraccion& f1) {
    int f = f1->numerador;
    f1->numerador = f1->denominador;
    f1->denominador = f;
}

void sumplificar(Fraccion& f1) {
    int n = f1->numerador;
    int d = f1->denominador;
    int c = max(n ,d);
    while( c != 1) {
        if(n % c == 0 && d % c == 0) {
            f1->numerador = n / c;
            f1->denominador = d /c;
        }
        c = c -1;
    }
}

void destruir(Fraccion& f1) {
    delete f1;
}

