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
public class Persona {
    //variables
    private String nombre;
    private String apellido;
    private String email;
    private String rol;
    private int edad;  
    private String sexo;   
    private String fecha;
    private LinkedList asignaturas;
    private String curso;
    private String contra;
    private int partGanadas;
    private String imagen;
    
    //constructores

    public Persona() {
        asignaturas = new LinkedList <String> ();
    }

    public Persona(String nombre, int edad, String sexo, String fecha, String curso, String contra, String apellido, String email, String rol, int partGanadas, String imagen) {
        this.nombre = nombre;
        this.edad = edad;
        this.apellido = apellido;
        this.email = email;
        this.rol = rol;
        this.sexo = sexo;
        this.fecha = fecha;
        asignaturas = new LinkedList <String> ();        
        this.curso = curso;
        this.contra = contra;
        this.partGanadas = partGanadas;
        this.imagen = imagen;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }
    
    public void meterAsignatura(String asig){
        this.asignaturas.add(asig);
    }

    public int cuantasAsig(){
        return this.asignaturas.size();
    }
    
    public String getAsig(int i){
        return (String) this.asignaturas.get(i);
    }

    public int getPartGanadas() {
        return partGanadas;
    }

    public void setPartGanadas(int partGanadas) {
        this.partGanadas = partGanadas;
    }
    
    
    
    @Override
    public String toString() {
        return "Persona{" + "nombre=" + nombre + ", edad=" + edad + ", sexo=" + sexo + ", fecha=" + fecha + ", asignaturas=" + asignaturas.toString() + ", curso=" + curso + '}';
    }
    
    
    
}
