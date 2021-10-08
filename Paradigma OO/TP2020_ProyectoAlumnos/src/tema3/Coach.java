/*
 3- A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador se
caracteriza por su nombre, sueldo basico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por el
entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado
entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).*/

//Ejercicio 2A practica 2 - segunda parte
package tema3;

public class Coach {
    private String nombre;
    private double sueldo;
    private int campeonatos;

    public Coach(String nombre, double sueldo, int campeonatos) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.campeonatos = campeonatos;
    }

    public Coach() {
    }
    
    public String getNombre() {
        return nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    public double calcularSueldoACobrar() {
        if (campeonatos >= 1  && campeonatos <= 4){ return sueldo + 5000;}
            else if (campeonatos >= 5 && campeonatos <= 10) { return sueldo + 30000;}
                else if (campeonatos > 10) {return sueldo + 50000;}
        else {return sueldo;}
    }
}

