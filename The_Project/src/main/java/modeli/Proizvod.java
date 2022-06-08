package modeli;

public class Proizvod {
     int IDProizvod;
     String Naziv;
     String Opis;
     int KolicinaNaSkladistu;
     double Cijena;
     int PotkategorijaID;
     int KategorijaID;
     String Slika;

    public Proizvod(int IDProizvod, String Naziv, String Opis, int KolicinaNaSkladistu, double Cijena, int PotkategorijaID, int KategorijaID, String Slika) {
        this.IDProizvod = IDProizvod;
        this.Naziv = Naziv;
        this.Opis = Opis;
        this.KolicinaNaSkladistu = KolicinaNaSkladistu;
        this.Cijena = Cijena;
        this.PotkategorijaID = PotkategorijaID;
        this.KategorijaID = KategorijaID;
        this.Slika = Slika;
    }

    public int getIDProizvod() {
        return IDProizvod;
    }

    public void setIDProizvod(int IDProizvod) {
        this.IDProizvod = IDProizvod;
    }

    public String getNaziv() {
        return Naziv;
    }

    public void setNaziv(String Naziv) {
        this.Naziv = Naziv;
    }

    public String getOpis() {
        return Opis;
    }

    public void setOpis(String Opis) {
        this.Opis = Opis;
    }

    public int getKolicinaNaSkladistu() {
        return KolicinaNaSkladistu;
    }

    public void setKolicinaNaSkladistu(int KolicinaNaSkladistu) {
        this.KolicinaNaSkladistu = KolicinaNaSkladistu;
    }

    public double getCijena() {
        return Cijena;
    }

    public void setCijena(double Cijena) {
        this.Cijena = Cijena;
    }

    public int getPotkategorijaID() {
        return PotkategorijaID;
    }

    public void setPotkategorijaID(int PotkategorijaID) {
        this.PotkategorijaID = PotkategorijaID;
    }

    public int getKategorijaID() {
        return KategorijaID;
    }

    public void setKategorijaID(int KategorijaID) {
        this.KategorijaID = KategorijaID;
    }

    public String getSlika() {
        return Slika;
    }

    public void setSlika(String Slika) {
        this.Slika = Slika;
    }

}    