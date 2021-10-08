/* 6- Se dispone de la clase Partido (ya implementada en la carpeta tema2). Un objeto 
partido representa un encuentro entre dos equipos (local y visitante). Un objeto partido 
puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre del 
equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese 
orden). Un objeto partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” pasado por parámetro (X)
setVisitante(X) modifica el nombre del equipo visitante al “String” pasado por parámetro (X)
setGolesLocal(X) modifica la cantidad de goles del equipo local “int” pasado por parámetro (X)
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante “int” pasado por parámetro (X)
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String 
vacío). 
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el 
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
- La cantidad de partidos que ganó River.
- El total de goles que realizó Boca jugando de local.
- El porcentaje de partidos finalizados con empate.*/
package tema2;

import PaqueteLectura.Lector;

public class Ej06Futbol {

    public static void main(String[] args) {
        Partido[] juegos = new Partido[20];
        int goles = 0, golesCasa = 0;
        String local = null;
        System.out.println("Nombre del equipo visitante");
        String visitante = Lector.leerString();
        if (!visitante.equals("ZZZ")) {
            System.out.println("Goles que realizo " + visitante);
            goles = Lector.leerInt();
            System.out.println("Nombre del quipo local");
            local = Lector.leerString();
            System.out.println("Goles que realizo " + local);
            golesCasa = Lector.leerInt();
        }
        int i = 0;
        int cntPartidos = 0;
        while (i < juegos.length && !visitante.equals("ZZZ")) {
            cntPartidos++;
            Partido juego = new Partido();
            juego.setVisitante(visitante);
            juego.setGolesVisitante(goles);
            juego.setLocal(local);
            juego.setGolesLocal(golesCasa);
            juegos[i] = juego;
            System.out.println("Nombre del equipo visitante");
            visitante = Lector.leerString();
            if (!visitante.equals("ZZZ")) {
                System.out.println("Goles que realizo " + visitante);
                goles = Lector.leerInt();
                System.out.println("Nomb    re del quipo local");
                local = Lector.leerString();
                System.out.println("Goles que realizo " + local);
                golesCasa = Lector.leerInt();
            }
            i++;
        }
        int victoriasRiver = 0;
        int gBoca = 0;
        int empate = 0;
        i = 0;
        while (juegos[i] != null && i < juegos.length) {
            if (juegos[i].hayGanador() && juegos[i].getGanador().equals("River")) {
                victoriasRiver++;
            } else if (juegos[i].hayEmpate()) {
                empate++;
            }
            if (juegos[i].getLocal().equals("Boca")) {
                gBoca = gBoca + juegos[i].getGolesLocal();
            }
            i++;
        }
        System.out.println("La cantidad de partidos que gano River es: " + victoriasRiver);
        System.out.println("El total de goles que realizó Boca jugando de local es: " + gBoca);
        System.out.println("El porcentaje de partidos finalizados con empate es: " + (100 * empate) / cntPartidos + "%");
    }
}
