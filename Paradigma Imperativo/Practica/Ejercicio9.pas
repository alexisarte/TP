{9. Implemente un programa que invoque a un modulo que genere un Arbol binario de  busqueda con nombres de personas que se leen desde teclado.
La lectura finaliza con el nombre 'ZZZ'. Tambien debe invocar a otro modulo que reciba el Arbol generado y un  nombre,
y retorne verdadero si existe dicho nombre en el Arbol o falso en caso contrario.}

program nombres;
Type
  arreglo = string[25];
  arbol = ^nodo;

  nodo = record
   dato: arreglo;
   HI: arbol;
   HD: arbol;
  end;
  
procedure crearNodo(var A:arbol; name:string);
begin
  if(A = nil) then begin
    new(A);
    A^.dato:= name; A^.HI:= nil; A^.HD:= nil;
  end
  else
    if(name < A^.dato) then
      crearNodo(A^.HI,name)
    else
      crearNodo(A^.HD,name);
end;

procedure crearArbol(var A : arbol);
var
  name: string;
begin
    A:= nil;
    write('Nombre: ');
    readln(name);
	while(name <> 'ZZZ') do begin
		crearNodo(A,name);
        writeln;
        write('Nombre: ');
        readln(name);
	end;
end; 

function existe(A:arbol; name:string):boolean;
begin
  if(A = nil) then
    existe:= false
  else 
    if(name = A^.dato) then
      existe:= true
    else
      if(name < A^.dato) then
        existe:= existe(A^.HI,name)
      else
        existe:= existe(A^.HD,name);
end; 

procedure truorfal(A:arbol);
var
  nombre:string;
begin
  writeln('escriba el nombre a buscar');
  readln(nombre);
  writeln('existe el nombre en el arbol? ',existe(A,nombre));
end;

procedure enOrden(A:arbol);
begin
  if(A <> nil) then begin
    enOrden(A^.HI);
    writeln(A^.dato);
    enOrden(A^.HD);
  end;
end;

var
  A:arbol;
begin
  crearArbol(A);
  writeln;
  writeln('ARBOL ORDENADO');
  writeln;
  enOrden(A);
  truorfal(A);
  readln;
end.
