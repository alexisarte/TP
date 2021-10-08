/*
 B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro.
del primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro.
 */
package tema4;

import PaqueteLectura.Lector;

public class Ej04Viaje {
    
    public static void main(String[] args) {
        Micro transporte = new Micro("ABCD123", "Mar del Plata", 5.00);
        
        System.out.println("Ingrese un numero de asiento");
        int plaza = Lector.leerInt();
        
        while((!transporte.getLleno())  && (plaza != -1)) {
            if(transporte.validar(plaza) == true) {
                if(transporte.estado(plaza) == false) {
                    transporte.ocupar(plaza); 
                    System.out.println("EXITO en la reserva de su asiento");                
                }
                else {
                    System.out.println("Asiento ocupado" + ",el primer asiento libre es: " + transporte.libre());
                }    
            }
            else {
                System.out.println("El asiento " + plaza + " esta fuera de rango(1-20)");
            }
            System.out.println("Ingrese un numero de asiento");
            plaza = Lector.leerInt();
        }
        System.out.println("La cantidad de asientos ocupados es: " + transporte.getOcupados() );
    }
}
