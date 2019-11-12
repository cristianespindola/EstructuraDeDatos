#include "set.h"
#include "../common/Common.h"

struct Node {
   Hechizo elem; // el elemento que este nodo almacena
   Node* next; // siguiente nodo de la cadena de punteros
};

struct SetSt {
   int size; // cantidad de elementos del conjunto
   Node* first; // puntero al primer elemento
};

/**
  Invariantes de representacion:
    - size es la cantidad de nodos
    - no hay nodos con hechizos repetidos
**/

/// Proposito: retorna un conjunto de hechizos vacio
/// Costo: O(1)
Set emptyS() {
   Set s = new SetSt;
   s->size = 0;
   s->first = NULL;
   return s;
}

/// Proposito: retorna la cantidad de hechizos
/// Costo: O(1)
int sizeS(Set s) {
   return s->size;
}

/// Proposito: indica si el hechizo pertenece al conjunto
/// Costo: O(h), h = cantidad de hechizos
bool belongsS(Hechizo h, Set s) {
    Node* n = s->first;
    while(n != NULL && !mismoHechizo(h,n->elem)){
        n = n->next;
    }
    return n != NULL;
}

/// Proposito: agrega un hechizo al conjunto
/// Costo: O(h), h = cantidad de hechizos
void addS(Hechizo h, Set s) {
    if(!belongsS(h,s)){
        Node* n = new Node;
        n->elem = h;
        n->next = s->first;
        s->first = n;
        s->size++;
    }
}

/// Proposito: borra un hechizo del conjunto (si no existe no hace nada)
/// Costo: O(h), h = cantidad de hechizos
void removeS(Hechizo h, Set s) {
    Node* anterior = NULL;
    Node* actual = s->first;
   while(actual != NULL && actual->elem != h){
        anterior = actual;
        actual = actual->next;
   }

   if(anterior == NULL){
        delete s->first;
        s->first = NULL;
        s->size = 0;
   }
   else{
        actual = actual->next;
        anterior->next = actual;
        s->size--;
   }
}

/// Proposito: borra toda la memoria consumida por el conjunto (pero no la de los hechizos)
/// Costo: O(n)
void destroyS(Set s) {
    Node* n = s->first;
    while(n != NULL) {
        Node* tmp = n;
        n = n->next;
        delete tmp;
	}
	s = NULL;
}

/// Proposito: retorna un nuevo conjunto que es la union entre ambos (no modifica estos conjuntos)
/// Costo: O(h^2), h = cantidad de hechizos
Set unionS(Set s1, Set s2) {
    Set s = new SetSt;
    s->first = NULL;
    s->size = 0;

    Node* n1 = s1->first;
    Node* n2 = s2->first;

    while(n1 != NULL) {
        Node* n = new Node;
        n->elem = n1->elem;
        n->next = s->first;
        s->size++;
        s->first = n;
        n1 = n1->next;
	}

	while(n2 != NULL){
        if(!belongsS(n2->elem,s1)){
            Node* n = new Node;
            n->elem = n2->elem;
            n->next = s->first;
            s->size++;
            s->first = n;
        }
        n2 = n2->next;
	}
	return s;
}
