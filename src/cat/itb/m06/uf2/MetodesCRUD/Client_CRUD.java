package cat.itb.m06.uf2.MetodesCRUD;

import cat.itb.m06.uf2.ConnexionsBD.ConnexioMySQL;
import cat.itb.m06.uf2.Model.Client;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Client_CRUD {
    public void actualizarLimitCredit(int clientCod, double limitCredit){
        try {
            String sql = "UPDATE CLIENT SET LIMIT_CREDIT = ? WHERE CLIENT_COD = ?";
            PreparedStatement sentencia = ConnexioMySQL.getConnection().prepareStatement(sql);

            sentencia.setDouble(1,limitCredit);
            sentencia.setInt(2,clientCod);


            int filas = sentencia.executeUpdate();
            System.out.println(filas + "filas actualizadas");
            sentencia.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Client selectClient(int id) {
        Client client = new Client();

        try {
            Statement sentencia = ConnexioMySQL.getConnection().createStatement();
            String sql = "SELECT * FROM CLIENT WHERE CLIENT_COD = " + id;
            ResultSet result = sentencia.executeQuery(sql);

            result.next();
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

            result.close();
            sentencia.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return client;
    }



}
