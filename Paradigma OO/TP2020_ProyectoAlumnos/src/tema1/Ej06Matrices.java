/*6- Escriba un programa que simule el ingreso de personas a un banco. Cada 
persona que ingresa indica la operacion que desea realizar (0: “cobro de cheque” 1: 
“deposito/extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de 
jubilacion” 4: “cobro de planes”). La recepción de personas culmina cuando un 
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de 
personas atendidas por cada operación y la operación más solicitada. */
package tema1;

import PaqueteLectura.Lector;

public class Ej06Matrices {

    public static void main(String[] args) {
        int operaciones[] = new int[5];
        for (int i = 0; i < 5; i++) {
            operaciones[i] = 0;
        }
        int opera = 0;
        System.out.println("ingrese el numero de operacion que desea realizar(0-4)");
        opera = Lector.leerInt();
        while (opera < 5) {
            operaciones[opera] = operaciones[opera] + 1;
            System.out.println("ingrese el numero de operacion que desea realizar(0-4)");
            opera = Lector.leerInt();
        }
        for (int i = 0; i < 5; i++) {
            System.out.println("operacion " + i + " personas atendidas: " + operaciones[i]);
        }
    }

}
