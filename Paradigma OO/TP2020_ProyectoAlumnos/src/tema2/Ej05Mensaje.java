/*
 5- Realice un programa que cargue un vector con 10 strings leídos desde teclado. El vector 
generado tiene un mensaje escondido que se forma a partir de la primera letra de cada 
string. Muestre el mensaje escondido en consola.
NOTA: La primera letra de un string se obtiene enviándole el mensaje charAt(0) al objeto 
string. Probar con: humo oso lejos ala menos usado nene de ocho ! Debería imprimir: 
holamundo!
 */
package tema2;

import PaqueteLectura.Lector;


public class Ej05Mensaje {

    
    public static void main(String[] args) {
        String []palabras = new String [10];
        for (int i = 0; i < 10; i++) {
            System.out.println("Ingrese una palabra");
            palabras[i] = Lector.leerString();
        }
        for (int i = 0; i < 10; i++) {
            System.out.print(palabras[i].charAt(0));
        }
    }
    
}
