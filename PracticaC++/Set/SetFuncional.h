#include <iostream>

using namespace std;

struct SetNode;

typedef SetNode* Set;

struct LNode;

typedef LNode* List;

Set emptyS();
Set singleton(int x);
int elem(Set s);
bool belongs(int x, Set s);
Set addS(int x , Set s);
Set removeS(int x, Set s);
int length(Set s);
Set unionS(Set s1, Set s2);
Set insersectS(Set s1, Set s2);
List setToList(Set s);
