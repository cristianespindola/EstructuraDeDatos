#define ELEM_TYPE int
#include <iostream>

using namespace std;

struct QueueNode;
typedef QueueNode* Queue;

Queue emptyQ();                // O(1)
bool isEmptyQ(Queue q);        // O(1)

void enqueue(ELEM_TYPE x, Queue& q); // O(n)
ELEM_TYPE  firstQ(Queue q);          // O(1)
void dequeue(Queue& q);        // O(1)

int sizeQ(Queue q);            // O(n)

void printQ(Queue q);          // O(n)

Queue copyQ(Queue q);          // O(n)

void destroyQ(Queue& q);       // O(n)
