{2. Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada  película se conoce: código de película, 
código de género (1: acción, 2: aventura, 3: drama,  4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio 
otorgado  por las críticas. Implementar un programa modularizado que:
 
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código  de género, en una estructura de datos adecuada. 
La lectura finaliza cuando se lee el  código de película -1.  

b. Una vez almacenada la información, genere un vector que guarde, para cada género,  el código de película con mayor puntaje obtenido 
entre todas las críticas. 

c. Ordene los elementos del vector generado en b) por puntaje. 

d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el  código de película con menor puntaje.}

program	cine;
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
	v_maximos = array[rango_genero] of pelicula;


procedure agregarAtras (var l,ult:lista; p:pelicula);
var
	nue: lista;
  begin
    new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	if(l = nil)then
		l:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
  end;

// Vector de listas
procedure cargarListas (var v:v_peliculas);

  procedure inicializarVector(var v:v_peliculas);
  var
    i:rango_genero;
  begin
	  for i:= 1 to MAX do
		v[i]:= nil;
  end;

  procedure leerPelicula (var p:pelicula);
  begin
    p.codigo:= random(5)-1;
	if (p.codigo <> 0)then begin
        p.genero:= random(8)+1;
        p.puntaje:= random(10) + random();
	end;
  end;

var
	ult:v_peliculas;
    p: pelicula;
begin
    randomize;
    inicializarVector(v);
    leerPelicula(p);
	while(p.codigo <> -1) do begin
		agregarAtras (v[p.genero],ult[p.genero],p);
        leerPelicula(p);
	end;
end;

procedure imprimir(l: lista);
begin
    if (l <> nil) then  begin
        writeln('codigo: ', l^.dato.codigo);
        writeln('genero: ', l^.dato.genero);
        writeln('puntaje: ', l^.dato.puntaje:2:2);
        writeln('------------------------------');
        imprimir (l^.sig);
    end;
end;

procedure cargarVector(v:v_peliculas; var m:v_maximos);
var
	i:rango_genero;
	maximo:pelicula;
begin
	for i:= 1 to MAX do begin
        maximo.puntaje:= 0;
		while(v[i] <> nil) do begin
			if(v[i]^.dato.puntaje > maximo.puntaje)then
              m[i]:= v[i]^.dato;
            v[i]:= v[i]^.sig;
	    end;
    end;
end;

procedure ordenarVector (var m:v_maximos);
var
	i:rango_genero;
	act: pelicula;
	j: integer;
begin	
	for i:= 2 to MAX do begin
		act:= m[i];
		j:= i-1;
		while (j > 0) and (m[j].puntaje > act.puntaje) do begin
			m[j+1] := m[j];
			j:= j-1;
		end;
		m[j+1]:= act;
	end;
end;

procedure imprimirListas (var v:v_peliculas);
var 
    i: rango_genero;
begin
    for i:= 1 to MAX do begin
        writeln ('Lista ', i);       
        imprimir ( v[i]);
        Writeln; 
    end;
end;

procedure mostrarVector(m:v_maximos);
var
  i:rango_genero;
begin
  for i:= 1 to MAX do
    writeln('posicion ',i,' codigo: ',m[i].codigo);
end;

var
  v:v_peliculas;
  m:v_maximos;
begin
  cargarListas(v);
  imprimirListas(v);
  cargarVector(v,m);
  writeln('vetorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
  ordenarVector(m);
  mostrarVector(m);
  readln;
end.
