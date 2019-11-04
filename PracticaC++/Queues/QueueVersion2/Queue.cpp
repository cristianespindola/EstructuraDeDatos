#include "Queue.h"

struct QueueNode
{
    ELEM_TYPE elem;
    QueueNode* next;
};

Queue emptyQ()
{
    return NULL;
}

bool isEmptyQ(Queue q)
{
    return q == NULL;
}

////////////////////////////////////////
// Version 2
// AGREGA POR DETRAS Y SACA POR DELANTE
void enqueue(ELEM_TYPE x, Queue& q)
{
    QueueNode* nuevoQ = new QueueNode;
    nuevoQ->elem = x;
    nuevoQ->next = NULL;

    if(q == NULL)
    {
        q = nuevoQ;
    }
    else
    {
        Queue actual = q;
        while(actual->next != NULL)
        {
            actual = actual->next;
        }
         actual->next = nuevoQ;
    }
}

// PARCIAL EN emptyQ()
ELEM_TYPE firstQ(Queue q)
{
    return q->elem;
}

// PARCIAL EN emptyQ()
void dequeue(Queue& q)
{
    Queue rest = q->next;
    delete q;
    q = rest;
}

int sizeQ(Queue q)
{
    int r = 0;
    while(q != NULL)
    {
        r++;
        q = q->next;
    }
    return r;
}

void printQ(Queue q)
{
    cout << "Queue [ ";
    while(q != NULL)
    {
        if(q->next != NULL)
        {
             cout << q->elem << ", ";
        }
        else
        {
           cout << q->elem << " ";
        }
        q = q->next;
    }
    cout << "]" << endl;
}

Queue copyQ(Queue q)
{
    Queue r = emptyQ();
    while(q != NULL)
    {
        enqueue(q->elem, r);
        q = q->next;
    }
    return r;
}

void destroyQ(Queue& q)
{
    Queue tmp;
    while(q != NULL)
    {
        tmp = q;
        q = q->next;
        delete tmp;
    }
    q = NULL;
}
