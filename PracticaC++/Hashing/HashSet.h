#include <iostream>
#include "ArrayList.h"

#define ELEM_TYPE Persona
#define MAX_SIZE 50000000 // 50 millones de personas maximo
int hash(ELEM_TYPE p) { return getDNI(p); } // no se tienen en cuenta las colisiones

using namespace std;

struct HashSetHeader;
typedef HashSetHeader* HashSet;

HashSet emptyHS(int size);
void addHS(ELEM_TYPE value, HashSet& s);
bool belongsHS(ELEM_TYPE value, HashSet s);
void deleteHS(ELEM_TYPE value, HashSet s);

