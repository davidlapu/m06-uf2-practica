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

    public Empleat() {
    }

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

    public void setEmpNo(int empNo) {
        this.empNo = empNo;
    }

    public String getCognom() {
        return cognom;
    }

    public void setCognom(String cognom) {
        this.cognom = cognom;
    }

    public String getOfici() {
        return ofici;
    }

    public void setOfici(String ofici) {
        this.ofici = ofici;
    }

    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }

    public String getDataAlta() {
        return dataAlta;
    }

    public void setDataAlta(String dataAlta) {
        this.dataAlta = dataAlta;
    }

    public int getSalari() {
        return salari;
    }

    public void setSalari(int salari) {
        this.salari = salari;
    }

    public Integer getCommisio() {
        return commisio;
    }

    public void setCommisio(Integer commisio) {
        this.commisio = commisio;
    }

    public int getDepNo() {
        return depNo;
    }

    public void setDepNo(int depNo) {
        this.depNo = depNo;
    }

    @Override
    public String toString() {
        return "Empleat{" +
                "empNo=" + empNo +
                ", cognom='" + cognom + '\'' +
                ", ofici='" + ofici + '\'' +
                ", cap=" + cap +
                ", dataAlta='" + dataAlta + '\'' +
                ", salari=" + salari +
                ", commisio=" + commisio +
                ", depNo=" + depNo +
                '}';
    }
}
