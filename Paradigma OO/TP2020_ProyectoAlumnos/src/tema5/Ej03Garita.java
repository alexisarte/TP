/*
B- Genere un programa que instancie una persona y un trabajador con datos leídos de
teclado y muestre la representación de cada uno en consola.
*/
package tema5;

import PaqueteLectura.Lector;
import tema2.Persona;

public class Ej03Garita {
    
    public static void main(String[] args) {
        
        Persona persona1 = new Persona();
        
        System.out.println("Ingrese el nombre de la persona");
        persona1.setNombre(Lector.leerString());
        System.out.println("Ingrese el DNI");
        persona1.setDNI(Lector.leerInt());
        System.out.println("Ingrese la edad");
        persona1.setEdad(Lector.leerInt());
        System.out.println("persona1 = " + persona1);
        System.out.println("");
        
        Trabajador trabajador1 = new Trabajador();
        System.out.println("Ingrese el nombre del trabajador");
        trabajador1.setNombre(Lector.leerString());
        System.out.println("Ingrese el DNI");
        trabajador1.setDNI(Lector.leerInt());
        System.out.println("Ingrese la edad");
        trabajador1.setEdad(Lector.leerInt());
        System.out.println("Tarea que realiza" );
        trabajador1.setTarea(Lector.leerString());
        System.out.println("");
        System.out.println("trabajador1 = " + trabajador1);
    }
    
}
