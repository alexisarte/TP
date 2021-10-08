{11. Un cine posee la lista de peliculas que proyectar¡ durante el mes de octubre. De cada  pelicula se conoce: codigo de pelicula,
codigo de genero (1: accion, 2: aventura, 3: drama,  4: suspenso, 5: comedia, 6: belica, 7: documental y 8: terror)
y puntaje promedio otorgado  por las criticas.

Implementar un programa que contenga: 

a. Un modulo que lea los datos de peliculas y los almacene ordenados por codigo de  pelicula y agrupados por codigo de genero,
en una estructura de datos adecuada. La  lectura finaliza cuando se lee el codigo de pelicula -1.

b. Un modulo que reciba la estructura generada en el punto a y retorne una estructura  de datos donde estan todas las peliculas almacenadas
ordenadas por codigo de pelicula.}

program cine3;
const
	MAX = 8;
type
	rango_genero = 1..MAX;

    pelicula = record
		codigo:integer;
		genero: rango_genero;
		puntaje: real;
	end;
	
	lista= ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	v_peliculas = array [rango_genero] of lista;

procedure agregarOrdenado (var l:lista; p:pelicula);
var
	nue, ant, act: lista;
begin
    new(nue);
	nue^.dato:= p;
	act:= l;
	ant:= l;
	while(act <> nil) and (p.codigo > act^.dato.codigo) do begin
	    ant:= act;
	    act:= act^.sig;
    end;
	if(act = ant)then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

// se dispone de la lista
procedure cargarL(var l:lista);

  procedure leerPelicula (var p:pelicula);
  begin
    p.codigo:= random(10)-1;
	if (p.codigo <> 0)then begin
        p.genero:= random(8)+1;
        p.puntaje:= random(10) + random();
	end;
  end;

var
    p:pelicula;
begin
    randomize;
    leerPelicula(p);
    while(p.codigo <> 0) do begin
        agregarOrdenado (l,p);
        leerPelicula(p);
    end;
end;
// Fin de la lista

procedure imprimirL(l: lista);
begin
    if (l <> nil) then  begin
        writeln('codigo: ', l^.dato.codigo);
        writeln('genero: ', l^.dato.genero);
        writeln('puntaje: ', l^.dato.puntaje:2:2);
        writeln('------------------------------');
        imprimirL (l^.sig);
    end;
end;

procedure cargarListas (l:lista ; var v:v_peliculas);

  procedure inicializarVector(var v:v_peliculas);
  var
	i:rango_genero;
  begin
	for i:= 1 to MAX do
		v[i]:= nil;
  end;

begin
	while(l <> nil) and (l^.dato.codigo <> -1) do begin
		agregarOrdenado (v[l^.dato.genero],l^.dato);
        l:= l^.sig;
	end;
end;

procedure imprimirListas(var v:v_peliculas);
var 
    i: integer;
begin
    for i:=1 to MAX do begin
        writeln('Lista ', i);
        imprimirL(v[i]);
        Writeln; 
    end;
end;

procedure merge(v:v_peliculas; var nueva:lista);

  procedure minimo(var v:v_peliculas; var minion:pelicula);
  var
    i,indice:rango_genero;
  begin
    minion.codigo:= 32767;
    for i:= 1 to MAX do begin
      if(v[i] <> nil) then
        if(v[i]^.dato.codigo < minion.codigo) then begin
          indice:= i;
          minion:= v[i]^.dato;
        end;
    end;
    if(minion.codigo < 32767) then
      v[indice]:= v[indice]^.sig
  end;

var
  minion: pelicula;
begin
  nueva:= nil;
  minimo(v,minion);
  while(minion.codigo < 32767) do begin
    agregarOrdenado(nueva,minion);
    minimo(v,minion);
  end;
end;


var
    l, nueva:lista;
    v:v_peliculas;
begin
    l:= nil;
    cargarL(l);  // se dispone
    imprimirL(l);
    cargarListas(l,V);
    imprimirListas(v);
    merge(v,nueva);
    writeln('MERGE');
    imprimirL(nueva);
    readln;
end.







