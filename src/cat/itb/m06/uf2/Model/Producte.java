package cat.itb.m06.uf2.Model;

public class Producte {
    private int prodNum;
    private String descripccio;

    public Producte() {
    }

    public Producte(int prodNum, String descripccio) {
        this.prodNum = prodNum;
        this.descripccio = descripccio;
    }

    public int getProdNum() {
        return prodNum;
    }

    public void setProdNum(int prodNum) {
        this.prodNum = prodNum;
    }

    public String getDescripccio() {
        return descripccio;
    }

    public void setDescripccio(String descripccio) {
        this.descripccio = descripccio;
    }

    @Override
    public String toString() {
        return "Producte{" +
                "prodNum=" + prodNum +
                ", descripccio='" + descripccio + '\'' +
                '}';
    }
}
