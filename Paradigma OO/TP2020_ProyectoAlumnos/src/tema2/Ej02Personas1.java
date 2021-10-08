/*2- Utilizando la clase Persona (ya implementada). Realice un programa que almacene en 
un vector 15 personas. La información de cada persona debe leerse de teclado. Luego de 
almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.*/
package tema2;

import PaqueteLectura.Lector;

public class Ej02Personas1 {

    public static void main(String[] args) {
        Persona[] personas = new Persona[15];
        int i, dni, edad;
        String nom;
        Persona aux;
        aux = null;
        for (i = 0; i < personas.length; i++) {
            aux = new Persona();
            System.out.println("Ingrese un nombre");
            nom = Lector.leerString();
            aux.setNombre(nom);
            System.out.println("Ingrese el DNI");
            dni = Lector.leerInt();
            aux.setDNI(dni);
            System.out.println("Ingrese la edad");
            edad = Lector.leerInt();
            aux.setEdad(edad);
            personas[i] = aux;
        }
        int cant = 0, minimo = -2147483648;
        for (i = 0; i < personas.length; i++) {
            if (personas[i].getEdad() > 65) {
                cant = cant + 1;
            }
            if (personas[i].getDNI() < minimo) {
                minimo = personas[i].getDNI();
                aux = personas[i];
            }
        }
        System.out.println("La cantidad de personas mayores de 65 años es: " + cant);
        System.out.println("Representación de la persona con menor DNI:" + aux);

    }

}
