package cat.itb.m06.uf2.Model;

public class Client {
    private int clientCod;
    private String nom;
    private String adreca;
    private String ciutat;
    private String estat;
    private String codiPostal;
    private int area;
    private String telefon;
    private int reprCod;
    private double limitCredit;
    private String observacions;

    public Client() {
    }

    public Client(int clientCod, String nom, String adreca, String ciutat, String estat, String codiPostal, int area, String telefon, int reprCod, double limitCredit, String observacions) {
        this.clientCod = clientCod;
        this.nom = nom;
        this.adreca = adreca;
        this.ciutat = ciutat;
        this.estat = estat;
        this.codiPostal = codiPostal;
        this.area = area;
        this.telefon = telefon;
        this.reprCod = reprCod;
        this.limitCredit = limitCredit;
        this.observacions = observacions;
    }

    public Client(int clientCod, double limitCredit) {
        this.clientCod = clientCod;
        this.limitCredit = limitCredit;
    }

    public int getClientCod() {
        return clientCod;
    }

    public String getNom() {
        return nom;
    }

    public String getAdreca() {
        return adreca;
    }

    public String getCiutat() {
        return ciutat;
    }

    public String getEstat() {
        return estat;
    }

    public String getCodiPostal() {
        return codiPostal;
    }

    public int getArea() {
        return area;
    }

    public String getTelefon() {
        return telefon;
    }

    public int getReprCod() {
        return reprCod;
    }

    public double getLimitCredit() {
        return limitCredit;
    }

    public String getObservacions() {
        return observacions;
    }

    public void setClientCod(int clientCod) {
        this.clientCod = clientCod;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setAdreca(String adreca) {
        this.adreca = adreca;
    }

    public void setCiutat(String ciutat) {
        this.ciutat = ciutat;
    }

    public void setEstat(String estat) {
        this.estat = estat;
    }

    public void setCodiPostal(String codiPostal) {
        this.codiPostal = codiPostal;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public void setReprCod(int reprCod) {
        this.reprCod = reprCod;
    }

    public void setLimitCredit(double limitCredit) {
        this.limitCredit = limitCredit;
    }

    public void setObservacions(String observacions) {
        this.observacions = observacions;
    }

    @Override
    public String toString() {
        return "Client{" +
                "clientCod=" + clientCod +
                ", nom='" + nom + '\'' +
                ", adreca='" + adreca + '\'' +
                ", ciutat='" + ciutat + '\'' +
                ", estat='" + estat + '\'' +
                ", codiPostal='" + codiPostal + '\'' +
                ", area=" + area +
                ", telefon='" + telefon + '\'' +
                ", reprCod=" + reprCod +
                ", limitCredit=" + limitCredit +
                ", observacions='" + observacions + '\'' +
                '}';
    }
}
