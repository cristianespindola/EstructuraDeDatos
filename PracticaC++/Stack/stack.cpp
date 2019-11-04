#include <iostream>
#include "stack.h"

struct StackNode {

 elementType elem ;
 StackNode* next ;

};

struct IteratorStruct {
 //RECORRE LA ESTRUCTURA DE STACK
 StackNode* current ;

};

Stack emptyS() {
//
 return NULL;
}

bool isEmptyS(Stack s) {
//
 return s == NULL ;
}

void push(elementType elem, Stack& s) {
 Stack ss = new StackNode;
 ss -> elem = elem ;
 ss -> next = s ;
  s = ss;
}

void pop(Stack& s) {
 StackNode* ss = s;
 ss = s -> next ;
 delete ss ;

}

elementType top(Stack s) {

 return s -> elem;

}

int sizeS(Stack s) {
 int sizeAux = 0;
    while (s == NULL) {
        sizeAux ++;
         s = s -> next;
    }
  return sizeAux;
}


Stack copyS(Stack s){
 if( s == NULL) {
   return NULL  ;
 }else {
     StackNode* copyStackNode = copyS(s->next);
     push(s-> elem, copyStackNode);
    return copyStackNode ;
 }
}

IteradorStack getIterator(Stack s)
{
    IteratorStruct* i = new IteratorStruct;
    i ->current = s;
    return i;
}

bool atEnd(IteradorStack i)
{
  return i->current->next == NULL;
}

void moveToNext(IteradorStack i)
{
    if (not(atEnd(i)))
    {
        i->current= i->current -> next;
    }
}

void destroyIterator(IteradorStack& i)
{
    delete i;
    i=NULL;
}

elementType getElem(IteradorStack i)
{
    return i->current->elem;
}

void setElem(IteradorStack i, elementType e)
{
    i->current->elem = e;
}

void printS(Stack s) {
 count << "New print stack" << endl;
 count << "----------" << endl;
 while (s |= NULL) {
     count " | "
     count
 }

}

