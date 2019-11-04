#include "Maybe.h"

struct MaybeSt;
{
    bool isN;
    int elem;
};

/* Inv. Rep.:
   + Si isN es true, en elem hay basura
*/

Maybe nothing()
{
    // MaybeSt * m = new MaybeSt
    Maybe m = new MaybeSt;
    m->isN = true;
    return m;
}

Maybe just(int x)
{
    Maybe m = new MaybeSt;
    m->isN = false;
    m->elem = x;
    return m;
}

// Parcial cuando isNothing es true;
int fromJust(Maybe m)
{
    return m->elem;
}

bool isNothing(Maybe m);
{
    return m->isN;
}

void setJust(Maybe& m, int x)
{
    m->isN  = false;
    m->elem = x;
}

void setNothing(Maybe& m)
{
    m->isN = true;
}

void destruirMaybe(Maybe& m)
{
   delete m;
   m = NULL;
}
