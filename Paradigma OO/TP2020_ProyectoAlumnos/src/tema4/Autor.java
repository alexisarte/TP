/*
 Implemente la clase Autor, considerando que éstos
se caracterizan por nombre y biografía. El autor debe poder devolver/modificar el valor de
sus atributos.
 */
package tema4;


public class Autor {
    
    private String nombre;
    private String biografia;


    public Autor() {
    }
    
    public Autor(String nombre, String biografia) {
        this.nombre = nombre;
        this.biografia = biografia;
    }

    public String getNombre() {
        return nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }
    
}
