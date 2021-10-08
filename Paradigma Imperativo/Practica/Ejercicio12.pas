{12. Implementar un programa que procese la información de las ventas de productos de una  librería que tiene 4 sucursales. 
De cada venta se lee fecha de venta, codigo del producto  vendido, codigo de sucursal y cantidad vendida.
El ingreso de las ventas finaliza cuando se  lee el código de sucursal 0. 
Implementar un programa que: 
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en  una estructura de datos adecuada.  
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne una  estructura donde esté acumulada la cantidad total 
vendida para cada código de producto.} 

program halconesDeVentas;
const
  MAX = 4;
type
  rango = 1..MAX;
  r_fecha = record
    dia: 1..30;
    mes: 1..12;
    anio: integer;
  end;

  venta = record
    fecha: r_fecha;
    codProduct: integer;
    codSucursal:rango;
    cantVendida:integer;
  end;

  nuevo = record
    codigo: integer;
    total: integer;
  end;

  lista2 = ^nodo;
  nodo = record
    dato: nuevo;
    sig: lista2;
  end;

  lista = ^cadena;

  cadena = record
    dato: venta;
    sig:lista;
  end;

  v_sucursales = array [rango] of lista;

procedure cargarlistas (var v:v_sucursales);

  procedure inicializarVector(var v:v_sucursales);
  var
	i:rango;
  begin
	for i:= 1 to MAX do
		v[i]:= nil;
  end;

  procedure leerFecha(var f:r_fecha);
  begin
    f.dia:= random(30)+1;
    f.mes:= random(12)+1;
    f.anio:= random(2020)+1;
  end;

  procedure leerVenta(var h:venta);
  var f: r_fecha;
  begin
    h.codSucursal:= random(5);
	if (h.codSucursal <> 0)then begin
        leerFecha(f);
        h.fecha:=f;
        h.codProduct:= random(5);
        h.cantVendida:= random(10);
	end;
  end;

  procedure agregarOrdenado(var l:lista; v:venta);
  var
  ant, act, aux: lista;
  begin
    new(aux);
    aux^.dato:= v;
    ant:= l;
    act:= l;
    while(act <> nil) and (v.codProduct > act^.dato.codProduct) do begin
      ant:= act;
      act:= act^.sig;
    end;
    if(ant = act) then
      l:= aux
    else
      ant^.sig:= aux;
    aux^.sig:= act;
  end;

var
	h:venta;
begin

    inicializarVector(v);
    leerVenta(h);
	while (h.codSucursal <> 0) do begin
		agregarOrdenado (v[h.codSucursal],h);
        leerVenta(h);
	end;
end;

procedure imprimirL(l: lista);
begin
    if (l <> nil) then  begin
        writeln('fecha: ',l^.dato.fecha.dia,'/',l^.dato.fecha.mes,'/',l^.dato.fecha.anio);
        writeln('codigo del producto  vendido: ', l^.dato.codProduct);
        writeln('codigo de sucursal : ', l^.dato.codSucursal);
        writeln('cantidad vendida: ', l^.dato.cantVendida);
        writeln('-------------------------------------');
        imprimirL (l^.sig);
    end;
end;

procedure imprimirListas(var v:v_sucursales);
var 
    i: integer;
begin
    for i:=1 to MAX do begin
        writeln;
        writeln('====================> SUCURSAL ', i,' <=====================');
        writeln();
        imprimirL(v[i]);
        Writeln; 
    end;
end;

procedure Merge(var nueva:lista2; v:v_sucursales);

  procedure minimo(var v:v_sucursales; var minion:venta);
  var
    indice, i: rango;
  begin
    minion.codProduct:= 32767;
    for i:= 1 to MAX do begin
      if(v[i] <> nil) then
        if(v[i]^.dato.codProduct <= minion.codProduct) then begin
          indice:= i;
          minion:= v[i]^.dato;
        end;
    end;
    if(minion.codProduct <> 32767) then
      v[indice]:= v[indice]^.sig;
  end;

  procedure agregarAtras(var  l,ult:lista2; v:nuevo);
  var aux:lista2;
  begin
    new(aux);
    aux^.dato:= v;
    aux^.sig:= nil;
    if(l = nil) then
      l:= aux
    else
      ult^.sig:= aux;
    ult:= aux;
  end;

var
  minion: venta;
  act: nuevo;
  ult:lista2;
begin
  nueva:= nil;
  minimo(v,minion);
  while(minion.codProduct <> 32767) do begin
    act.codigo:= minion.codProduct;
    act.total:= 0;
    while(minion.codProduct <> 32767) and (minion.codProduct = act.codigo) do begin
      act.total:= act.total + minion.cantVendida;
      minimo(v,minion);
    end;
      agregarAtras(nueva,ult,act);
  end;
end;

procedure imprimirMerge(l:lista2);
begin
  if (l <> nil) then  begin
        writeln('codigo del producto  vendido: ', l^.dato.codigo);
        writeln('cantidad vendida: ', l^.dato.total);
        writeln('-------------------------------------');
        imprimirMerge (l^.sig);
    end;
end;

var
  v:v_sucursales;
  nueva:lista2;
begin
  randomize;
  cargarlistas (v);
  imprimirListas(v);
  Merge(nueva,v);
  writeln('Lista Merge');
  writeln;
  imprimirMerge(nueva);
  readln;
end.
