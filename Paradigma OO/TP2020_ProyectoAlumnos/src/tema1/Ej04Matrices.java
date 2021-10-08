
package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej04Matrices {

    public static void main(String[] args) {

        //1. definir la matriz de enteros de tamaño 10x10 e iniciarla con números aleatorios entre 0 y 200 
        int[][] enteros = new int[10][10];
        GeneradorAleatorio.iniciar();
        int a, fila, col, fil = -1, columna = 0;

        for (fila = 0; fila < enteros.length; fila++) {
            for (col = 0; col < enteros[fila].length; col++) {
                enteros[fila][col] = GeneradorAleatorio.generarInt(200);
                System.out.println("enteros " + fila + "-" + col + ": " + enteros[fila][col]);
            }
        }
        //2. mostrar el contenido de la matriz en consola
        for (fila = 0; fila < enteros.length; fila++) {
            for (col = 0; col < enteros[fila].length; col++) {
                System.out.println("enteros " + fila + "-" + col + ": " + enteros[fila][col]);
            }
        }
        //3. calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
        int suma = 0;
        for (fila = 2; fila < enteros.length; fila++) {
            for (col = 0; col < 4; col++) {
                suma = suma + enteros[fila][col];
            }
        }
        System.out.println("suma = " + suma);

        //4. generar un vector de 10 posiciones donde cada posición i contiene la suma de la columna i de la matriz 
        int[] array = new int[10];
        int sum = 0;
        for (col = 0; col < 10; col++) {
            for (fila = 0; fila < 10; fila++) {
                sum = sum + enteros[fila][col];
            }
            array[col] = sum;
            System.out.println("la suma de la columna " + col + " es: " + array[col]);
        }
        //5. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna) 
        //y en caso contrario imprima “No se encontro el elemento”.
//        for (fila = 0; fila < enteros.length; fila++) {
//            for (col = 0; col < enteros[fila].length; col++) {
//                if (enteros[fila][col] == a) {
//                    fil = fila;
//                    columna = col;
//                }
//            }
//        }
        System.out.println("Ingrese un numero a buscar");
        a = Lector.leerInt();
        fil = 0;
        col = 0;
        boolean boo = false;
        while(fil < 10 &&  boo ) {
            while(enteros[fil][col] != a  && col < 10 && boo) {
                if(enteros[fil][col] == a) {
                    boo = true;
                }
                col++;
            }
            fil++;
        }
        --col;
        if (enteros[fil][col] != a) {
            System.out.println("No se encontró el elemento");
        } else {
            System.out.println("Elemento encontrado en la FILA " + fil + " COLUMNA " + col);
        }
    }

}
