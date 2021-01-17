package cat.itb.m06.uf2.Model;

public class Producte {
    private int prodNum;
    private String descripccio;

    public Producte(int prodNum, String descripccio) {
        this.prodNum = prodNum;
        this.descripccio = descripccio;
    }

    public int getProdNum() {
        return prodNum;
    }

    public String getDescripccio() {
        return descripccio;
    }

}
