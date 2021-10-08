/*
B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos desde
teclado. Pruebe el correcto funcionamiento de cada método implementado
*/
package tema3;

import PaqueteLectura.Lector;

public class Ej03Coach {
    
    public static void main(String[] args) {
        
        Coach entrenador = new Coach();
        
        System.out.println("Ingrese el nombre del COACH");
        entrenador.setNombre(Lector.leerString());
        System.out.println("Sueldo basico");
        entrenador.setSueldo(Lector.leerDouble());
        System.out.println("Cantidad de campeonatos ganados");  
        entrenador.setCampeonatos(Lector.leerInt());
        
        System.out.println("Sueldo a cobrar por el entrenador: " + entrenador.calcularSueldoACobrar());
        
        
        // Ejercicio 2-B practica 2 - segunda parte
        System.out.println("");
        System.out.println("Ingrese el nombre del COACH #2");
        String name = Lector.leerString();
        System.out.println("Sueldo basico");
        double sueldo = Lector.leerDouble();
        System.out.println("Cantidad de campeonatos ganados");  
        int campeonatos = Lector.leerInt();
        
        Coach entrenador2 = new Coach(name, sueldo, campeonatos);
        
        System.out.println("Sueldo a cobrar por el entrenador = " + entrenador2.calcularSueldoACobrar());
        
    }
    
}
