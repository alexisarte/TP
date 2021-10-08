{7. Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba  el equivalente en binario de un número decimal.
El programa termina cuando el usuario  ingresa el número 0 (cero).
  
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es  menor a 2. 
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos  el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, 
el programa  debe mostrar: 10111. }

program convirtiendo;

procedure DECtoBIN(num:integer);
begin
  if(num >= 2) then begin
    DECtoBIN(num div 2);
    write(num mod 2);
  end
  else
    write(num);
end;


procedure conversion;
var 
  numero:integer;
begin
  write('Ingrese un numero: ');
  read(numero);
  while(numero <> 0) do begin
    writeln('numero convertido a BINARIO');
    DECtoBIN(numero);
    writeln;
    write('Ingrese un numero: ');
    read(numero);
  end;
end;

begin
conversion();
end.

