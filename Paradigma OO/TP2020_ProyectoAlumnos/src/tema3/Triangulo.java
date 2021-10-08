/* 1- A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el tamaño de sus
3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro).*/

//Ejercicio 1-A practica 2 - segunda parte
package tema3;

public class Triangulo{

    private double a;
    private double b;
    private double c;
    private String relleno;
    private String contorno;
    

    public Triangulo(double a, double b, double c, String relleno, String contorno) {
        this.a = a;
        this.b = b;
        this.c = c;
        this.relleno = relleno;
        this.contorno = contorno;
    }

    public Triangulo() {
       
    }

    public double getA() {
        return a;
    }

    public void setA(double a) {
        this.a = a;
    }

    public double getB() {
        return b;
    }

    public void setB(double b) {
        this.b = b;
    }

    public double getC() {
        return c;
    }

    public void setC(double c) {
        this.c = c;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getContorno() {
        return contorno;
    }

    public void setContorno(String contorno) {
        this.contorno = contorno;
    }
    
    public double calcularArea() {
        double s = (a + b + c) / 2;
        double t = (s*((s - a)*(s - b)*(s - c)));
        return Math.sqrt(t);
    }
    public double calcularPerimetro() {
        double s = (a + b + c) / 2;
        return s;
    }
    
    
    public String toStriing() {
        return "Color de relleno: " + relleno + " | color de contorno: " + contorno ;
    }
}
