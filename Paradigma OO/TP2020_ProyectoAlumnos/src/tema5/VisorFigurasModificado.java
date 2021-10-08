/*
6- Modificar la clase Visor Figuras: ahora debe permitir guardar las figuras a mostrar (a lo sumo 5)
y también mostrar todas las figuras guardadas en forma conjunta.
*/
package tema5;

public class VisorFigurasModificado {
    private int guardadas;
    private Figura[] vector;

    public VisorFigurasModificado() { 
        vector = new Figura[5];
    }

    public void guardar(Figura f) {     
        vector[guardadas] = f; 
        ++guardadas;
    }

    public boolean quedaEspacio() {
        boolean aux; 
        if(guardadas < vector.length);
            aux = true;
        return aux;
    }

    public void mostrar() {
        for (int i = 0; i < guardadas; ++i) {
            System.out.println(vector[i].toString());
        }
    }

    public int getGuardadas() {
        return guardadas;
    }
}
