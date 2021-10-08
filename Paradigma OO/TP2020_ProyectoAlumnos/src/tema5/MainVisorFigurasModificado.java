/*
Luego realice un programa que instancie un visor, guarde dos cuadrados y un rectángulo en el visor 
y por último haga que el visor muestre sus figuras. 
*/
package tema5;

public class MainVisorFigurasModificado {
    
    public static void main(String[] args) {
        VisorFigurasModificado visor = new VisorFigurasModificado();
        
        if(visor.quedaEspacio()){
            Cuadrado c1 = new Cuadrado(10, "Violeta", "Rosa");
            visor.guardar(c1);
        }
        
        if(visor.quedaEspacio()){
            Rectangulo r = new Rectangulo(20, 10, "Azul", "Celeste");
            visor.guardar(r);
        }
        
        if(visor.quedaEspacio()){
            Cuadrado c2 = new Cuadrado(30, "Rojo", "Naranja");
            visor.guardar(c2);
        }
        
        visor.mostrar();
        System.out.println(visor.getGuardadas());
    }
    
}
