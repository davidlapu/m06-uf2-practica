package cat.itb.m06.uf2.Model;

public class Empleat {
    private int empNo;
    private String cognom;
    private String ofici;
    private int cap;
    private String dataAlta;
    private int salari;
    private Integer commisio;
    private int depNo;

    public Empleat(int empNo, String cognom, String ofici, int cap, String dataAlta, int salari, Integer commisio, int depNo) {
        this.empNo = empNo;
        this.cognom = cognom;
        this.ofici = ofici;
        this.cap = cap;
        this.dataAlta = dataAlta;
        this.salari = salari;
        this.commisio = commisio;
        this.depNo = depNo;
    }

    public int getEmpNo() {
        return empNo;
    }

    public String getCognom() {
        return cognom;
    }

    public String getOfici() {
        return ofici;
    }

    public int getCap() {
        return cap;
    }

    public String getDataAlta() {
        return dataAlta;
    }

    public int getSalari() {
        return salari;
    }

    public Integer getCommisio() {
        return commisio;
    }

    public int getDepNo() {
        return depNo;
    }
}
