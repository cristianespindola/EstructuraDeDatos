#include "HashSet.h"

struct HashSetHeader {
    bool elems[MAX_SIZE];
};


HashSet emptyHS(int size) {
    HashSetHeader* h = new HashSetHeader;
    for(int i = 0; i < MAX_SIZE; i++) {
        h->elems[i] = false;
    }
    return h;
}

void addHS(ELEM_TYPE value, HashSet& s) {
    s->elems[hash(value)] = true;
}

bool belongsHS(ELEM_TYPE value, HashSet s) {
    return s->elems[hash(value)];
}

void deleteHS(ELEM_TYPE value, HashSet s) {
    s->elems[hash(value)] = false;
}
