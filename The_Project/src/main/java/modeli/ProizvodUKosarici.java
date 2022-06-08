package modeli;

public class ProizvodUKosarici {
   int IDProizvod;
   String Naziv;
   String Opis;
   int KolicinaNaSkladistu;
   double Cijena;
   int Kolicina;

    public ProizvodUKosarici(int IDProizvod, String Naziv, String Opis, int KolicinaNaSkladistu, double Cijena, int Kolicina) {
        this.IDProizvod = IDProizvod;
        this.Naziv = Naziv;
        this.Opis = Opis;
        this.KolicinaNaSkladistu = KolicinaNaSkladistu;
        this.Cijena = Cijena;
        this.Kolicina = Kolicina;
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

    public int getKolicina() {
        return Kolicina;
    }

    public void setKolicina(int Kolicina) {
        this.Kolicina = Kolicina;
    }
   

   
}
