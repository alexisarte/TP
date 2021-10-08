/* 1- Escriba un programa que imprima en consola el factorial de un número N 
(ingresado por teclado, N > 0). Ejemplo: para N=5 debería imprimir 5! = 120 */
package tema1;

import PaqueteLectura.Lector;

public class Ej01Factorial {

    public static void main(String[] args) {

        int factorial = 1;

        System.out.println("Ingrese un numero");
        int number = Lector.leerInt();

        for (int i = number; i > 0; i--) {
            factorial = factorial * i;
        }
        System.out.println(number + "! = " + factorial);
    }
}
