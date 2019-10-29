#include <iostream>
using namespace std;

struct MascotaSt;
typedef MascotaSt* Mascota;

Mascota crearMascota(string tipo, string nombre);
string getNombre(Mascota m);
void cambiarNombre(Mascota& m, string nuevo);
void matarMascota(Mascota& m);

