package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Jugadores {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        //Paso 2: Declarar la variable vector de double 
        double[] vector;

        //Paso 3: Crear el vector para 15 double 
        vector = new double[15];
        
        //Paso 4: Declarar indice 
        double total = 0, promedio;
        int i;

        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 1; i < 15; i++) {
            vector[i] = GeneradorAleatorio.generarDouble(10);
            total = total + vector[i];
            System.out.println("Jugador " + i + " altura: " + vector[i]);
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = total / 15;
        System.out.println("la altura promedio es: " + promedio);

        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cantidad = 0;
        for (i = 1; i < 15; i++) {
            if (vector[i] > promedio) {
                cantidad = cantidad + 1;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("la cantidad de jugadores con altura por encima del promedio es: " + cantidad);
    }

}
