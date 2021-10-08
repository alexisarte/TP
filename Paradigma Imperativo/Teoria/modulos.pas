program modulos;
uses crt;
const
  dimF = 20;
type
  indice = 0..dimF ;
  rango  = 1..dimF;
  v_enteros = array[rango] of integer;

  lista = ^cadena;
  cadena = record
    dato:integer;
    sig:lista;
  end;

// 1. Realice un módulo que genere y devuelva un arreglo de enteros. La carga del arreglo debe realizarse hasta que se lee el número 0 o se hayan leído 20 números.
procedure cargarVector(var v:v_enteros; var dimL:integer);
var
  num:integer;
begin
  dimL:= 0;
  randomize;
  num:= random(10);
  while(dimL < dimF) and (num <> 0)do begin 
    dimL:= dimL + 1;
    v[dimL]:= num;
    num:= random(21);
  end;
end;

// 2. Realice un módulo que reciba un arreglo e imprima todo su contenido.
procedure informarVector(v:v_enteros; dimL:indice);
var 
  i:rango;
begin
  for i:= 1 to dimL do
    Writeln('el numero en la posicion ' ,i,  ' es:  ' ,v[i]);
end;

// 3. Realice un módulo que reciba un arreglo y un valor num, y de ser possible elimine del arreglo el valor num.
function buscarPos(v:v_enteros; dimL:indice ; num:integer): indice ;
var
   pos:indice;
   exito:boolean;
begin
  exito:= false;
  pos:=1;
    while (dimL <= dimF) and (not exito) do begin
      if ( num = v[pos]) then
        exito:= true
      else
       pos:= pos + 1;
    end;
    if(not exito)then
      pos:= 0;
    buscarPos:= pos;
end;

procedure borrarElement(var v:v_enteros; num:integer; var dimL:integer);
var
  i:rango;
  pos:rango;
begin
  pos:= buscarPos(v,dimL,num);
  if(pos >= 1) and (pos <= dimL)then begin
    for i:= pos + 1 to dimL do
      v[i-1]:= v[i];
    dimL:= dimL - 1;
  end;
end;

{4. Realice un módulo que genere una lista de enteros de manera aleatoria hasta leer el número 15. Se sugiere que la función ramdom genere números entre 0 y 15.
Los elementos deben quedar almacenados en la lista en el mismo orden en que fueron leídos.}
procedure cargarLista(var l:lista);

  procedure agregarAtras(var l, ult:lista; numero:integer);
  var
    aux:lista;
  begin
    new(aux);
    aux^.dato:= numero;
    aux^.sig:= nil;
    if(l = nil) then
      l:= aux
    else
      ult^.sig:= aux;
    ult:= aux;
  end;

var
  numero:integer;
  ult:lista;
begin
  ult:= nil;
  randomize;
  numero:= random(16);
  while (numero <> 15) do begin
    agregarAtras(l,ult,numero);
    numero:= random(16);
  end;
end;

procedure imprimirLista(l:lista);
begin
  while (l <> nil) do begin
    writeln('valor aleatorio: ' ,l^.dato);
    l:= l^.sig;
  end;
end;

var
  dimL:integer;
  valor: integer;
  v:v_enteros;
  l:lista;
begin
  l:= nil;
  cargarVector(v, dimL);
  if(dimL <> 0)then begin
      informarVector(v, dimL);
      writeln;
      writeln('ingrese un numero a eliminar');
      readln(valor);
      borrarElement(v,valor,dimL);
      informarVector(v,dimL);
  end
  else
      writeln('el vector esta vacio');
  writeln;
  writeln('Presione enter para cargar la lista');
  readln;
  cargarLista(l);
  imprimirLista(l);
  readln;
end.

