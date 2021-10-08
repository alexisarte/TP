/*
 2- Queremos representar la información de empleados de un club: jugadores y
entrenadores.
▪ Cualquier empleado se caracteriza por su nombre y sueldo básico.

A- Implemente la jerarquía de clases, con los atributos de cada clase y métodos para
obtener/modificar el valor de los mismos.

B- Implemente constructores para los jugadores y entrenadores, que reciban toda la
información necesaria para inicializar el objeto en cuestión.

C- Cualquier empleado (jugador / entrenador) debe saber responder al mensaje
calcularSueldoACobrar (que calcula y devuelve el sueldo a cobrar) pero de manera
diferente:

D- Cualquier empleado debe responder al mensaje toString, que devuelve un String que lo
representa. La representación de cualquier empleado está compuesta por su nombre y
sueldo a cobrar.

NOTA: Tomar como base la clase Entrenador definida en la Actividad 3
 */
package tema5;

public abstract class Empleado {
    
    private String nombre;
    double sueldo;

    public Empleado(String nombre, double sueldo) {
        this.nombre = nombre;
        this.sueldo = sueldo;
    }
    
    public String toString() {
        String aux = "Empleado{nombre=" + nombre + ", sueldo= " + sueldo + ", Sueldo a cobrar: " + this.calcularSueldoACobrar() + '}';
        return aux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    
    public abstract double calcularSueldoACobrar();
}
