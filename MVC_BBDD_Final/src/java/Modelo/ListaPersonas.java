/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.LinkedList;

/**
 *
 * @author jonathan
 */
public class ListaPersonas extends LinkedList {

    private LinkedList listaPersonas;

    public ListaPersonas() {
        this.listaPersonas = new LinkedList<Persona>();
    }

    //buscar por nombre
    public Persona loggear(String email, String contra) {
        Persona p = null;
        boolean salir = false;
        for (int i = 0; i < this.size() && !salir; i++) {
            Persona aux = (Persona) this.get(i);
            if (aux.getEmail().equalsIgnoreCase(email) && aux.getContra().equals(contra)) {
                p = aux;
                salir = true;
            }
        }
        return p;
    }

    public Persona buscaEmail(String email) {
        Persona p = null;
        boolean salir = false;
        for (int i = 0; i < this.size() && !salir; i++) {
            Persona aux = (Persona) this.get(i);
            if (aux.getEmail().equalsIgnoreCase(email)) {
                p = aux;
                salir = true;
            }
        }
        return p;
    }
    
        public boolean borrarPorEmail(String email) {
        boolean p = false;
        boolean salir = false;
        for (int i = 0; i < this.size() && !salir; i++) {
            Persona aux = (Persona) this.get(i);
            if (aux.getEmail().equalsIgnoreCase(email)) {
                this.remove(i);
                salir = true;
                p = true;
            }
        }
        return p;
    }
}
