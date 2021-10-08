{10. Implementar un programa que contenga: 

a. Un moulo que lea informacion de alumnos de Taller de Programacion y almacene en  una estructura de datos solo a aquellos alumnos que
posean año de ingreso posterior al  2000. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la  busqueda por dicho
criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de  ingreso.

b. Un modulo que reciba la nueva estructura e informe el nombre y apellido de aquellos  alumnos cuyo legajo sea superior a 12803.

c. Un modulo que reciba la nueva estructura e informe el nombre y apellido de aquellos  alumnos cuyo legajo este comprendido entre 2803 y 6982.}

program  taller;
type
  alumno = record
    legajo:integer;
    nomYape:string;
    DNI:integer;
    ingreso:integer;

  end;

  arbol = ^nodo;

  nodo = record
    dato: alumno;
    HI: arbol;
    HD: arbol;
  end;

procedure leerAlumno(var al:alumno);
begin
  with al do begin
    writeln('ingrese el legajo del alumno');
    readln(legajo);
    if(legajo <> 0) then begin
      writeln('ingrese el anio de ingreso');
      readln(ingreso);
      writeln('nombre y apellido');
      readln(nomYape);
      writeln('ingrese el DNI');
      readln(DNI);
    end;
  end;
end;

procedure crearNodo(var A:arbol; al:alumno);
begin
  if(A = nil) then begin
    new(A);
    A^.dato:= al; A^.HI:= nil; A^.HD:= nil;
  end           
  else          
    if(al.legajo < A^.dato.legajo) then
      crearNodo(A^.HI,al)
    else
      crearNodo(A^.HI,al);
end;

procedure crearArbol(var A:arbol);
var
al:alumno;
begin
  leerAlumno(al);
  while(al.legajo <> 0) do begin
    if(al.ingreso >= 2000) then
      crearNodo(A,al);
    leerAlumno(al);
  end;
end;

procedure mostrar(alu:alumno);
begin
  writeln('NOMBRE Y APELLIDO: ',alu.nomYape);
  writeln('legajo: ',alu.legajo);
  writeln('ingreso: ',alu.ingreso);
  writeln('DNI: ',alu.DNI);
  writeln('--------------------------------------');
end;
procedure imprimir(A:arbol);
begin
  if(A <> nil) then begin
    imprimir(A^.HI);
    mostrar(A^.dato);
    imprimir(A^.HD);
  end;
  writeln;
end;

procedure superior(A:arbol);
begin
  if(A <> nil) then  begin
    superior(A^.HI);
    if((A^.dato.legajo) > 12803) then
      writeln(A^.dato.nomYape);
    superior(A^.HD);
  end;
  writeln;
end;

procedure comprendido(A:arbol);
begin
  if(A <> nil) then  begin
    comprendido(A^.HI);
    if(A^.dato.legajo >= 2803) and(A^.dato.legajo <= 6982) then
      writeln(A^.dato.nomYape);
    comprendido(A^.HD);
  end;
end;

var
  A:arbol;
begin
  crearArbol(A);
  imprimir(A);
  writeln('Nombre y apellido de aquellos  alumnos cuyo legajo es superior a 12803');
  writeln;
  superior(A);
  writeln('Nombre y apellido de aquellos  alumnos cuyo legajo este comprendido entre 2803 y 6982');
  writeln;
  comprendido(A);
  readln;
end.
