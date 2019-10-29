#include "familia.h"

// Funciones de construcción
// -------------------------

Familia crearFamilia(){
    Familia f;
    return f;
}

// Funciones para acceder a los campos
// -----------------------------------

Persona getPadre(Familia f){
    return f.padre;
}

Persona getMadre(Familia f){
    return f.madre;
}

Persona getHijo(Familia f){
    return f.hijo;
}

// Otras funciones
// ---------------

Familia todosCrecenUnAnio(Familia f){
    f.padre = incrementarEdad(f.padre);
    f.madre = incrementarEdad(f.madre);
    f.hijo  = incrementarEdad(f.hijo);
    // ahora incremento la edad del perro
    // (como tengo datos duplicados debo hacerlo en todos los struct de perro)
    f.padre = incrementarEdadDelPerro(f.padre);
    f.madre = incrementarEdadDelPerro(f.madre);
    f.hijo  = incrementarEdadDelPerro(f.hijo);
    return f;
}

Familia sePierdeElPerro(Familia f){
    // En esta función hablamos sobre que invariante tenemos en cuenta para tomar a un perro como inexistente.
    // Una de las posibilidades era agregar un bool al struct del perro que indique si el struct tiene sentido o no.
    // Decidimos no tocar la representación y simplemente decir que si el perro se pierde volvemos a un estado como al inicio.
    // ¿Cómo era el estado de los struct perro en los integrantes de la familia al comienzo? Los campos del perro apuntaban
    // a cualquier lado ! Bueno, vamos a reproducir eso para decir que el perro ya no está.
    Perro perroSinSentido;
    f.padre = tienePerro(f.padre, perroSinSentido);
    f.madre = tienePerro(f.madre, perroSinSentido);
    f.hijo  = tienePerro(f.hijo, perroSinSentido);
    return f;
}

// Funciones para asignar
// ----------------------

Familia asignarPadre(Familia f, Persona p){
    f.padre = p;
    return f;
}

Familia asignarMadre(Familia f, Persona p){
    f.madre = p;
    return f;
}

Familia asignarHijo(Familia f, Persona p){
    f.hijo = p;
    return f;
}

Familia asignarPerro(Familia f, Perro p){
    f.padre = tienePerro(f.padre, p);
    f.madre = tienePerro(f.madre, p);
    f.hijo  = tienePerro(f.hijo , p);
    return f;
}

