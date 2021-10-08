{1. El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de  las expensas de dichas oficinas.  
Implementar un programa modularizado que: 

a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada  oficina se ingresa el código de identificación, 
DNI del propietario y valor de la expensa. La  lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. 

b. Ordene el vector, aplicando el método de inserción, por código de identificación de la  oficina.}

program ejer1;
uses crt;
const
  dimF = 300;
type
  indice = 0..dimF;
  rango = 1..dimF;

  office = record
    codigo: integer;
    DNI: integer;
    valor: real;
  end;
  
  v_oficinas = array[rango] of office;

procedure leerOffice(var off:office);
begin
    off.codigo:= random(20)-1;
    if(off.codigo <> -1) then begin
      off.DNI:= random(29);
      off.valor:= random(29) + random();
    end;
end; 
  
procedure cargarVector(var v:v_oficinas; var dimL:indice);
var
  Off:office;
begin
  randomize;
  leerOffice(off);
  while(dimL < dimF) and (off.codigo <> -1)do begin
    dimL:= dimL + 1;
    v[dimL]:= off;
    leerOffice(off);
  end;
end;

procedure informarVector(v:v_oficinas; dimL:indice);
var 
  i:rango;
begin
  for i:= 1 to dimL do begin
    Writeln('participante numero: ',i);
    writeln('codigo: ',v[i].codigo);
    writeln('DNI: ',v[i].DNI);
    writeln('valor: ',v[i].valor:2:2);
    writeln('-------------------------------------------------');
  end;
end;

procedure vectorOrdenado(var v:v_oficinas; dimL:indice);
var
  i, j:indice;
  actual:office;
begin
  for i:= 2 to dimL do begin
    actual:= v[i];
    j:= i-1;
    while(j > 0) and (v[j].codigo > actual.codigo) do begin
      v[j+1]:= v[j];
      j:= j-1;
    end;
    v[j+1]:= actual;
  end;
end;

var
  v:v_oficinas;
  dimL:indice; 
begin
  dimL:= 0;
  cargarVector(v,dimL);
  informarVector(v,dimL);
  writeln('PRESIONE ENTER PARA ORDENAR EL VECTOR');
  readln();
  vectorOrdenado(v,dimL );
  informarVector(v,dimL);
  readln;
end. 
