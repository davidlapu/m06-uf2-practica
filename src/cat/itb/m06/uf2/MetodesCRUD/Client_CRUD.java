package cat.itb.m06.uf2.MetodesCRUD;

import cat.itb.m06.uf2.ConnexionsBD.ConnexioMySQL;
import cat.itb.m06.uf2.Model.Client;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Client_CRUD {
    public void updateCredit(int clientCod, double limitCredit) {
        try {
            PreparedStatement preparedStatement = ConnexioMySQL.getConnection()
                    .prepareStatement("UPDATE CLIENT SET LIMIT_CREDIT = ? WHERE CLIENT_COD = ?");

            preparedStatement.setDouble(1, limitCredit);
            preparedStatement.setInt(2, clientCod);


            int filas = preparedStatement.executeUpdate();
            System.out.println(filas + " filas actualizadas");
            preparedStatement.close();
        } catch (SQLException throwables) {
            System.out.println("ERROR AL ACTUALIZAR EL CREDITO: " + throwables.getMessage());
        }
    }

    public Client select(int id) throws SQLException {
        Client client = new Client();
        Statement sentencia = ConnexioMySQL.getConnection().createStatement();
        ResultSet result = sentencia.executeQuery("SELECT * FROM CLIENT WHERE CLIENT_COD = " + id);

        if (result.next()) {
            client.setClientCod(result.getInt(1));
            client.setNom(result.getString(2));
            client.setAdreca(result.getString(3));
            client.setCiutat(result.getString(4));
            client.setEstat(result.getString(5));
            client.setCodiPostal(result.getString(6));
            client.setArea(result.getInt(7));
            client.setTelefon(result.getString(8));
            client.setReprCod(result.getInt(9));
            client.setLimitCredit(result.getDouble(10));
            client.setObservacions(result.getString(11));
        } else {
            result.close();
            sentencia.close();
            throw new SQLException("Cliente no encontrado " + id);
        }

        result.close();
        sentencia.close();

        return client;
    }

    public void delete(int id) {
        try {
            PreparedStatement preparedStatement = ConnexioMySQL.getConnection()
                    .prepareStatement("DELETE FROM CLIENT WHERE CLIENT_COD = ?");

            preparedStatement.setInt(1, id);
            int res = preparedStatement.executeUpdate();

            if (res > 0) {
                System.out.println("Eliminado cliente con id: " + id);
            } else {
                System.out.println("Cliente no con id " + id + " no existe");
            }

            preparedStatement.close();
        } catch (SQLException throwables) {
            System.out.println("ERROR AL ELIMINAR EL CLIENTE " + id + " " + throwables.getMessage());
        }

    }

}
