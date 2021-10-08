{6. Implementar un modulo que realice una busqueda dicotomica en un vector, utilizando el  siguiente encabezado:

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);  

Nota: El parametro pos debe retornar la posicion del dato  -1 si el dato no se  encuentra en el vector.}

program dicotomica;
const
  MAX = 10;
type
  indice = -1..MAX;
  rango = 1..MAX;

  vector = array[rango] of integer;

procedure cargarVector(var v:vector);
var 
  number: integer;
  i: rango;
begin 
  randomize;
  number:= random(100);
  for i:= 1 to MAX do begin
    v[i]:= number;
    number:= random(100);
  end;
end;

procedure informarVector(v:vector);
var
  i:rango;
begin
  for i:= 1 to MAX do
    writeln('el numero en la posicion ',i,' es: ',v[i]);
  writeln;
end;

procedure ordenarVector(var v:vector);
var
  i, j: rango;
  actual:integer;
begin
  for i:= 2 to MAX do begin
    actual:= v[i];
    j:= i-1;
    while(j > 0) and (v[j]> actual) do begin
      v[j+1]:= v[j];
      j:= j-1;
    end;
    v[j+1]:= actual;
  end;
end;

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var
  medio:indice;
begin
  if(ini > fin) then
         pos:= -1
  else
      medio:= (ini + fin) div 2;
      if(dato = v[medio]) then
              pos:= medio
      else
          if(dato < v[medio]) then
                  busquedaDicotomica (v, ini, medio - 1, dato, pos)
          else
              busquedaDicotomica (v,medio + 1, fin, dato, pos);
end;

var
  v:vector;
  ini, fin, pos: indice;
  dato: integer;
begin
  ini:= 1;
  fin:= MAX;
  cargarVector(v);
  informarVector(v);
  writeln('Presione ENTER para ordenar el vector');
  readln();
  ordenarVector(v);
  informarVector(v);
  writeln('Ingrese un numero a buscar');
  readln(dato);
  busquedaDicotomica (v,ini,fin,dato,pos);
  writeln('el numero ingresado esta en la posicion: ',pos);
  readln;
end.




