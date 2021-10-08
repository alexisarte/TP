/*
B- Escriba un programa que instancie un triángulo y un cuadrado, con información leída
desde teclado. Luego muestre en consola el área y perímetro de cada uno y su
representación en String.
 */
package tema5;

import PaqueteLectura.Lector;

public class Ej01TrianguloCuadrado {

    public static void main(String[] args) {
        String color = null;

        System.out.println("Ingrese el color de Relleno");
        color = Lector.leerString();

        Triangulo triangulo1 = new Triangulo(color, "blanco");
        System.out.println("Ingrese el lado A del triangulo");
        triangulo1.setLado1(Lector.leerDouble());
        System.out.println("Ingrese el lado B del triangulo");
        triangulo1.setLado2(Lector.leerDouble());
        System.out.println("Ingrese el lado C del triangulo");
        triangulo1.setLado3(Lector.leerDouble());
        System.out.println("triangulo1 = " + triangulo1.toString());
        Cuadrado cuadrado1 = new Cuadrado("negro", "blanco");

        System.out.println("Ingrese el lado del cuadrado");
        cuadrado1.setLado(Lector.leerDouble());
        System.out.println("cuadrado1 = " + cuadrado1);

//        Circulo circle = new Circulo(3.2, "azul", "violeta");
//        System.out.println("circle = " + circle);
    }

}
