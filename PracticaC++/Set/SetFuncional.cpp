#include "SetFuncional.h"

struct SetNode {
  int elem;
  SetNode* next;
};

typedef SetNode* Set;

struct LNode {
  int lis;
  LNode* next;
};

typedef LNode* List;

List cons(int x, List xs) {
    LNode* newNode = new LNode;
    newNode->lis = x;
    newNode->next = xs;
    return newNode;
}

Set emptyS() {
    return NULL;
}

Set singleton(int x) {
  SetNode* node = new SetNode;
  node->elem = x;
  node->next = NULL;
  return node;
}

int elem(Set s) {
    return s->elem;
}

bool belongs(int x, Set s) {
    if(s == NULL) {
        return false;
    }
    while(s != NULL) {
    if(s->elem == x) {
      return true;
    }
    s = s->next;
  }
}

Set addS(int x , Set s) {
    if(belongs(x, s)) {
    return s;
  }

  SetNode* newNode = new SetNode;
  newNode->elem = x;
  newNode->next = s;
  return newNode;
}

Set removeS(int x, Set s) {
    if(s == NULL) {
        return s;
    }
    SetNode* newNode = new SetNode;

    while(s != NULL) {
        if(s->elem != x) {
            newNode->elem = s->elem;
            newNode->next = s->next;
            s = s->next;
        }
        s = s->next;

    }

    delete s;
    return newNode;

}

int length(Set s) {
    if(s == NULL) {
        return 0;
    }

    int cont = 0;
    while(s != NULL) {
        cont ++;
        s = s->next;
    }
    return cont;
}

Set unionS(Set s1, Set s2) {
    SetNode* newNode = new SetNode;
    newNode = s1;
    while(s2 != NULL) {
		newNode->elem = s2->elem;
        newNode->next = NULL;
		s2 = s2 -> next;
	}
	return newNode;
}

Set insersectS(Set s1, Set s2) {
    SetNode* newNode = new SetNode;
    newNode = s2;
    while(s1 != NULL) {
        if(belongs(s1->elem, newNode)) {
            newNode->elem = s1->elem;
            newNode->next = NULL;
        }
        s1 = s1->next;
    }
    return newNode;
}

List setToList(Set s) {
    LNode* xs = new LNode;
    while(s != NULL) {
        xs = cons(s->elem, xs);
        s = s->next;
    }
    return xs;
}

void destroySet(Set& s) {
    while(s != NULL) {
        Set tmp = s;
        s = s->next;
        delete tmp;
	}
	s = NULL;
}
