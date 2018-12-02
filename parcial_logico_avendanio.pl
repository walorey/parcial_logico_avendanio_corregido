monstruo(godzilla,100,5).
monstruo(sullivan,50,1).

caracteristicas(godzilla,terreste).
caracteristicas(godzilla,colmillos).
caracteristicas(godzilla,coraza).
caracteristicas(sullivan,pelos).
caracteristicas(sullivan,simpatico).

caracteristicasTerribles(colmillos).
caracteristicasTerribles(garras).
caracteristicasTerribles(coraza).
caracteristicasTerribles(aguijon).

puntosPorCaza(MONSTRUO,PUNTOS):-
monstruo(MONSTRUO,TAMANIO,PELIGROSIDAD),
PUNTOS=TAMANIO*0.2*2*PELIGROSIDAD.

puntosPorCaza(MONSTRUO,PUNTOS):-
monstruo(MONSTRUO,TAMANIO,PELIGROSIDAD),
caracteristicasTerribles(CARACTERISTICA),
caracteristicas(MONSTRUO,CARACTERISTICA),
PUNTOS=(TAMANIO*0.2*2*PELIGROSIDAD)+10.
	
cazador(hunter,1,100,acuatico).
cazador(chasseur,0,5000,todoTerreno(50)).
cazador(randy,5,50,acuatico).
cazador(jimbo,7,60,peliplumifero).
cazador(ned,6,55,todoTerreno(60)).

hayEquipo(LIDER,ASISTENTE,PERROS):-
cazador(LIDER,ML,PL,EL),
cazador(ASISTENTE,MA,PA,EA),
between(3,(5*(ML+MA)),PERROS),
not(EL=EA),
PL>PA.

%no se como usar el forall para decir que un cazador puede ser lider de todos los equipos
liderIndispensable(LIDER):-
cazador(LIDER,_,_,_),
forall(hayEquipo(LIDER,_,_)).


cazadorInutil(CAZADOR):-
cazador(CAZADOR,_,_,_),
not(hayEquipo(CAZADOR,_,_)),
not(hayEquipo(_,CAZADOR,_)).
