package cat.itb.m06.uf2.MetodesCRUD;

import cat.itb.m06.uf2.ConnexionsBD.ConnexioMySQL;
import cat.itb.m06.uf2.Model.Empleat;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Empleat_CRUD {

    public void insertarEmpleat(Empleat e){
        try {
            Statement sentencia = ConnexioMySQL.getConnection().createStatement();
            String sql = "INSERT INTO EMP VALUES (" + e.getEmpNo() + ", " + e.getCognom() +
                    ", " + e.getOfici() + ", " + e.getCap() + ", " + e.getDataAlta() +
                    ", " + e.getSalari() + ", " + e.getCommisio() + ", " + e.getDepNo() + ")";
            sentencia.executeUpdate(sql);
            sentencia.close();
            System.out.println("Empleat insertat amb exit");
        } catch (SQLException throwables) {
            throwables.printStackTrace();//TODO
        }

    }

    public void select(int id) {
        try {
            Statement statement = ConnexioMySQL.getConnection().createStatement();
            String sql = "SELECT * FROM EMP WHERE EMP_NO = " + id;
            ResultSet result = statement.executeQuery(sql);
            result.next();

            System.out.println("Name: " + result.getString(2)); //TODO

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
