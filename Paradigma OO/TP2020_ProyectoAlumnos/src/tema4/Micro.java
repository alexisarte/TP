/*
 4-A- Definir una clase para representar micros. Un micro conoce su patente, destino, hora
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos
ocupados al momento. Lea detenidamente a) y b) y luego implemente.
a) Implemente un constructor que permita iniciar el micro con una patente, un destino y
una hora de salida (recibidas por parámetro) y sin pasajeros.
b) Implemente métodos para:
i. devolver/modificar patente, destino y hora de salida
ii. devolver la cantidad de asientos ocupados
iii. devolver si el micro está lleno
iv. validar un número de asiento recibido como parámetro (es decir, devolver si está
en rango o no)
v. devolver el estado de un nro. de asiento válido recibido como parámetro
vi. ocupar un nro. de asiento válido recibido como parámetro
vii. liberar un nro. de asiento válido recibido como parámetro
viii. devolver el nro. del primer asiento libre
 */
package tema4;

public class Micro {
    private String patente;
    private String destino;
    private double salida;
    private boolean [] asientos = new boolean[20];
    private int ocupados;

    public Micro(String patente, String destino, double salida) {
        this.patente = patente;
        this.destino = destino;
        this.salida = salida;
    }

    public String getPatente() {
        return patente;
    }

    public String getDestino() {
        return destino;
    }

    public double getSalida() {
        return salida;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setSalida(double salida) {
        this.salida = salida;
    }
    
    public int getOcupados() {
        return ocupados;
    }
    
    public boolean getLleno() {
        return ocupados == 20;
    }
    
    public boolean validar(int asiento) {
        return asiento >=1 &&  asiento <= 20;
    } 
    
    public boolean estado(int asiento) {
        return asientos[--asiento] == true;
    }
    
    public void ocupar(int asiento) {
        asientos[--asiento] = true;
        ++ocupados;
    }
    
    public void liberar(int asiento) {
        asientos[--asiento] = false;
        --ocupados;
    }
    
    public int libre() {
        int i = 0;
        boolean exito = false;
        while((exito == false)  &&  (i < 20)) {  
            if(asientos[i] == false) {
                exito = true;
                return ++i;
            }
            ++i;
        }
        return -1;
    }
        
}
