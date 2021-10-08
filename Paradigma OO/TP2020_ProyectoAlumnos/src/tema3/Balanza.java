/* 2- A – Definir una clase para representar balanzas comerciales (para ser utilizadas en verdulerías,
carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad de items
correspondientes a la compra actual (es decir, no almacena los ítems de la compra). La balanza
debe responder a los siguientes mensajes:
▪ iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual.
▪ registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado y su precio
por kg, debiendo realizar las actualizaciones en el estado de la balanza.
▪ devolverMontoAPagar(): retorna el monto de la compra actual.
▪ devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X por la
compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la compra. */

//Ejercicio 5A practica 2 - primera parte
package tema3;

public class Balanza {

    private int items;
    private double monto;
    private String resumen;
    public void iniciarCompra() {
        items = 0;
        monto = 0;
        resumen = "";
    }

    public void registrarProducto(Producto product, double precioPorKg) {
        ++items;
        monto += product.getPesoEnKg();
        resumen += product.getDescripcion() + " " + precioPorKg + " pesos - "; 
    }

    public double devolverMontoAPagar() {
        return monto;
    }

    public String devolverResumenDeCompra() {
        return  resumen + " total a pagar: " + monto + " pesos Por la compra de " + items + " productos"; 
    }
}
