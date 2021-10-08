/*
 ▪ Los jugadores son empleados que se caracterizan por el número de partidos jugados y
el número de goles anotados.

▪ Para los jugadores: el sueldo a cobrar es el sueldo básico y si el promedio de goles por
partido es superior a 0,5 se adiciona un plus de otro sueldo básico.
 */
package tema5;

public class Jugador extends Empleado{
    
    private int partidos;
    private int goles;

    public Jugador(String nombre, double sueldo) {
        super(nombre, sueldo);
    }
    
    
    public Jugador(int partidos, int goles, String nombre, double sueldo) {
        super(nombre, sueldo);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    public double calcularSueldoACobrar (){
        if(goles /partidos > 0.5){
            sueldo = sueldo + sueldo;
        } 
        return sueldo;
    }

    @Override
    public String toString() {
        return  super.toString();
    }
    
    
}
