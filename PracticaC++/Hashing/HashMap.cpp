#include "HashMap.h"

struct HashMapHeader {
    ELEM_TYPE elems[MAX_SIZE];
    ArrayList keys;
};

HashMap emptyHM() {
    HashMapHeader* hm = new HashMapHeader;
    hm->keys = crearArrayList();
    for(int i = 0; i < MAX_SIZE; i++) {
        hm->elems[i] = NULL;
    }
    return hm;
}

void assocHM(KEY_TYPE key, ELEM_TYPE value, HashMap& m) {
    if(m->elems[hash(key)] == NULL) {
        add(m->keys, value);
    }
    m->elems[hash(key)] = value;
}

ELEM_TYPE lookupHM(KEY_TYPE key, HashMap m) {
    return m->elems[hash(key)];
}

void deleteHM(KEY_TYPE key, HashMap m) {
    m->elems[hash(key)] = NULL; // depende de cada implementacion
}

ArrayList domHM(HashMap m) {
    return copiar(m->keys);
}
