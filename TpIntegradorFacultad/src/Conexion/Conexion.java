package Conexion;

import java.sql.*;
import javax.swing.JOptionPane;

import Clases.*;

public class Conexion {

    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/facultad";
    private static final String USER = "root";
    private static final String PASS = "0203";
    
    Connection connection;

    public Connection getConexion() {
        
        try {
            Class.forName(JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            JOptionPane.showMessageDialog(null,"Conexion exitosa","Conexion",JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;

    }

    public void insertarCarrera(Carrera carrera1)throws SQLException{
        Connection connection = this.getConexion();
        PreparedStatement as=null;
        try {
            as=connection.prepareStatement("INSERT INTO carreras VALUES (?,?,?,?)");
            as.setInt(1,carrera1.getIdcarrera());
            as.setString(2,carrera1.getNombre());
            as.setInt(3,carrera1.getCantidadMaterias());
            as.setInt(4,carrera1.getDuracion());

            int response = as.executeUpdate();
            if (response>0) {
                System.out.println("Insertado correctamente");
                
            as.close();
            connection.close();
            }
        } catch (SQLException sqle) {
            System.out.println("Sqlstate: "+ sqle.getSQLState());
            System.out.println("SlqError: "+ sqle.getErrorCode());
            sqle.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        }finally{
            if (connection != null) {
                try {
                    as.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public void insertarPersona(Persona usuario1){
        Connection connection = this.getConexion();
        PreparedStatement as=null;
        try {
            as=connection.prepareStatement("INSERT INTO usuarios VALUES (?,?,?,?,?,?)");
            as.setInt(1,usuario1.getIdpersona());
            as.setString(2,usuario1.getNombre());
            as.setString(3,usuario1.getApellido());
            as.setLong(4,usuario1.getDni());
            as.setString(5,usuario1.getProvincia());
            as.setString(6,usuario1.getCarrera());

            int response = as.executeUpdate();
            if (response>0) {
                System.out.println("Ingreso exitoso");
                as.close();
                connection.close();  
            }
        } catch (SQLException sqle) {
            System.out.println("Sqlstate: " + sqle.getSQLState());
            System.out.println("SlqError: " + sqle.getErrorCode());
            sqle.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    as.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }


       
}