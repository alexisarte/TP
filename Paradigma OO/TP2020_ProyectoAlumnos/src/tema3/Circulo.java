/*
 4-A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio (double),
el color de relleno (String) y el color de línea (String). El círculo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
 */

//Ejercicio 6-A practica 2 - segunda parte
package tema3;

public class Circulo {

    private double radio;
    private String relleno;
    private String linea;
    
    public Circulo() {
        
    }   
    public Circulo(double radio, String relleno, String linea) {
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }

    public double getRadio() {
        return radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public String getLinea() {
        return linea;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

    public double calcularArea() {
        return Math.PI * radio * radio;
    }

    public double calcularPerimetro() {
        return 2 * Math.PI * radio;
    }
}
