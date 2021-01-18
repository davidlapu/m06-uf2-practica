package cat.itb.m06.uf2.ConnexionsBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexioMySQL {
    private static Connection connection;
    public static Connection createConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://192.168.1.134:3306/?allowMultiQueries=true","user1", "password1");
    }

    public static void createConnectionEmpresa() throws SQLException {
        connection = DriverManager.getConnection("jdbc:mysql://192.168.1.134:3306/empresa?allowMultiQueries=true","user1", "password1");
    }

    public static Connection getConnection() {
        return connection;
    }

    public static void closeConnection() {
        try {
            connection.close();
        } catch (SQLException throwables) {
            System.out.println("ERROR AL CERRAR LA CONEXION: " + throwables.getMessage());
        }
    }
}