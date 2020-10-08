package Modelo;

import Auxiliar.Constantes;
import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import javax.swing.JOptionPane;

public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "com.mysql.cj.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName("org.mariadb.jdbc.Driver");              
            //Class.forName(controlador).newInstance();
            //Class.forName(controlador);
            //Class.forName("com.mysql.jdbc.Driver").newInstance(); 

            String URL_BD = "jdbc:mysql://127.0.0.1:3306/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";
            String connectionString = "jdbc:mysql://localhost:3306/" + Constantes.BBDD + "?user=" + Constantes.usuario + "&password=" + Constantes.password + "&useUnicode=true&characterEncoding=UTF-8";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(connectionString);
            //Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            //Conex = DriverManager.getConnection(  
            //   "jdbc:mariadb://localhost:3306/"+ Constantes.BBDD, Constantes.usuario, Constantes.password); 
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static boolean addPersona(Persona p) {
        nueva();
        boolean conseguido = false;
        String Sentencia = "INSERT INTO " + Constantes.tablaPersona + " VALUES "
                + "('" + p.getNombre() + "'," + "'" + p.getApellido() + "','" + p.getEmail() + "','"
                + p.getRol() + "'," + p.getEdad() + ", '" + p.getSexo() + "',"
                + "'" + p.getFecha() + "','" + p.getCurso() + "','" + p.getContra() + "',"
                + p.getPartGanadas() + ",'" + p.getImagen() + "');";
        System.out.println(Sentencia);

        //--- Meter las asignaturas
        try {
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
            for (int i = 0; i < p.cuantasAsig(); i++) {
                String sentencia2 = "INSERT INTO `" + Constantes.tablaAsig + "`(`email`, `nombre`)"
                        + " VALUES('" + p.getEmail() + "', '" + p.getAsig(i) + "')";
                ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia2);
            }
            conseguido = true;
            cerrarBD();
        } catch (Exception e) {
            System.out.println(e);
        };

        return conseguido;
    }

    public static Persona loggear(String user, String contra) {
        nueva();
        Persona p = null;
        String Sentencia = "select * from " + Constantes.tablaPersona + " where email= '" + user + "' and contra = '" + contra + "'";
        System.out.println(Sentencia);

        try {
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(Sentencia);
            if (ConexionEstatica.Conj_Registros.next()) {
                //String nombre, int edad, String sexo, String fecha, String curso, String contra, String apellido, String email, String rol
                p = new Persona(Conj_Registros.getString("nombre"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getString("fecha"),
                        Conj_Registros.getString("curso"), Conj_Registros.getString("contra"), Conj_Registros.getString("apellido"), Conj_Registros.getString("email"),
                        Conj_Registros.getString("rol"), Conj_Registros.getInt("partGanadas"), Conj_Registros.getString("imagen"));
            }
            cerrarBD();
        } catch (Exception e) {
            System.out.println(e);
        };

        return p;
    }

    public static LinkedList listaPersonas() {
        nueva();
        LinkedList l = new LinkedList<Persona>();
        Persona p;
        String Sentencia = "select * from " + Constantes.tablaPersona + "; ";
        System.out.println(Sentencia);

        try {
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(Sentencia);
            while (ConexionEstatica.Conj_Registros.next()) {
                //String nombre, int edad, String sexo, String fecha, String curso, String contra, String apellido, String email, String rol
                p = new Persona(Conj_Registros.getString("nombre"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getString("fecha"),
                        Conj_Registros.getString("curso"), Conj_Registros.getString("contra"), Conj_Registros.getString("apellido"), Conj_Registros.getString("email"),
                        Conj_Registros.getString("rol"), Conj_Registros.getInt("partGanadas"), Conj_Registros.getString("imagen"));
                l.add(p);
            }
            cerrarBD();
        } catch (Exception e) {
            System.out.println(e);
        };

        return l;
    }

    public static Persona buscaEmail(String email) {
        nueva();
        Persona p = null;
        String Sentencia = "select * from " + Constantes.tablaPersona + " where email= '" + email + "';";
        System.out.println(Sentencia);

        try {
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(Sentencia);
            if (ConexionEstatica.Conj_Registros.next()) {
                //String nombre, int edad, String sexo, String fecha, String curso, String contra, String apellido, String email, String rol
                p = new Persona(Conj_Registros.getString("nombre"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getString("fecha"),
                        Conj_Registros.getString("curso"), Conj_Registros.getString("contra"), Conj_Registros.getString("apellido"), Conj_Registros.getString("email"),
                        Conj_Registros.getString("rol"), Conj_Registros.getInt("partGanadas"), Conj_Registros.getString("imagen"));
            }
            cerrarBD();
        } catch (Exception e) {
            System.out.println(e);
        };

        return p;
    }

    public static boolean modificarPersona(Persona p) {
        boolean modificado = false;
        nueva();
        try {
            String sentencia = "UPDATE " + Constantes.tablaPersona + " set nombre = '" + p.getNombre()
                    + "', apellido = '" + p.getApellido() + "' where email = '" + p.getEmail() + "';";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            modificado = true;

        } catch (Exception e) {
        }
        cerrarBD();
        return modificado;
    }

    public static boolean modificarContraseña(Persona p) {
        boolean modificado = false;
        nueva();
        try {
            String sentencia = "UPDATE " + Constantes.tablaPersona
                    + " set contra = '" + p.getContra()
                    + "' where email = '" + p.getEmail() + "';";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            modificado = true;

        } catch (Exception e) {
        }
        cerrarBD();
        return modificado;
    }

    public static boolean borrarPorEmail(String email) {
        boolean conseguido = false;
        nueva();
        try {
            String sentencia = "DELETE FROM " + Constantes.tablaPersona
                    + " where email = '" + email + "'";
            System.out.println(sentencia);
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            conseguido = true;
        } catch (Exception e) {
        }
        cerrarBD();
        return conseguido;
    }

    public static boolean ganarPartida(Persona p) {
        boolean conseguido = false;
        nueva();
        try {
            int part = p.getPartGanadas() + 1;
            String sentencia = "UPDATE " + Constantes.tablaPersona + " set partGanadas = "
                    + part + " where email = '" + p.getEmail() + "' ";
            System.out.println(sentencia);
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            conseguido = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        cerrarBD();
        return conseguido;

    }

    public static boolean modificarImgPerfil(Persona p) {
        boolean conseguido = false;
        nueva();
        try {        
            String sentencia = "UPDATE " + Constantes.tablaPersona + " set imagen = '"
                    + p.getImagen() + "' where email = '" + p.getEmail() + "' ";
            System.out.println(sentencia);
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            conseguido = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        cerrarBD();
        return conseguido;
    }
}
