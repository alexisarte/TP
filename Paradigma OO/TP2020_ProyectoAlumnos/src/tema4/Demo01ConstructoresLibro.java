/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package tema4;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Autor creador = new Autor();
        creador.setNombre("Herbert Schildt");
        creador.setBiografia("biografia");
        Libro libro1 = new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014, creador,"978-0071809252", 21.72);
        
        Autor creador2 = new Autor();
        creador2.setNombre("John Horton");
        creador2.setBiografia("biografia");
        Libro libro2 = new Libro("Learning Java by Building Android Games",  "CreateSpace Independent Publishing", creador2, "978-1512108347");
        System.out.println(libro1);
        System.out.println("");
        System.out.println(libro2);
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        //Libro libro3 = new Libro(); 
    }
    
}
