#include <iostream>

using namespace std;

struct SetNode;

typedef SetNode* Set;

struct LNode;

typedef LNode* List;

Set emptySD();
Set singletonD(int x);
int elemD(Set s);
bool belongsD(int x, Set s);
void addSD(int x , Set& s);
void removeSD(int x, Set& s);
int lengthD(Set s);
void unionSD(Set s1, Set& s2);
void insersectSD(Set& s1, Set s2);
List setToListD(Set s);
void destroySetD(Set& s);
