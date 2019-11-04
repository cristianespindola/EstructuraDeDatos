#include <iostream>
#include "stack.h"

using namespace std;

int main()
{

    Stack s = emptyS();
    bool res= isEmptyS(s);
    cout << res << endl;
    IteradorStack i = getIterator(s);
    while( atEnd(i))
    {
        cout << "elemento" << endl;
        cout << getElem(i) << endl;
        setElem(i,99);
        moveToNext(i);
    }
    destroyIterator(i);
    printS(s);
    return 0;
}
