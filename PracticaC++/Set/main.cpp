#include <iostream>
#include "SetFuncional.h"
#include "SetDestructiva.h"

using namespace std;

int main()
{
    cout << "Set Funcional" << endl;
    Set s = emptyS();
    s = singleton(2);
    cout << elem(s) << endl;
    cout << length(s) << endl;

    Set s2 = addS(3,s);
    cout << elem(s2) << endl;

   // Set s3 = removeS(3,s2);
    //cout << elem(s3) << endl;

    Set s5 = emptyS();
    s5 = singleton(2);

    Set s6 = emptyS();
    s6 = singleton(3);
    s6 = addS(2,s6);

    Set s7 = insersectS(s5,s6);
    cout << elem(s7) << endl;


    Set s8 = unionS(s5,s6);
    cout << elem(s8) << endl;

    cout << "Set Destructivo" << endl;
    Set d = emptySD();
    d = singletonD(2);
    cout << elemD(d) << endl;
    cout << lengthD(d) << endl;

    addSD(3,d);
    cout << elemD(d) << endl;

   // Set d3 = removeSD(3,d2);
    //cout << elemD(d3) << endl;

    Set d5 = emptySD();
    d5 = singletonD(2);

    Set d6 = emptySD();
    d6 = singletonD(3);
    addSD(2,d6);

    insersectSD(d5,d6);
    cout << elemD(d5) << endl;


    unionSD(d5,d6);
    cout << elemD(d6) << endl;
    return 0;
}
