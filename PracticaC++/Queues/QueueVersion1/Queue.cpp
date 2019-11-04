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
// Version 1
// AGREGA POR DELANTE Y SACAR POR DETRAS

// O(1)
void enqueue(ELEM_TYPE x, Queue& q)
{
    QueueNode* nuevoQ = new QueueNode;
    nuevoQ->elem = x;
    nuevoQ->next = q;
    q = nuevoQ;
}

// PARCIAL EN emptyQ()
// O(n)
ELEM_TYPE firstQ(Queue q)
{
    while(q->next != NULL)
    {
        q = q->next;
    }
    return q->elem;
}

// PARCIAL EN emptyQ()
void dequeue(Queue& q)
{
    if(q->next == NULL)
    {
        delete q;
        q = NULL;
    }
    else
    {
        Queue actual = q;
        while(actual->next->next != NULL)
        {
            actual = actual->next;
        }

        delete actual->next;
        actual->next = NULL;
    }
}

////////////////////////////////////////

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

//O(n)
Queue reverseQ(Queue q)
{
    Queue r = emptyQ();
    while(q != NULL)
    {
        enqueue(q->elem, r);
        q = q->next;
    }
    return r;
}

// O(n)
Queue copyQ(Queue q)
{
    Queue tmp = reverseQ(q);
    Queue r   = reverseQ(tmp);
    destroyQ(tmp);
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
