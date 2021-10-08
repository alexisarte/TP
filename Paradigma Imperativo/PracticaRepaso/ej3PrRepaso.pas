{
3. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone
en papel de la información de los autos en venta.
Implementar un programa que:

a) Genere un árbol binario de búsqueda ordenado por patente identificatoria
del auto en venta. Cada nodo del árbol debe contener patente, año de
fabricación (2010..2018), la marca y el modelo.

b) Contenga un módulo que recibe el árbol generado en a) y una marca y
devuelva la cantidad de autos de dicha marca que posee la agencia.
Mostrar el resultado.

c) Contenga un módulo que reciba el árbol generado en a) y retorne una
estructura con la información de los autos agrupados por año de
fabricación.

d) Contenga un módulo que reciba el árbol generado en a) y una patente y
devuelva el año de fabricación del auto con dicha patente. Mostrar el
resultado.
}

program ej3PrRepaso;
const
    MAX = 9;
type
    rango_fab = 2010..2018;
    
    nave = record
        patente: integer;
        anioFab: rango_fab;
        marca: string;
        modelo: String;
    end;

    arbol = ^nodo;
    nodo = record
        dato: nave;
        HI: arbol;
        HD: arbol;
    end;

    lista = ^cadena;
    cadena = record
           dato: nave;
           sig: lista;
    end;

    vector = array [1..MAX] of lista;

procedure crearArbol(var A : arbol);
    
    procedure leerNave(var n: nave);
    begin
        writeln('Ingrese la marca del auto');
        readln(n.marca);
        if (n.marca <> 'ZZZ') then begin
            n.patente:= Random(100) + 1;
            n.anioFab:= Random(9) + 2010;
            writeln('Ingrese el modelo');
            readln(n.modelo);
        end;
    end;

    procedure crearNodo(var A:arbol; n:nave);
    begin
        if (A = nil) then begin
            new (A);
            A^.dato:= n; A^.HI:= nil; A^.HD:= nil;
        end
        else
        if (n.patente < A^.dato.patente) then
            crearNodo(A^.HI, n)
        else
            crearNodo(A^.HD, n);
    end;

var
   n: nave;
begin
     Randomize;
     A:= nil;
     leerNave(n);
     while(n.marca <> 'ZZZ') do begin
        crearNodo(A, n);
        leerNave(n);
     end;
end;

procedure imprimirNave (n: nave);
begin
    writeln('Patente: ', n.patente);
    writeln('Anio de fabricacion: ', n.anioFab);
    writeln('Marca: ', n.marca);
    writeln('Modelo: ', n.modelo);
    writeln('-------------------------------------');
end;

procedure imprimirEnOrden(A:arbol);
begin
     if (A <> nil) then begin
        imprimirEnOrden(A^.HI);
        imprimirNave(A^.dato);
        imprimirEnOrden(A^.HD);
     end;
end;
    
procedure marcaIgual(A:arbol; m: String; var cant: integer);
begin
     if (A <> nil) then begin
        if (m = A^.dato.marca) then
            cant:= cant + 1;
        marcaIgual (A^.HI, m, cant);
        marcaIgual (A^.HD, m, cant);
     end;
end;

procedure inicializarVector(var v:vector);
var 
    i:integer;
begin
    for i:= 1 to MAX do
        v[i]:= nil;
end;

procedure cargarVector(A:arbol; var v:vector);
    
    procedure agregarAdelante(var L: lista; n: nave);
    var
        aux: lista;
    begin
        new(aux);
        aux^.dato:= n;
        aux^.sig:= L;
        L:= aux;
    end;    

begin
    if ( A <> nil) then begin
        agregarAdelante(v[(A^.dato.anioFab) - 2009], A^.dato); 
        cargarVector(A^.HI, v);
        cargarVector(A^.HD, v);
    end;
end;

function buscar(A:arbol; p:integer):integer;
begin
     if (A = nil) then
        buscar:= 0
     else begin
        if (p = A^.dato.patente) then
            buscar:= A^.dato.anioFab
        else
            if (p > A^.dato.patente) then
               buscar(A^.HI, p)
            else
                buscar(A^.HD, p);
     end;
end;

procedure imprimirLista(L:lista);
begin
     while(l <> nil) do begin
             imprimirNave(l^.dato);
             l:= l^.sig;
     end;
end;

procedure imprimirVector(v:vector);
var
   i:integer;
begin
     for i:= 1 to MAX do begin
         writeln('-------------------------------> ANIO ',i + 2009,'<-------------------------------');
         imprimirLista(v[i]);
     end;
end;

var
    A: arbol;
    m: String;
    cant: integer;
    v: vector;
    p: integer;
begin
    cant:= 0;

    crearArbol(A);
    imprimirEnOrden(A);

    writeln('Ingrese la marca a buscar');
    readln(m);
    marcaIgual(A, m, cant);
    writeln('La cantidad de autos marca ',m,' que posee la agencia es: ',cant);

    inicializarVector(v);
    cargarVector(A, v);
    imprimirVector(v);
    writeln('Ingrese una patente');
    readln(p);
    if((buscar(A, p))= 0) then
        writeln('El auto con la patente ', p,' NO EXISTE')
    else
        writeln('El anio de fabricacion del auto con patente ',p,' es: ',buscar(A, p));
    readln;
end.


