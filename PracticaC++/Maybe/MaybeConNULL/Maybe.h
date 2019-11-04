#include <iostream>

using namespace std;

struct MaybeSt;

typedef MaybeSt* Maybe;

Maybe nothing();
Maybe just(int x);

int fromJust(Maybe m);

bool isNothing(Maybe m);

void setJust(Maybe& m, int x);

void setNothing(Maybe& m);

void destruirMaybe(Maybe& m);
