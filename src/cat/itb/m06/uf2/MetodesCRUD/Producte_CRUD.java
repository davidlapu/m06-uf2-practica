package cat.itb.m06.uf2.MetodesCRUD;

import cat.itb.m06.uf2.ConnexionsBD.ConnexioMySQL;
import cat.itb.m06.uf2.Model.Producte;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Producte_CRUD {
    public void insert(Producte p) {
        try {
            PreparedStatement preparedStatement = ConnexioMySQL.getConnection()
                    .prepareStatement("INSERT INTO PRODUCTE VALUES ( ?, ? )");
            preparedStatement.setInt(1, p.getProdNum());
            preparedStatement.setString(2, p.getDescripccio());

            preparedStatement.executeUpdate();
            preparedStatement.close();

            System.out.println("Producte " + p.getProdNum() + " insertado con exito");
        } catch (SQLException throwables) {
            System.out.println("ERROR AL INSERTAR EL PRODUCTO " + p.getProdNum() + " : " + throwables.getMessage());
        }
    }

    public Producte select(int id) throws SQLException {
        Producte p = new Producte();

        PreparedStatement preparedStatement = ConnexioMySQL.getConnection()
                .prepareStatement("SELECT * FROM PRODUCTE WHERE PROD_NUM = ?");
        preparedStatement.setInt(1, id);

        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            p.setProdNum(resultSet.getInt("PROD_NUM"));
            p.setDescripccio(resultSet.getString("DESCRIPCIO"));
        } else {
            resultSet.close();
            preparedStatement.close();
            throw new SQLException("Producto no encontrado");
        }

        resultSet.close();
        preparedStatement.close();

        return p;
    }

    public void delete(int id) {
        try {
            PreparedStatement preparedStatement = ConnexioMySQL.getConnection()
                    .prepareStatement("DELETE FROM PRODUCTE WHERE PROD_NUM = ?");

            preparedStatement.setInt(1, id);
            int res = preparedStatement.executeUpdate();

            if (res > 0) {
                System.out.println("Eliminado producto con id: " + id);
            } else {
                System.out.println("Product no con id " + id + " no existe");
            }

            preparedStatement.close();
        } catch (SQLException throwables) {
            System.out.println("ERROR AL ELIMINAR EL PRODUCTO " + id + " " + throwables.getMessage());
        }

    }

}
