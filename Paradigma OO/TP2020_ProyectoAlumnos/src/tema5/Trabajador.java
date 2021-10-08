/*
 3- A- Modele e implemente las clases para el siguiente problema. Una garita de seguridad
quiere identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio
pueden entrar personas, que se caracterizan por su nombre, DNI y edad. Además pueden
entrar trabajadores, estos son personas que se caracterizan además por la tarea que
realizan en el predio.
Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString(). A continuación se
ejemplifica la representación a retornar por cada uno:
- Personas: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
- Trabajadores: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy Corta
césped.”
 */
package tema5;

import tema2.Persona;

public class Trabajador extends Persona {

    private String tarea;

    public Trabajador() {
    }

    public Trabajador(String unNombre, int unDNI, int unaEdad, String tarea) {
        super(unNombre, unDNI, unaEdad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        return super.toString() + " Soy " + tarea;
    }
}
