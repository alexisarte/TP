/*
 E- Escriba un programa principal que instancie un jugador y un entrenador con datos
leídos desde teclado. Pruebe el correcto funcionamiento de cada método implementado.
 */
package tema5; 

import PaqueteLectura.Lector;

public class Ej02Empleados {
    
    public static void main(String[] args) {
        
        Jugador player = new Jugador("Lionel Messi", 100);
        
        System.out.println("Ingrese la cantidad de partidos disputados por " + player.getNombre());
        player.setPartidos(Lector.leerInt());
        System.out.println("Ingrese la cantidad de goles que anotooo " + player.getNombre());
        player.setGoles(Lector.leerInt());
        System.out.println("");
        System.out.println("player = " + player);
        
        
        Coach entrenador = new Coach("ZIDANE", 87);
        
        System.out.println("");
        System.out.println("Ingrese la cantidad de campeonatos que ganooo " + entrenador.getNombre());
        entrenador.setCampeonatos(Lector.leerInt());
        System.out.println("");
        System.out.println("entrenador = " + entrenador);
    }    
}
