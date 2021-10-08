/*
 4-A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio (double),
el color de relleno (String) y el color de línea (String). El círculo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
 */

//Ejercicio 6-A practica 2 - segunda parte
package tema5;

public class Circulo extends Figura{

    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }
    
    public double calcularArea() {
        return Math.PI * radio * radio;
    }

    public double calcularPerimetro() {
        return 2 * Math.PI * radio;
    }
    
    public String toString() {
        String aux = super.toString() + "radio=" + radio + '}';
        return aux;
    }
    
    
}
