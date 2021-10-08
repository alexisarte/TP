/* 5- Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice 
un programa que permita informar la cantidad de personas que concurrieron a 
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la 
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual 
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al 
finalizar la llegada de personas, informe lo pedido.*/
package tema1;
import PaqueteLectura.Lector;
public class Ej05Matrices {

    public static void main(String[] args) {
        int i, j, piso, oficina;
        int[][] sectores = new int[8][4];
        
        for (i = 0; i < 8; i++) {
            for (j = 0; j < 4; j++) {
                sectores[i][j] = 0;
            }
        }
        System.out.println("Ingrese nro. de piso a la cual quiere concurrir entre 0-8");
        piso = Lector.leerInt();
        System.out.println("Ingrese nro. de oficina a la cual quiere concurrir 0-3");
        oficina = Lector.leerInt();
        while (piso != 9) {
            sectores[piso][oficina] = sectores[piso][oficina]+1;
            System.out.println("Ingrese nro. de piso a la cual quiere concurrir 0-8");
            piso = Lector.leerInt();
            System.out.println("Ingrese nro. de oficina a la cual quiere concurrir entre 0-3");
            oficina = Lector.leerInt();
        }
        for (i = 0; i < 8; i++) {
            for (j = 0; j < 4; j++) {
                System.out.println("sectores " + i + "-" + j + ": " + sectores[i][j]);
            }
        }
    }
}
