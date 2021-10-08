/*
NOTA: Trabajar sobre la carpeta “tema5” del proyecto
1 – A- Agregar la clase Triángulo a la jerarquía de clases vista en el tema 5 (paquete tema5
del proyecto). Triángulo debe heredar de Figura todo lo que es común y definir su
constructor y sus atributos y métodos propios. Además debe redefinir el método toString.
 */
package tema5;

public class Triangulo extends Figura{
    
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangulo(String unCR, String unCL) {
        super(unCR, unCL);
    }

    
    public Triangulo(double lado1, double lado2, double lado3, String unCR, String unCL) {
        super(unCR, unCL);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    
    
    public double calcularArea() {
        double s = (getLado1() + getLado2() + getLado3()) / 2;
        double t = (s*((s - getLado1())*(s - getLado2())*(s - getLado3())));
        return Math.sqrt(t);
    }
    
    public double calcularPerimetro() {
        return (lado1 + lado2 + lado3) / 2;
    }
    
    public String toString(){
        String aux = super.toString() +
                "{lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + '}';
        return aux;
    }
}
