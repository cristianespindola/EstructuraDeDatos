#include <iostream>

using namespace std;

int main()
{
    Maybe m = nothing();
    setJust(m, 2);

    return 0;
}
