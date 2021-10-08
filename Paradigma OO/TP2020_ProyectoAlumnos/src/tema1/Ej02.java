// 2- Escriba un programa que imprima en consola el factorial de todos los números entre 1 y 9.
package tema1;

public class Ej02 {

    public static void main(String[] args) {
        
        int factorial;
        for (int i = 1; i <= 9; ++i) {
            factorial = 1;
            for (int j = i; j > 0; --j) {
                factorial = factorial * j;
            }
            System.out.println(i + "! = " + factorial);
        }
        
        /*¿Qué modificación debe hacer para imprimir el factorial de los 
        números impares solamente? */
        
        System.out.println("");
        for (int i = 1; i <= 9; ++i) {
            if(i % 2 == 0) {continue;}
            factorial = 1;
            for (int j = i; j > 0; --j) {
                factorial = factorial * j;
            }
            System.out.println(i + "! = " + factorial);
        }
    }
}
