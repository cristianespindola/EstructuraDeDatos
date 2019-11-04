#include "SetDestructiva.h"

struct SetNode {
  int elem;
  int length;
  SetNode* next;
};

typedef SetNode* Set;

struct LNode {
  int lis;
  LNode* next;
};

typedef LNode* List;

List consD(int x, List xs) {
    LNode* newNode = new LNode;
    newNode->lis = x;
    newNode->next = xs;
    return newNode;
}
Set emptySD() {
    return NULL;
}

Set singletonD(int x) {
    SetNode* node = new SetNode;
    node->elem = x;
    node->length ++;
    node->next = NULL;
    return node;
}

int elemD(Set s) {
    return s->elem;
}

bool belongsD(int x, Set s) {
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

void addSD(int x , Set& s) {
    if(belongsD(x, s)) {
        return ;
    }

    SetNode* newNode = new SetNode;
    newNode->elem = x;
    newNode->length ++;
    newNode->next = s;
    s = newNode;
}

void removeSD(int x, Set& s) {
    if(s == NULL) {
        return ;
    }
    SetNode* newNode = new SetNode;

    while(s != NULL) {
        if(s->elem != x) {
            newNode->elem = s->elem;
            newNode->length ++;
            newNode->next = s->next;
            s = s->next;
        }
        s = s->next;

    }
    Set tmp = s;
    newNode = s;
    delete tmp;
}

int lengthD(Set s) {
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

void unionSD(Set s1, Set& s2) {
    SetNode* newNode = new SetNode;
    while(s2 != NULL) {
		newNode->elem = s2->elem;
		newNode->length ++;
		newNode->next = NULL;
		s1->next = newNode;
		s2 = s2 -> next;
	}
}

void insersectSD(Set& s1, Set s2) {
    SetNode* newNode = new SetNode;
    while(s1 != NULL) {
        if(belongsD(s1->elem, newNode)) {
            newNode->elem = s1->elem;
            newNode->length ++;
            newNode->next = NULL;
        }
        s1 = s1->next;
    }
}

List setToListD(Set s) {
    LNode* xs = new LNode;
    while(s != NULL) {
        xs = consD(s->elem, xs);
        s = s->next;
    }
    return xs;
}

void destroySetD(Set& s) {
    while(s != NULL) {
        Set tmp = s;
        s = s->next;
        delete tmp;
	}
	s = NULL;
}
