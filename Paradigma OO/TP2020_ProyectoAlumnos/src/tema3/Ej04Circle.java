/*
 B- Realizar un programa principal que instancie un círculo, le cargue información leída de teclado
e informe en consola el perímetro y el area.
 */

//Ejercicio 6-B practica 2 - segunda parte
package tema3;

import PaqueteLectura.Lector;


public class Ej04Circle {
    
    public static void main(String[] args) {
        
        Circulo redondo = new Circulo();
        System.out.println("Radio del circulo");
        redondo.setRadio(Lector.leerDouble());
        System.out.println("Color de relleno del circulo");
        redondo.setRelleno(Lector.leerString());
        System.out.println("Color de contorno del circulo");
        redondo.setLinea(Lector.leerString());
        
        System.out.println("Perimetro: " + redondo.calcularPerimetro());
        System.out.println("Area: " + redondo.calcularArea());
        
        
        System.out.println("");
        System.out.println("Radio del circulo #2");
        double radio = Lector.leerDouble();
        System.out.println("Color de relleno del circulo");
        String relleno = Lector.leerString();
        System.out.println("Color de contorno del circulo");
        String contorno = Lector.leerString();
                
        Circulo figura1 = new Circulo(radio, relleno, contorno);
        System.out.println("Perimetro: " + figura1.calcularPerimetro());
        System.out.println("Area: " + figura1.calcularArea());
    }
    
}
