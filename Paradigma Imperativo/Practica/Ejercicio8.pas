{8. Escribir un programa que: 
a.  Implemente un modulo que lea numeros enteros y los almacene en un arbol binario  de busqueda. La lectura finaliza con el valor 0.
b.  Una vez generado el árbol, realice módulos independientes para:
 i.  Obtener el numero mas grande.
 ii. Obtener el numero mas chico.
 iii.Obtener la cantidad de elementos.
 iv. Informar los numeros en orden creciente.
 v.  Informar los numeros pares en orden decreciente.
Nota: Tener en cuenta que cada numero debe aparecer una unica vez en el arbol.}

program irrepetible;
Type
  arbol = ^nodo;

  nodo = record
   dato: integer;
   HI: arbol;
   HD: arbol;
  end;
  
Procedure crearNodo (var A:arbol; num:integer);
begin
  if(A = nil) then begin
    new(A);
    A^.dato:= num; A^.HI:= nil; A^.HD:= nil;
  end
  else
    if(num < A^.dato) then
      crearNodo(A^.HI,num)
    else
        crearNodo(A^.HD,num);
end;

procedure crearArbol(var A : arbol);
var
  numero, i: integer;
begin
    i:= 1;
    A:= nil;
	Randomize;
    numero := Random(10)-1;
	while(numero <> 0) do begin
        writeln('El numero en la posicion ',i,' es: ',numero);
		crearNodo(A,numero);
        numero := Random(10)-1;
        i:= i+1;
	end;
end;

function maximo(A:arbol):integer;
begin
  if(A = nil) then
    maximo:= -33767
  else
    if(A^.HD = nil) then
      maximo:= A^.dato
    else
      maximo:= maximo(A^.HD);
end;

function minimo(A:arbol):integer;
begin
  if(A = nil) then
    minimo:= 33766
  else
    if(A^.HI = nil) then
      minimo:= A^.dato
    else
      minimo:= minimo(A^.HI);
end;

procedure cantidad(A:arbol; var cant:integer);
begin
  if(A <> nil) then begin
    if(A^.HI <> nil) then
      cantidad(A^.HI, cant);
    if(A^.HD <> nil) then
      cantidad(A^.HD, cant);
    cant:= cant + 1;
  end;
end;

procedure enOrden(A:arbol);
begin
  if(A <> nil) then begin
    enOrden(A^.HI);
    writeln(A^.dato);
    enOrden(A^.HD);
  end;
end;

procedure descendente(A:arbol);
begin
  if(A <> nil) then begin
    descendente(A^.HD);
    if((A^.dato) mod 2 = 0) then
      writeln(A^.dato);
    descendente(A^.HI);
  end;
end;

var
  A:arbol;
  cant:integer;
begin
  cant:= 0;
  crearArbol(A);
  writeln('Los numeros en orden creciente');
  enOrden(A);
  writeln('El numero mas grande es: ',maximo(A));
  writeln('El numero mas chico es: ',minimo(A));
  cantidad(A,cant);
  writeln('La cantidad de elementos es: ',cant);
  writeln('Los numeros PARES en orden decreciente');
  descendente(A);
readln;
end.



