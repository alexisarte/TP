/*
 B - Genere un programa principal que cree una balanza e inicie una compra. Lea información desde
teclado correspondiente a los ítems comprados (peso en kg y precio por kg) hasta que se ingresa
uno con peso 0. Registre cada producto en la balanza. Al finalizar, informe el resumen de la compra
 */

//Ejercicio 5-A practica 2 - primera parte
package tema3;

import PaqueteLectura.Lector;

public class Ej02Compra {

    public static void main(String[] args) {
        Balanza compra = new Balanza();
        compra.iniciarCompra();

        System.out.print("Ingrese el peso del producto: ");
        double peso = Lector.leerInt();

        while (peso != 0) {
            System.out.print("Ingrese el precio del producto: ");
            double precio = Lector.leerDouble();
            System.out.println("Nombre del producto");
            String name = Lector.leerString();

            Producto product = new Producto();
            product.setDescripcion(name);
            product.setPesoEnKg(peso);
            compra.registrarProducto(product, precio);
            System.out.println("Ingrese el peso del producto: ");
            peso = Lector.leerDouble();
        }
        System.out.println(compra.devolverResumenDeCompra());
    }

}
