{4. Escribir un programa que:
 

a. Implemente un modulo que genere una lista a partir de la lectura de numeros enteros.  La lectura finaliza con el numero 0.

b. Implemente un modulo recursivo que devuelva el maximo valor de la lista.

c. Implemente un modulo recursivo que devuelva el maximo valor de la lista.

d. Implemente un modulo recursivo que devuelva verdadero si un valor determinado se  encuentra en la lista o falso en caso contrario.}

program modulos;
type
  lista = ^cadena;

  cadena = record
    dato: integer;
    sig: lista;
  end;

procedure agregarAdelante( var l:lista; num:integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato:= num;
  aux^.sig:= l;
  l:= aux;
end;

procedure cargarLista(var l:lista);
var
  numero:integer;
begin
  randomize;
  numero:= random(10)-1;
  while(numero <> 0) do begin
    writeln('numero aleatorio: ',numero);
    agregarAdelante(l,numero);
    numero:= random(10)-1;
  end;
end;

procedure imprimirLista(l:lista);
begin
  if(l <> nil) then begin
    imprimirLista(l^.sig);
    writeln(l^.dato);
  end;
end;

function maximo(l:lista; var max:integer):integer;
begin
  if(l <> nil) then begin
    if(l^.dato > max) then
      max:= l^.dato;
    maximo(l^.sig,max);
  end;
  maximo:= max;
end;

function minimo(l:lista; var min:integer):integer;
begin
  if(l <> nil) then begin
    if(l^.dato < min) then
      min:= l^.dato;
    minimo(l^.sig,min);
  end;
  minimo:= min;
end;

procedure maxYmin(l:lista);
var
  max, min:integer;
begin
  max:= -32767;
  min:= 32766;
  writeln('el valor maximo de la lista es: ',maximo(l,max));
  writeln('el valor minimo de la lista es: ',minimo(l,min));
end;

function busqueda(l:lista; number:integer; var exito:boolean): boolean;
begin
  if(l <> nil) and (not exito) then begin
    if(number = l^.dato) then
      exito:= true;
    busqueda(l^.sig,number,exito);
  end;
  busqueda:= exito;
end;

procedure trueORfalse(l:lista);
var
  exito:boolean;
  number:integer;
begin
  exito:= false;
  writeln('ingrese un numero a buscar');
  readln(number);
  writeln('¿Se encontro el valor? ( ',busqueda(l,number,exito),' )');
end;

var
  l:lista;
begin
  l:= nil;
  cargarLista(l);
  writeln;
  imprimirLista(l);
  writeln;
  maxYmin(l);
  writeln;
  trueORfalse(l);
  writeln('Ingrese un valor');
  readln;
end.
