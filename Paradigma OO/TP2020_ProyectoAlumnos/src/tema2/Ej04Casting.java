/*4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así 
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
40 cupos de casting.
Una vez finalizada la inscripción: 
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.*/
package tema2;

import PaqueteLectura.Lector;

public class Ej04Casting {

    public static void main(String[] args) {
        Persona[][] inscripciones = new Persona[5][8];
        int dia = 0, turno, dni, edad;
        String name;
        System.out.println("Ingrese un nombre");
        name = Lector.leerString();
        System.out.println("Ingrrese el DNI");
        dni = Lector.leerInt();
        System.out.println("Ingrese la edad");
        edad = Lector.leerInt();
        while (dia < inscripciones.length && !name.equals("ZZZ")) {
            turno = 0;
            while (turno < inscripciones[dia].length && !name.equals("ZZZ")  ) {
                Persona people = new Persona();
                people.setNombre(name);
                people.setDNI(dni);
                people.setEdad(edad);
                inscripciones[dia][turno] = people;
                System.out.println("Ingrese un nombre");
                name = Lector.leerString();
                System.out.println("Ingrrese el DNI");
                dni = Lector.leerInt();
                System.out.println("Ingrese la edad");
                edad = Lector.leerInt();
                turno++;
            }
            dia++;
        }
        dia = 0;
        turno = 0;
        while (inscripciones[dia][turno] != null & dia < inscripciones.length) {
            while (inscripciones[dia][turno] != null && turno < inscripciones[dia].length) {
                System.out.println("Dia: " + dia + " turno:" + turno);
                System.out.println("Persona a entrevistar: " + inscripciones[dia][turno].getNombre());
                System.out.println("-------------------------------------------------------");
                turno++;
            }
            dia++;
            turno = 0;
        }
    }

}
