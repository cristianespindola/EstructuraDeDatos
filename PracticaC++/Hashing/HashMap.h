#include <iostream>
#include "ArrayList.h"

#define KEY_TYPE int
#define ELEM_TYPE Persona
#define MAX_SIZE 50000000 // 50 millones de personas maximo
int hash(KEY_TYPE k) { return k % MAX_SIZE; } // no se tienen en cuenta las colisiones

using namespace std;

struct HashMapHeader;
typedef HashMapHeader* HashMap;

HashMap emptyHM(int size);
void assocHM(KEY_TYPE key, ELEM_TYPE value, HashMap& m);
ELEM_TYPE lookupHM(KEY_TYPE key, HashMap m);
void deleteHM(KEY_TYPE key, HashMap m);
ArrayList domHM(HashMap m);
