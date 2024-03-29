{Suponiendo que 4 integrantes de una familia, llevan sus gastos de manera similar a Juan y Paula. Se pide:

a. Generar la estructura para almacenar los gastos de cada uno de los integrantes. Cada estructura debe generarse de manera ordenada 
por nombre de gasto. Cada estructura se carga hasta leer el nombre �ZZ�.
b. Imprimir las estructuras generadas en a.
c. Realizar el merge de manera de generar una �nica estructura que contenga los montos totales por impuesto con la estructura generada en a.
d. A partir de la estructura generada en c. arme un ABB ordenado por monto total y luego imprima el nombre del gasto de menor costo.}

Program activity2;
const
  dimF = 4;
type
     cadena25 = string [25];
     gasto = record
              tipo: cadena25;
              monto: real;
             end;
        
     lista = ^nodo;
     nodo = record
             dato: gasto;
             sig: lista;
            end;
     vector = array [1..dimF] of lista;
     arbol = ^nodoA;
     nodoA = record
              dato: gasto;
              hi: arbol;
              hd: arbol;
             end;
               
//Estructura para cargar nombres de tipo de gasto de manera automatica
    tiposDeGastos = array[1..10] of cadena25;


procedure imprimirLista (l: lista);
begin
    if (l<>NIL) then  begin 
        writeln('Gasto: ', l^.dato.tipo, '| Monto: ', l^.dato.monto:2:2);
        ImprimirLista (l^.sig);                                    
        end;
end;

procedure imprimir (v: vector);    
var 
    i: integer;
begin
    for i:=1 to dimf do begin
        writeln ('Lista ', i);       
        ImprimirLista ( v[i]);     
        Writeln; 
    End;
End;

procedure cargarGastos(var v:vector);

    procedure generarTiposDeGastos (var tipos: tiposDeGastos);
    begin
        tipos[1] := 'Impuestos';
        tipos[2] := 'Ropa';
        tipos[3] := 'Almacen';
        tipos[4] := 'Verduleria';
        tipos[5] := 'Panaderia';
        tipos[6] := 'Peluqueria';    
        tipos[7] := 'Combustible';
        tipos[8] := 'Gimnasio';    
        tipos[9] := 'Extras';        
        tipos[10] := 'ZZ';
    end; 
       
    procedure insertarOrdenado (var l: lista; elem: gasto);
    var  act, ant, aux: lista;
    begin   //creo el nodo  
        new(aux);  
        aux^.dato := elem;  //busco el lugar  
        act:= L;  
        while(act <> nil) and(act^.dato.tipo < aux^.dato.tipo) do begin    
            ant := act;    
            act:= act^.sig  
        end;  
        if(act = L) then  // inserta adelante    
            L:= aux 
        else     
            ant^.sig:= aux; // en el medio o al final                 
        aux^.sig := act; 
    end;
    
    procedure inicializarVectorDeListas (var v: vector);
    var i:integer;
    begin
        for i:=1 to dimF do 
            v[i]:=nil;
    end;

var tipos: tiposDeGastos;
    g: gasto;
    
    
begin     // cargarGastos
  inicializarVectorDeListas (v);
  generarTiposDeGastos(tipos);
  randomize;
  g.tipo := tipos [random(10)+1];
  while (g.tipo <> 'ZZ') do begin
    g.monto:= random(1000) + random(); //random sin parametro retorna valores reales enre 0 y 1.
    insertarOrdenado(v[random(dimF)+1], g);
    g.tipo := tipos [random(10)+1];
  end;
end;

Procedure merge (v:vector; var lNueva:lista);

    Procedure minimo (var v:vector; var min: gasto);
    var i,indiceMin:integer;
        // aux: lista;  se usa si se van a eliminar los nodos de las listas
    begin
    min.tipo := 'ZZZ';
    for i:= 1 to dimF do begin 
        if (v[i] <> nil) then
           if(v[i]^.dato.tipo < min.tipo )then begin
              indiceMin:= i;
              min:= v[i]^.dato;
           end;
    end;
    if(min.tipo <> 'ZZZ') then begin
           //aux:= v[indiceMin];   1)
           v[indiceMin]:= v[indiceMin]^.sig;
           // dispose (aux);        2)        1) y 2) es para eliminar
         end;
    end;
    
    procedure agregarAtras(var l, ult:lista; g:gasto);
    var nue:lista;
    begin
        new(nue);
        nue^.dato:=g;
        nue^.sig:=nil;
        if(l=nil)then
            l:=nue
        else
            ult^.sig:=nue;
        ult:=nue;
    end;    
    
var actual,min:gasto;
    ult:lista;
Begin        // merge
    lNueva:= nil;
    minimo (v,min);  
    while (min.tipo <> 'ZZZ') do begin
        actual.tipo:= min.tipo; 
        actual.monto:= 0;
        while ((min.tipo <> 'ZZZ') and (min.tipo = actual.tipo) )do begin
         actual.monto:= actual.monto + min.monto;        
         minimo (v,min);   
      end;    
      agregarAtras(lNueva,ult,actual);   
   end;
End;

procedure armarArbol (var a: arbol; l: lista);
   procedure insertarEnArbol (var a: arbol; elem: gasto);
   begin
     if (a = nil) then begin
           new (a);
           a^.dato:= elem; a^.hi:= nil; a^.hd:= nil;
     end
     else
         if (elem.monto < a^.dato.monto)then
             insertarEnArbol (a^.hi, elem)
         else
             insertarEnArbol (a^.hd, elem);
   end;
          

begin // armarArbol
 a:= nil;
 while (l <> nil) do
 begin
   insertarEnArbol (a, l^.dato);
   l:= l^.sig;
 end;
end;

function menorTipoGasto (a: arbol): arbol;
begin
  if (a = nil) then
    menorTipoGasto:= nil
  else
    if (a^.hi <> nil) then
      menorTipoGasto:= menorTipoGasto (a^.hi)
    else
      menorTipoGasto:= a
end;

var v: vector;
    lNueva:lista;
    a, pMin: arbol;
    
Begin   // principal
 cargarGastos (v); 
 imprimir (v);
 merge(v,lNueva);
 writeln ('-----------------------');
 writeln ();
 writeln('Lista Merge');
 imprimirLista(lNueva);
 armarArbol (a, lnueva);
 writeln ();
 writeln ('-----------------------');
 writeln ();
 pMin:= menorTipoGasto (a);
 if (pMin <> nil)
 then writeln ('Tipo de gasto con menor consumo: ',  pMin^.dato.tipo)
 else writeln ('Arbol vacio');
 readln;
End.
