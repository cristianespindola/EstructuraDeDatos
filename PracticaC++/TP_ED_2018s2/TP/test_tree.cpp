#include "test_tree.h"

// PROPOSITO: DEVUELVE LA CANTIDAD DE NODOS
int sizeT(GenTree t) {
    int r = 1;
    ArrayList ts = children(t);
    for(int i = 0; i < length(ts); i++) {
        r += sizeT(getAt(ts, i));
    }
    return r;
}

// PROPOSITO: INDICA SI EL ELEMENTO APARECE EN EL ARBOL
bool containsT(string x, GenTree t) {
    /// COMPLETAR
    int r = x == value(t);
    ArrayList ts = children(t);
    for(int i = 0; i < length(ts); i++) {
            r = x == value(getAt(ts,i)) || containsT(x, getAt(ts, i));
    }
    return r;
}

// PROPOSITO: INDICA LA CANTIDAD DE VECES QUE APARECE EL ELEMENTO
int occurrencesT(string x, GenTree t) {
    /// COMPLETAR
    int r = 0;
    ArrayList ts = children(t);
    for(int i = 0; i < length(ts); i++) {
            if(x == value(getAt(ts,i))) {
                r += 1 + occurrencesT(x,getAt(ts,i));
            }else {
                r += occurrencesT(x,getAt(ts,i));
            }
    }
    return r;
}

// PROPOSITO: DEVUELVE LA CANTIDAD DE RAMAS
int countLeaves(GenTree t) {
    /// COMPLETAR
    int r = 0;
    ArrayList ts = children(t);
    if(isLeaf(t)) {
      return 1;
    }
    for(int i = 0; i < length(ts); i++) {
        r += countLeaves(getAt(ts,i));
    }
    return r;
}

// PROPOSITO: DEVUELVE LA ALTURA DEL ARBOL
int heightT(GenTree t) {
    /// COMPLETAR
    int r = 1;
    if( not isLeaf(t)) {
        ArrayList ts = children(t);
        r = 1 + heightT(getAt(ts,0));
    }
    return r;
}

void agregarElems(List xs, GenTree t) {
    snoc(xs, value(t));
    ArrayList tmp = children(t);
    for(int i = 0; i < length(tmp); i++) {
        agregarElems(xs, getAt(tmp,i));
    }
}

// PROPOSITO: DEVUELVE LOS ELEMENTOS DEL ARBOL EN UNA LISTA
// PISTA: HACER UNA SUBTAREA QUE RECIBA UNA LISTA POR PARAMETRO
// PARA PODER MODIFICARLA
List toList(GenTree t) {
    /// COMPLETAR
    List r = nil();
    agregarElems(r, t);
    return r;
}

void agregarLeaves(List xs, GenTree t) {
    ArrayList tmp = children(t);
    for(int i = 0; i < length(tmp); i++) {
        if(isLeaf(getAt(tmp,i))) {
            snoc(xs,value(getAt(tmp,i)));
        }else{
            agregarLeaves(xs,getAt(tmp,i));
        }
    }
}

// PROPOSITO: DEVUELVE LOS ELEMENTOS QUE ESTAN EN LAS HOJAS
List leaves(GenTree t) {
    /// COMPLETAR
    List r = nil();
    agregarLeaves(r,t);
    return r;
}

// PROPOSITO: INDICA LA CANTIDAD DE VECES QUE APARECE EL ELEMENTO
void addChildren(ArrayList ts, GenTree t) {
    /// COMPLETAR
    for(int i = 0; i < length(ts); i++) {
        addChild(t, getAt(ts,i));
    }
}

void agregarElemsPorLevel(List xs, int n, GenTree t) {
    if(n == 0) {
       snoc(xs,value(t));
    }
    ArrayList tmp = children(t);
    for(int i = 0; i < length(tmp); i++) {
        agregarElemsPorLevel(xs, n-1, getAt(tmp,i));
    }
}

// PROPOSITO: DEVUELVE LOS ELEMENTOS DEL NIVEL "n"
List levelN(int n, GenTree t) {
    /// COMPLETAR
    List r = nil();
    agregarElemsPorLevel(r,n,t);
    return r;
}

// PROPOSITO: DEVUELVE EL STRING CON MAYOR LONGITUD
string stringWithMaxSize(GenTree t) {
    /// COMPLETAR
    string r = value(t);
    ArrayList tmp = children(t);
    for(int i = 0; i < length(tmp); i++) {
        string c = stringWithMaxSize(getAt(tmp,i));
        if(c.size() > r.size()) {
            r = value(getAt(tmp,i));
        }
    }
    return r;
}

