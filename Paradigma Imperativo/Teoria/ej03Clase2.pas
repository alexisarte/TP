{
1. Realice un módulo que lea los datos de 10 números enteros y los almacene en un ABB.

2. Dada la estructura generada en 1. realice un programa que sume todos los elementos del arbol.

3. Dada la estructura generada en 1. realice un programa que informe el valor mÃ¡ximo almacenado en la estructura.
}

program arbusto;
type
  arbol = ^nodo;
  
  nodo = record
    dato: integer;	
    HI: arbol;
    HD: arbol;
  end;
  
procedure crearNodo(var AR: arbol; num:integer);
begin
  if(AR = nil) then begin
    new(AR);
    AR^.dato:= num; AR^.HI:= nil; AR^.HD:= nil;
  end
  else
    if(num < AR^.dato)then
      crearNodo(AR^.HI, num)
    else
      crearNodo(AR^.HD, num);
end; 

procedure enOrden(AR:arbol);
begin
  if(AR <> nil) then begin
    enOrden(AR^.HI);
    writeln(AR^.dato);
    enOrden(AR^.HD);
  end;
end;

procedure crearArbol(var AR : arbol);
var
  num,i : integer;
begin
    AR:= nil;
	Randomize;
	for i:=1 to 10 do begin
		num := Random(100);
        writeln('valor aleatorio: ',num);
		crearNodo(AR,num);
	end;
end;

function sumarArbol(AR:arbol): integer;
begin
  if(AR = nil) then
    sumarArbol:= 0
  else
    sumarArbol:= AR^.dato + sumarArbol(AR^.HI) + sumarArbol(AR^.HD);
end;

function maximo(AR:arbol): integer;
begin
  if(AR = nil) then
    maximo:= -32767
  else 
    if(AR^.HD = nil) then
      maximo:= AR^.dato
    else 
      maximo := maximo(AR^.HD);
end;

var
  AR:arbol;
begin
  crearArbol(AR);
  writeln;
  enOrden(AR);
  writeln;
  writeln('la suma de los vaores del ARBOL es: ',sumarArbol(AR));
  writeln('el valor maximo del ARBOL es: ',maximo (AR));
  readln;
end.
