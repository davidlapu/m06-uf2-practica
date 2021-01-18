package cat.itb.m06.uf2;

import cat.itb.m06.uf2.ConnexionsBD.ConnexioMySQL;
import cat.itb.m06.uf2.MetodesCRUD.Client_CRUD;
import cat.itb.m06.uf2.MetodesCRUD.Empleat_CRUD;
import cat.itb.m06.uf2.MetodesCRUD.Producte_CRUD;
import cat.itb.m06.uf2.Model.Empleat;
import cat.itb.m06.uf2.Model.Producte;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    private Producte_CRUD producteCrud = new Producte_CRUD();
    private Empleat_CRUD empleatCrud = new Empleat_CRUD();
    private Client_CRUD clientCrud = new Client_CRUD();

    public static void main(String[] args) {
        Main main = new Main();
        main.start();
    }

    public void start() {
        e1Script();

        try {
            ConnexioMySQL.createConnectionEmpresa();
        } catch (SQLException throwables) {
            System.out.println("ERROR AL CONECTAR AMB LA BD:" + throwables.getMessage());
        }

        e2InsertarProductos();
        e3InsertarEmpleados();
        e4ActualizarClientes();
        e5ConsultarCliente();
        e6ConsultarEmpleado();
        e7ConsultarProducto();
        e8EliminarCliente();
        e9EliminarEmpleado();
        e10EliminarProducto();

        ConnexioMySQL.closeConnection();
    }

    public void e1Script() {
        String linea, consulta, salto = System.getProperty("line.separator");;
        StringBuilder stringBuilder = new StringBuilder();
        File scriptFile = new File("empresa.sql");
        BufferedReader entrada;

        try {
            entrada = new BufferedReader(new FileReader(scriptFile));
            while ((linea = entrada.readLine()) != null) {
                stringBuilder.append(linea);
                stringBuilder.append(salto);
            }

            consulta = stringBuilder.toString();

            Connection con = ConnexioMySQL.createConnection();
            Statement sents = con.createStatement();
            sents.executeUpdate(consulta);
            sents.close();
            con.close();
        } catch (FileNotFoundException e) {
            System.out.println("ERROR Fichero no encontrado: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("ERROR de E/S, al operar " + e.getMessage());
        } catch (SQLException throwables) {
            System.out.println("ERROR AL EJECUTAR EL SCRIPT: " + throwables.getMessage());
        }
    }

    public void e2InsertarProductos() {
        producteCrud.insert(new Producte(300388, "RH GUIDE TO PADDLE"));
        producteCrud.insert(new Producte(400552, "RH GUIDE TO BOX"));
        producteCrud.insert(new Producte(400333, "ACE TENNIS BALLS-10 PACK"));
    }

    private void e3InsertarEmpleados() {
        empleatCrud.insert(new Empleat(4885, "'BORREL'", "'EMPLEAT'", 7902,
                "'1981-12-25'", 104000, null, 30));
        empleatCrud.insert(new Empleat(8772, "'PUIG'", "'VENEDOR'", 7698,
                "'1990-01-23'", 108000, null, 30));
        empleatCrud.insert(new Empleat(9945, "'FERRER'", "'ANALISTA'", 7698,
                "'1988-05-17'", 169000, 39000, 20));
    }

    public void e4ActualizarClientes() {
        clientCrud.updateCredit(104, 20000);
        clientCrud.updateCredit(106, 12000);
        clientCrud.updateCredit(107, 20000);
    }

    public void e5ConsultarCliente() {
        try {
            System.out.println(clientCrud.select(106).toString());
        } catch (SQLException throwables) {
            System.out.println("ERROR AL CONSULTAR CLIENT: " + throwables.getMessage());
        }

    }

    public void e6ConsultarEmpleado() {
        try {
            System.out.println(empleatCrud.select(7788).toString());
        } catch (SQLException throwables) {
            System.out.println("ERROR AL CONSULTAR EMPLEADO: " + throwables.getMessage());
        }

    }

    public void e7ConsultarProducto() {
        try {
            System.out.println(producteCrud.select(101860));
        } catch (SQLException throwables) {
            System.out.println("ERROR AL SELECIONAR PRODUCTO: " + throwables.getMessage());
        }
    }

    public void e8EliminarCliente() {
        clientCrud.delete(109);
    }

    public void e9EliminarEmpleado() {
        empleatCrud.delete(4885);
    }

    public void e10EliminarProducto() {
        producteCrud.delete(400552);
    }


}
