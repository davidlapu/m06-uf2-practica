package cat.itb.m06.uf2.MetodesCRUD;

import cat.itb.m06.uf2.ConnexionsBD.ConnexioMySQL;
import cat.itb.m06.uf2.Model.Producte;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Producte_CRUD {
    public void insertarProducte(Producte p) {
        try {
            Connection connection = ConnexioMySQL.getConnection();
            String sql = "INSERT INTO PRODUCTE VALUES "
                    + "( ?, ? )";

            PreparedStatement sentencia = connection.prepareStatement(sql);
            sentencia.setInt(1, p.getProdNum());
            sentencia.setString(2, p.getDescripccio());

            sentencia.executeUpdate();
            sentencia.close();

            System.out.println("Producte insertat correctament");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void select(int id) {
        try {
            String sql = "SELECT * FROM PRODUCTE WHERE PROD_NUM = ?";
            PreparedStatement preparedStatement = ConnexioMySQL.getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, id);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

}
