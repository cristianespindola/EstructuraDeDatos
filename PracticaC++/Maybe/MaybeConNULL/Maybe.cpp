#include "Maybe.h"

struct MaybeSt;
{
    int elem;
};

/* Inv. Rep.:
   + Cuando es Nothing el puntero a MaybeSt* es NULL
*/

Maybe nothing()
{
    return NULL;
}

Maybe just(int x)
{
    Maybe m = new MaybeSt;
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
    return m == NULL;
}

void setJust(Maybe& m, int x)
{
    if(m == null)
    {
      m = just(x);
    }
    else
    {
        m->elem = x;
    }
}

void setNothing(Maybe& m)
{
  destruirMaybe(m);
}

void destruirMaybe(Maybe& m)
{
   if(m != NULL)
   {
     delete m;
     m = NULL;
   }
}
