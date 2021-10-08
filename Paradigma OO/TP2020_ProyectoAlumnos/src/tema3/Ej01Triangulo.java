/*
B- Realizar un programa principal que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
*/
package tema3;

import PaqueteLectura.Lector;


public class Ej01Triangulo {

    
    public static void main(String[] args) {
        
        Triangulo figura = new Triangulo();
        System.out.println("Ingrese el lado A del triangulo");
        figura.setA(Lector.leerInt());
        System.out.println("Ingrese el lado B del triangulo");
        figura.setB(Lector.leerInt()); 
        System.out.println("Ingrese el lado C del triangulo");
        figura.setC(Lector.leerInt());
        System.out.println("Color de relleno");
        figura.setRelleno(Lector.leerString());
        System.out.println("Color de contorno");
        figura.setContorno(Lector.leerString());
        
        System.out.println("Perimetro: " + figura.calcularPerimetro());
        System.out.println("Area: " + figura.calcularArea());
        System.out.println(figura.toStriing());
        
        //Ejercicio 1-B practica 2 - segunda parte
        System.out.println("");
        System.out.println("Ingrese el lado A del triangulo #2");
        double lado1 = Lector.leerInt();
        System.out.println("Ingrese el lado B del triangulo #2");
        double lado2 = Lector.leerInt(); 
        System.out.println("Ingrese el lado C del triangulo #2");
        double lado3 = Lector.leerInt();
        System.out.println("Color de relleno");
        String relleno = Lector.leerString();
        System.out.println("Color de contorno");
        String contorno = Lector.leerString();
        
        
        Triangulo figura2 = new Triangulo(lado1, lado2, lado3, relleno, contorno);
        
        System.out.println("Perimetro: " + figura2.calcularPerimetro());
        System.out.println("Area: " + figura2.calcularArea());
        System.out.println(figura2.toStriing());
    }
    
}
