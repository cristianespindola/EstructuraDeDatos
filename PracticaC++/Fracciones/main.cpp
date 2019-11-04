#include <iostream>
#include "Fracciones.h"

using namespace std;

int main()
{
    Fraccion f1 = fraccion(1, 2);
    Fraccion f2 = fraccion(1, 4);

    cout << numerador(f1) << endl;
    cout << "-" << endl;
    cout << denominador(f1) << endl;

    cout << numerador(f2) << endl;
    cout << "-" << endl;
    cout << denominador(f2) << endl;

    Fraccion suma = sumar(f1, f2);
    cout << "suma" << endl;
    cout << numerador(suma) << endl;
    cout << "-" << endl;
    cout << denominador(suma) << endl;

    Fraccion resta = restar(f1, f2);
    cout << "resta" << endl;
    cout << numerador(resta) << endl;
    cout << "-" << endl;
    cout << denominador(resta) << endl;

    Fraccion multiplicacion = multiplicar(f1, f2);
    cout << "multiplicacion" << endl;
    cout << numerador(multiplicacion) << endl;
    cout << "-" << endl;
    cout << denominador(multiplicacion) << endl;

    Fraccion division = dividir(f1, f2);
    cout << "division" << endl;
    cout << numerador(division) << endl;
    cout << "-" << endl;
    cout << denominador(division) << endl;

    invertir(f1);
    cout << "invertir" << endl;
    cout << numerador(f1) << endl;
    cout << "-" << endl;
    cout << denominador(f1) << endl;

    sumplificar(suma);
    cout << "sumplificar" << endl;
    cout << numerador(suma) << endl;
    cout << "-" << endl;
    cout << denominador(suma) << endl;

    return 0;
}
