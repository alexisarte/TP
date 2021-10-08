{13. Un teatro tiene funciones los 7 dias de la semana. Para cada dia se tiene una lista con las  entradas vendidas.
Se desea procesar la informacion de una semana.

Implementar un programa que: 

a. Genere 7 listas con las entradas vendidas para cada dia. De cada entrada se lee dia (de  1 a 7), codigo de la obra, asiento y monto.
La lectura finaliza con el codigo de obra igual a  0. Las listas deben estar ordenadas por codigo de obra de forma ascendente.

b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. 
Esta  lista debe estar ordenada por codigo de obra de forma ascendente.}

program halconesDeVenta3;
const
  MAX = 7;

type
  semana = 1..MAX;

  entrada = record
    dia: semana;
    codigo: integer;
    asiento: integer;
    monto: real;
  end;

  nuevo = record
    total: integer;
    codObra: integer;
  end;

  lista = ^cadena;

  cadena = record
    dato: entrada;
    sig: lista;
  end;

  lista2 = ^nodo;

  nodo = record
    dato: nuevo;
    sig: lista2;
  end;

  v_funciones = array [semana] of lista;

// Carga del vector de listas
procedure cargarlistas (var v:v_funciones);

  procedure inicializarVector(var v:v_funciones);
  var
	i:semana;
  begin
	for i:= 1 to MAX do
		v[i]:= nil;
  end;

  procedure leerEntrada(var e: entrada);
  begin
    with e do begin
      codigo:= random(5);
	  if (codigo <> 0)then begin
	    dia:= random(7)+1;
        asiento:= random(10);
        monto:= random(100) + random();
      end;
    end;
  end;
 
  procedure agregarOrdenado(var l:lista; e: entrada);
  var
    ant, act, aux: lista;
  begin
  new(aux);
  aux^.dato:= e;
  ant:= l;
  act:= l;
  while(act <> nil) and (e.codigo > act^.dato.codigo) do begin
      ant:= act;
      act:= act^.sig;
  end;
  if(ant = act) then
      l:= aux
  else
      ant^.sig:= aux;
  aux^.sig:= act;
  end;

var
	e: entrada;
begin

    inicializarVector(v);
    leerEntrada(e);
	while (e.codigo <> 0) do begin
		agregarOrdenado (v[e.dia],e);
        leerEntrada(e);
	end;
end;
// Fin del vector de listas

procedure imprimirLista(l: lista);
begin
    if (l <> nil) then  begin
        writeln('Dia (de  1 a 7): ', l^.dato.dia);
        writeln('Codigo de la obra: ', l^.dato.codigo);
        writeln('Asiento: ', l^.dato.asiento);
        writeln('Monto: ', l^.dato.monto:2:2);
        writeln('-------------------------------------');
        imprimirLista (l^.sig);
    end;
end;

procedure imprimirListas(var v:v_funciones);
var i: semana;
begin
    for i:= 1 to MAX do begin
        writeln;
        writeln('====================> DIA ', i,' <=====================');
        writeln();
        imprimirLista(v[i]);
        Writeln; 
    end;
end;

procedure Merge(var l:lista2; v:v_funciones);

  procedure minimo(var v: v_funciones; var minion: entrada);
  var
    indice, i: semana;
  begin
    minion.codigo:= 32767;
    for i:= 1 to MAX do begin
      if(v[i] <> nil) then
        if(v[i]^.dato.codigo <= minion.codigo) then begin
          indice:= i;
          minion:= v[i]^.dato;
        end;
    end;
    if(minion.codigo <> 32767) then
      v[indice]:= v[indice]^.sig;
  end;

  procedure agregarAtras(var  l,ult:lista2; v:nuevo);
  var aux:lista2;
  begin
    new(aux);
    aux^.dato:= v;
    aux^.sig:= nil;
    if(l = nil) then
      l:= aux
    else
      ult^.sig:= aux;
    ult:= aux;
  end;

var
  minion: entrada;
  act: nuevo;
  ult:lista2;
begin
  l:= nil;
  minimo(v,minion);
  while(minion.codigo <> 32767) do begin
    act.codObra:= minion.codigo;
    act.total:= 0;
    while(minion.codigo <> 32767) and (minion.codigo = act.codObra) do begin
      act.total:= act.total + 1;
      minimo(v,minion);
    end;
      agregarAtras(l,ult,act);
  end;
end;

procedure imprimirMerge(l:lista2);
begin
  if (l <> nil) then  begin
        writeln('Codigo de la obra : ', l^.dato.codObra);
        writeln('Cantidad de entradas vendidas: ', l^.dato.total);
        writeln('-------------------------------------');
        imprimirMerge (l^.sig);
    end;
end;

var
  v:v_funciones;
  l:lista2;
begin
  randomize;
  cargarlistas(v);
  imprimirListas(v);
  Merge(l,v);
  writeln;
  writeln('LISTA MERGE');
  writeln;
  imprimirMerge(l);
  readln;
end.
