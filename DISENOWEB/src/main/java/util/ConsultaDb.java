
package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.ConexionDb;

/**
 *
 * @author Alberto
 */
public class ConsultaDb {
    private Connection conexion;
    
    public ConsultaDb(){
        conexion = ConexionDb.getConexion();
    }
    
    //EN ESTA CLASE PONER TODAS LAS CONSULTAS QUE SE PUEDEN HACER EN LA BASE DE DATOS
    //Alta usuario
    //Baja usuario
    //Modificar usuario
    //Buscar usuario por id
    //Buscar empresa
    //Lista usuarios
    //Lista de empresas
    //...
}
