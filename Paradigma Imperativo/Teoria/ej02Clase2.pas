program ejercicio2;

procedure imprimirDigitos(num:integer);
begin
  if(num <> 0) then begin
    write(num mod 10,'  ');
    imprimirDigitos(num div 10);
  end;
end;

procedure imprimirDigitos2(num:integer);
begin
  if(num <> 0) then begin
    imprimirDigitos2(num div 10);
    write(num mod 10,'  ');
  end;
end;

var
  numero:integer;
begin
  write('Ingrese un numero o cero para teminar: ');
  read(numero);
  while(numero <> 0) do begin
    imprimirDigitos2(numero);
    writeln;
    writeln;
    write('Ingrese un numero: ');
    read(numero);
  end;
  readln;
end.
