{5. Escribir un programa que: 

a. Implemente un módulo que genere un vector de 20 nÃºmeros enteros.

b. Implemente un módulo recursivo que devuelva el mÃ¡ximo valor del vector.

c. Implementar un módulo  recursivo que devuelva la suma de los valores contenidos en  el vector.}

program ejercicio5;
const
  MAX = 20;
type
  rango = 1..MAX;
  
  v_enteros = array[rango] of integer;

  vector = ^v_enteros; // puntero que va a servir para el inciso C, asi no paso 20 copias del vector.

procedure cargarVector(var puntero: vector);
var 
  number: integer;
  i: rango;
begin 
  randomize;
  for i:= 1 to MAX do begin
    number:= random(10);
    puntero^[i]:= number;
    writeln('el numero en la posicion ',i,' es: ',puntero^[i]);
  end;
end;

procedure maximo(puntero: vector; var maxi,i:integer);
begin
  if(i < MAX) then begin
    if(puntero^[i] > maxi) then
      maxi:= puntero^[i];
    i:= i+1;
    maximo(puntero,maxi,i);
  end;
end;

function suma(puntero: vector; dimL: integer): integer;
begin
 	if(puntero = nil) or (dimL = 0) then
 		Suma:= 0
 	else
		suma:= puntero^[dimL] + suma(puntero, dimL - 1);
end;
    
procedure maximoYsuma(puntero: vector);
var
  i, maxi:integer;
begin
  i:= 1;
  maxi:= -32677;
  maximo(puntero,maxi,i);
  writeln('El maximo valor del vector es: ', maxi);
  writeln('La suma de los valores contenidos en  el vector es: ',suma(puntero,20));
end;

var
  puntero: vector;
begin
  new(puntero);
  cargarVector(puntero);
  writeln;
  maximoYsuma(puntero);
  readln;
end.
