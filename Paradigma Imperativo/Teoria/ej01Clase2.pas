program recursion;
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
  numero, cant:integer;
begin
  cant:= 0;
  randomize;
  numero:= random(54);
  while(cant < 8) do begin
    writeln('numero aleatorio: ',numero);
    cant:= cant + 1;
    agregarAdelante(l,numero);
    numero:= random(54);
  end;
end;

procedure imprimirLista(l:lista);
begin
  if(l <> nil) then begin
    writeln(l^.dato);
    l:= l^.sig;
    imprimirLista(l);
  end;
end;

procedure imprimirLista2(l:lista);  // imprime al reves
begin
  if(l <> nil) then begin
    imprimirLista2(l^.sig);
    writeln(l^.dato);
  end;
end;

var
  l:lista;
begin
  l:= nil;
  cargarLista(l);
  imprimirLista(l);
  writeln;
  writeln('presione enter para imprimir la lista al reves');
  readln();
  imprimirLista2(l);
  writeln;
  readln;
end.






