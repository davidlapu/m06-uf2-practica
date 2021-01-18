package cat.itb.m06.uf2.MetodesCRUD;

import cat.itb.m06.uf2.ConnexionsBD.ConnexioMySQL;
import cat.itb.m06.uf2.Model.Empleat;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Empleat_CRUD {

    public void insert(Empleat e) {
        try {
            Statement statement = ConnexioMySQL.getConnection().createStatement();
            statement.executeUpdate("INSERT INTO EMP VALUES (" + e.getEmpNo() + ", " + e.getCognom() +
                    ", " + e.getOfici() + ", " + e.getCap() + ", " + e.getDataAlta() +
                    ", " + e.getSalari() + ", " + e.getCommisio() + ", " + e.getDepNo() + ")");
            statement.close();
            System.out.println("Empleado " + e.getEmpNo() + " insertado con exito");
        } catch (SQLException throwables) {
            System.out.println("ERROR AL INSERTAR EMPLEAT: " + throwables.getMessage());
        }

    }

    public Empleat select(int id) throws SQLException {
        Empleat empleat = new Empleat();

        Statement statement = ConnexioMySQL.getConnection().createStatement();
        ResultSet result = statement.executeQuery("SELECT * FROM EMP WHERE EMP_NO = " + id);

        if (result.next()) {
            empleat.setEmpNo(result.getInt("EMP_NO"));
            empleat.setCognom(result.getString("COGNOM"));
            empleat.setOfici(result.getString("OFICI"));
            empleat.setCap(result.getInt("CAP"));
            empleat.setDataAlta(result.getString("DATA_ALTA"));
            empleat.setSalari(result.getInt("SALARI"));
            empleat.setCommisio(result.getInt("COMISSIO"));
            empleat.setDepNo(result.getInt("DEPT_NO"));
        } else {
            result.close();
            statement.close();
            throw new SQLException("Empleat " + id + "no encontrado");
        }

        result.close();
        statement.close();
        return empleat;
    }

    public void delete(int id) {
        try {
            Statement statement = ConnexioMySQL.getConnection().createStatement();

            int res = statement.executeUpdate("DELETE FROM EMP WHERE EMP_NO = " + id);
            if (res > 0) {
                System.out.println("Eliminado empleado con id: " + id);
            } else {
                System.out.println("Empleado no con id " + id + " no existe");
            }

            statement.close();
        } catch (SQLException throwables) {
            System.out.println("ERROR AL ELIMINAR EL EMPLEADO " + id + " " + throwables.getMessage());
        }

    }
}
