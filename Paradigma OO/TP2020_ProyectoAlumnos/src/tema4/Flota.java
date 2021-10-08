/*
5-A- Definir una clase para representar flotas de micros. Una flota se caracteriza por
conocer a los micros que la componen (a lo sumo 15). Defina un constructor para crear
una flota vacía (sin micros).
Implemente métodos para:
i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
ii. agregar a la flota un micro recibido como parámetro.
iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y retornar si la operación fue exitosa.
iv. buscar en la flota un micro con patente igual a una recibida como parámetro y retornarlo (en caso de no existir dicho micro, retornar null).
v. buscar en la flota un micro con destino igual a uno recibido como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null)
*/
package tema4;

public class Flota {
    
    private Micro []flotilla;
    private int micros;

    public Flota() {
        flotilla = new Micro [15];
    }
    
    public boolean completa(){
        return micros == 15;
    }
    
    public void agregarMicro(Micro transporte){
        if(!completa()){
        flotilla[micros] = transporte;
        ++micros;
        }
    }
     
    public boolean eliminar(String patente){
        int i = 0;
        boolean exito = false;
        while((i < flotilla.length) && (exito == false)){
            if(flotilla[i].getPatente().equals(patente)){
                flotilla[i] = null;
                exito = true;
            }
            ++i;
        }
        return exito;
    }
    
    public String buscarPatente(String patente){
        int i = 0;
        String aux = null;
        boolean exito = false;
        while((i < flotilla.length) && (exito == false)){
            if(flotilla[i].getPatente().equals(patente)){
                exito = true;
                aux = flotilla[i].getPatente(); 
            }
            ++i;
        }
        return aux;
    }
    
    public String buscarDestino(String destino){
        int i = 0;
        String aux = null;
        boolean exito = false;
        while((i < flotilla.length) && (exito == false)){
            if(flotilla[i].getDestino().equals(destino)){
                exito = true;
                aux = flotilla[i].getDestino(); 
            }
            ++i;
        }
        return aux;
    }
}