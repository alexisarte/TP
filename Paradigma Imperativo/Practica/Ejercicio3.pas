{3. Una libreria requiere el procesamiento de la información de sus productos. De cada  producto se conoce el código del producto,
código de rubro (del 1 al 6) y precio. Iplementar un programa modularizado que:
 
a. Lea los datos de los productos y los almacene ordenados por código de producto y  agrupados por rubro, en una estructura de datos 
adecuada. El ingreso de los productos  finaliza cuando se lee el precio -1.
 
Una vez almacenados, muestre los codigos de los productos pertenecientes a cada rubro:

b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.  Considerar que puede haber más o menos de 30 productos del 
rubro 3. Si la cantidad de  productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e  ignore el resto.  

c. Ordene, por precio, los elementos del vector generado en b). 

d. Muestre los precios del vector ordenado.}

program libreria;
const
  MAX = 6;
  MAX2 = 30;
type
  rango = 1..MAX;
  rango2 = 1..MAX2;

  producto = record
    codProd: integer;
    codRubro: rango;
    precio: real;
  end;

  lista = ^nodo;

  nodo = record
    dato: producto;
    sig: lista;
  end;

  v_productos = array[rango]of lista;
  v_rubro3 = array[rango2]of producto;

procedure leerProducto(var p:producto);
begin
  write('ingrese el precio del producto: ');
  read(p.precio);
  if(p.precio <> -1)then begin
    write('ingrese el codigo del producto: ');
    read(p.codProd);
    write('ingrese el codigo de rubro: ');
    read(p.codRubro);
  end;
end;

procedure inicializarVector (var v:v_productos);
var
  i:rango;
begin
	for i:= 1 to MAX do
		v[i]:= nil;
end;

procedure agregarOrdenado(var l:lista; p:producto);
var
  ant, act, aux: lista;
begin
  new(aux);
  aux^.dato:= p;
  act:= l;
  ant:= l;
  while(act <> nil) and (p.codProd > act^.dato.codProd) do begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act = ant) then
    l:= aux
  else
    ant^.sig:= aux;
  aux^.sig:= act;
end;

procedure cargarListas(var v:v_productos);
var
  p:producto;
begin
  inicializarVector(v);
  leerProducto(p);
  while(p.precio <> -1) do begin
    agregarOrdenado(v[p.codRubro],p);
    leerProducto(p);
  end;
end;

procedure imprimirListas(v:v_productos);
var
  i:rango;
  aux:lista;
begin
  for i:= 1 to MAX do begin
    aux:= v[i];
    writeln('codigos de los productos pertenecientes al rubro: ',i);
    while(aux <> nil) do begin
      writeln(aux^.dato.codProd);
      aux:= aux^.sig;
    end;
  end;
end;

procedure tercerRubro(l:lista; var r:v_rubro3; var diml:integer);
begin
  while(diml < MAX2) and (l <> nil)  do begin
    dimL:= dimL + 1;
    r[dimL]:= l^.dato;
    l:= l^.sig;
  end;
end;

procedure informarVector(r:v_rubro3; diml:integer);
var
  i:rango2;
begin
  for i:= 1 to dimL do
    writeln('precio: ',r[i].precio);
end;

procedure ordenarVector(var r:v_rubro3; dimL:integer);
var
  i, j: rango2;
  actual:producto;
begin
  for i:= 2 to dimL do begin
    actual:= r[i];
    j:= i-1;
    while(j > 0) and (r[j].precio > actual.precio) do begin
      r[j+1]:= r[j];
      j:= j-1;
    end;
    r[j+1]:= actual;
  end;
end;

var
  v:v_productos;
  r:v_rubro3;
  dimL:integer;
begin
  dimL:= 0;
  cargarListas(v);
  imprimirListas(v);
  tercerRubro(v[3], r, diml);
  writeln;
  writeln('Los precios del vector desordenado son los siguientes:');
  informarVector(r, diml);
  ordenarVector(r,dimL);
  writeln('Los precios del vector ordenado son los siguientes:');
  informarVector(r, diml);
  readln;
  readln;
end.