void agregarElemsPorParh(List xs, GenTree t, int path[], int pathSize) {
    ArrayList tmp = children(t);
    for(int i = 0; i < pathSize; i++) {
        snoc(xs, value(t));
        t = getAt(tmp,path[i]);
    }
}

// PROPOSITO: DADO UN ARRAY CON NUMEROS QUE INDICAN UN CAMINO POR EL ARBOL
// DEVUELVE LOS ELEMENTOS QUE SE ENCUENTRAN EN DICHO CAMINO
List elemsInPath(GenTree t, int path[], int pathSize) {
    /// COMPLETAR
    List r = nil();
    agregarElemsPorParh(r,t,path,pathSize);
    return r;
}

// PROPOSITO: DEVUELVE EL ARBOL CON MAYOR ALTURA
// PRECONDICION: LA LISTA NO ESTA VACIA
GenTree maxHeight(ArrayList ts) {
    /// COMPLETAR
    GenTree r = getAt(ts,0);
    for(int i = 0; i < length(ts); i++) {
        if(sizeT(getAt(ts,i)) > sizeT(r)){
            r = getAt(ts,i);
        }
    }
    return r;
}

void concatElems(List r, ArrayList ts){
    for(int i = 0; i < length(ts); i++) {
        snoc(r, value(getAt(ts,i)));
        if(not isLeaf(getAt(ts,i))){
                concatElems(r, children(getAt(ts,i)));
        }
    }
}

// PROPOSITO: DEVUELVE LA CONCATENACION DE LOS ELEMENTOS DE LOS ARBOLES DE LA LISTA
List concatToList(ArrayList ts) {
    /// COMPLETAR
    List r = nil();
    concatElems(r,ts);
    return r;
}

// PROPOSITO: INDICA SI TODOS LOS ELEMENTOS DE LA LISTA ESTAN EN EL ARBOL
bool containsAll(List elems, GenTree t) {
    /// COMPLETAR
    bool r = true;
    ListIterator i = initIt(elems);
    while(not finished(i)) {
        r = r && containsT(getCurrent(i), t);
        next(i);
    }
    return r;
}

// PROPOSITO: CONCATENA TODOS LOS STRINGS DEL ARBOL
string concatAll(GenTree t) {
    /// COMPLETAR
    string r = value(t);
    ArrayList tmp = children(t);
    for(int i = 0; i < length(tmp); i++) {
        r += concatAll(getAt(tmp,i));
    }
    return r;
}

void testTree() {
    // ACA VAN LOS TEST DE LAS FUNCIONES IMPLEMENTADAS

    GenTree t = leaf("");
    for(int i = 0; i < 10; i++) {
        GenTree t2 = leaf("a");
        for(int j = 0; j < 10; j++) {
            addChild(t2, leaf("b"));
        }
        addChild(t, t2);
    }

    GenTree t2 = leaf("");
    GenTree t3 = leaf("Hola");
    ArrayList ar = crearArrayList();
    add(ar, t3);

    List l = nil();
    snoc(l,"a");
    snoc(l,"b");

    List l2 = nil();
    snoc(l2,"a");
    snoc(l2,"b");
    snoc(l2,"c");

    cout << "sum: " << sizeT(t) << endl;
    cout << "contains b: " << (containsT("b", t) ? "true" : "false") << endl;
    cout << "occurrences b: " << occurrencesT("b", t) << endl;
    cout << "leaves: " << countLeaves(t) << endl;
    cout << "height: " << heightT(t) << endl;
    cout << "toList: " << endl; printList(toList(t));
    cout << "leaves: " << endl; printList(leaves(t));

    cout << "addChildren: " << endl;
    addChildren(ar, t2);
    printList(toList(t2));

    cout << "levelN: " << endl; printList(levelN(1,t));
    cout << "countLeavesLevel: " << stringWithMaxSize(t) << endl;

    ArrayList ar2 = crearArrayList();
    add(ar2, t2);

    cout << "maxHeight: " << endl; printList(toList(maxHeight(ar2)));
    cout << "concatToList: " << endl; printList(concatToList(ar2));
    // True
    cout << "containsAll: " << (containsAll(l,t)  ? "true" : "false")<< endl;
    // False
    cout << "containsAll: " << (containsAll(l2,t)  ? "true" : "false")<< endl;

    cout << "concatAll: " << concatAll(t) << endl;
}
