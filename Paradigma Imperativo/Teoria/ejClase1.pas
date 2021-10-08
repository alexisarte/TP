{Utilizando y adaptando los módulos anteriores, implemente el siguiente programa:

Implementar un programa que procese la información de los participantes a un concurso de preguntas y respuestas (como máximo 20). 
De cada participante se lee el código de participante y su edad. 
El ingreso de los participantes finaliza cuando se lee el código -1.
}

program Ejercicio1;
uses crt;
const
  dimF = 20;
type
  indice = 0..dimF ;
  rango = 1..dimF;

  participante = record
    codigo:integer;
    edad:integer;
  end;
  
  v_participantes = array[rango] of participante;

  lista = ^cadena;
  cadena = record
    dato:participante;
    sig:lista;
  end;
  
//a. Almacenar la información que se lee en un vector.
procedure cargarVector(var v:v_participantes; var dimL:indice);
var
  p:participante;
begin
  randomize;
  p.codigo:= random(20)-1;
  p.edad:= random(29)+1;
  while(dimL < dimF) and (p.codigo <> -1)do begin
    dimL:= dimL + 1;
    v[dimL].codigo:= p.codigo;
    v[dimL].edad:= p.edad;
    p.codigo:= random(20)-1;
    p.edad:= random(29)+1;
  end;
end;

//b. Mostrar la información almacenada.
procedure informarVector(v:v_participantes; dimL:indice);
var 
  i:rango;
begin
  for i:= 1 to dimL do begin
    Writeln('participante numero: ',i);
    writeln('codigo: ',v[i].codigo);
    writeln('edad: ',v[i].edad);
    writeln('-------------------------------------------------');
  end;
end;

//c. Ordenar el vector de participantes por edad.
procedure vectorOrdenado(var v:v_participantes; dimL: indice);
var 
  i, j: indice;
  actual:participante;
begin
  for i:= 2 to dimL do begin
    actual:= v[i];
    j:= i-1;
    while (j > 0) and (actual.edad < v[j].edad) do begin
      v[j+1]:= v[j];
      j:= j-1;
    end;
    v[j+1]:= actual;
  end;
end;

function buscarPos(v:v_participantes; dimL:indice ; edad1, edad2:integer): indice ;
var
   pos:indice;
   exito:boolean;
begin
  exito:= false;
  pos:=1;
    while (dimL <= dimF) and (not exito) do begin
      if (edad1 = v[pos].edad) or (edad2 = v[pos].edad)then
        exito:= true
      else
       pos:= pos + 1;
    end;
    if(not exito)then
      pos:= 0;
    buscarPos:= pos;
end;

//e. Eliminar del vector ordenado los participantes con edades entre 20 y 22.
procedure borrarElement(var v:v_participantes; var dimL:indice);
var
  i:rango;
  posi:rango;
  edad1,edad2: integer;
begin
  edad1:= 20;
  edad2:= 22;
  posi:= buscarPos(v,dimL,edad1,edad2);
  while ((posi >= 1) and (posi <= dimL))do begin
    for i:= posi + 1 to dimL do
      v[i-1]:= v[i];
    dimL:= dimL - 1;
    posi:= buscarPos(v,dimL,edad1,edad2);
  end;
end;

{procedure eliminar (var v:arreglo;var dimL:integer);
 var
  aux:integer;
  i:integer;
  j:integer;
 begin
   aux:=dimL;
   for i:=1 to dimL do begin
     if(v[i].edad >= 20) and (v[i].edad <= 22) then begin
       for j:=i to aux do 
         v[j]:=v[j+1];
       aux:=aux-1;
     end;
   end;
   dimL:=aux;
 end;}

procedure agregarAtras(var l, ult:lista; con:participante);
var
  aux:lista;
begin
  new(aux);
  aux^.dato:= con ;
  aux^.sig:= nil;
  if(l= nil) then
    l:= aux
  else
    ult^.sig:= aux;
  ult:= aux;
end;

//g. Generar una lista ordenada de menor a mayor con los participantes que quedaron el el vector después de realizar el inciso e.
procedure cargarLista(var l:lista; v:v_participantes; dimL:indice);
var
  ult:lista;
  i:indice;
begin
  ult:= nil;
  i:= 0;
  while (i < dimL ) do begin
    i:= i+1;
    agregarAtras(l,ult,v[i]);
  end;
end;

procedure imprimirLista(l:lista);
begin
  while (l <> nil) do begin
    writeln('codigo de concursante: ' ,l^.dato.codigo, ', edad: ',l^.dato.edad);
    l:= l^.sig;
  end;
end;

var
  dimL:indice;
  v:v_participantes;
  l:lista;
begin
  l:= nil;
  dimL:= 0;
  cargarVector(v, dimL);
  if (dimL <> 0) then begin
    informarVector(v, dimL);
    writeln('PRESIONE ENTER PARA ORDENAR EL VECTOR');
    readln();
    vectorOrdenado(v,dimL );
    //d. Mostrar el vector ordenado.
    informarVector(v, dimL);
    writeln('Enter para Eliminar del vector ordenado los participantes con edades entre 20 y 22.');
    readln();
    borrarElement(v,dimL);
    //f. Mostrar el vector resultante.
    informarVector(v,dimL);
    writeln('PRESIONE ENTER PARA VER LA LISTA');
    readln();
    cargarLista(l,v,dimL);
    imprimirLista(l);
  end
  else
    writeln('el vector esta vacio');
  readln;
end.
