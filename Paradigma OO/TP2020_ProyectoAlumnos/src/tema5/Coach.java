/*
▪ Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos ganados.

▪ Para los entrenadores: el sueldo a cobrar es el sueldo básico al cual se le adiciona un
plus por campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000
si ha ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10
campeonatos).
 */
package tema5;

public class Coach extends Empleado {

    private int campeonatos;

    public Coach(String nombre, double sueldo) {
        super(nombre, sueldo);
    }
    
    public Coach(int campeonatos, String nombre, double sueldo) {
        super(nombre, sueldo);
        this.campeonatos = campeonatos;
    }
    
    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    public double calcularSueldoACobrar() {
        if (campeonatos >= 1 && campeonatos <= 4) {
            return getSueldo() + 5000;
        } else if (campeonatos >= 5 && campeonatos <= 10) {
            return sueldo + 30000;
        } else if (campeonatos > 10) {
            return sueldo + 50000;
        } else {
            return sueldo;
        }
    }
    
    public String toString() {
        return  super.toString();
    }
    
    
}
