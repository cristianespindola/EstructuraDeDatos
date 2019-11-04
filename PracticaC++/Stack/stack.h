typedef int elementType;

struct StackNode ;
typedef StackNode* Stack ;

struct IteratorStruct;
typedef IteratorStruct* IteradorStack;

Stack emptyS();

bool isEmptyS(Stack s);

void push(elementType elem, Stack& s);

void pop(Stack& s);

elementType top(Stack s);

int sizeS(Stack s);

void printS(Stack s);

Stack copyS(Stack s);

IteradorStack getIterator(Stack s);

bool atEnd(IteradorStack i);

void moveToNext(IteradorStack i);

void destroyIterator(IteradorStack& i);

elementType getElem(IteradorStack i);

void setElem(IteradorStack i, elementType e);
