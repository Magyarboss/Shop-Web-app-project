/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeli;

import java.time.LocalDateTime;

/**
 *
 * @author Magyarboss
 */
public class Kupnja {
    
    int IDKupnja;
    int KorisnikID;
    int ProizvodID;
    double Cijena;
    int Kolicina;
    String Datum;
    String Nacin;
    String NazivKorisnika;
    String NazivProizvoda;
    String EmailKorisnika;

    public Kupnja(int IDKupnja, int KorisnikID, int ProizvodID, double Cijena, int Kolicina, String Datum, String Nacin, String NazivKorisnika, String NazivProizvoda, String EmailKorisnika) {
        this.IDKupnja = IDKupnja;
        this.KorisnikID = KorisnikID;
        this.ProizvodID = ProizvodID;
        this.Cijena = Cijena;
        this.Kolicina = Kolicina;
        this.Datum = Datum;
        this.Nacin = Nacin;
        this.NazivKorisnika = NazivKorisnika;
        this.NazivProizvoda = NazivProizvoda;
        this.EmailKorisnika = EmailKorisnika;
    }

    public Kupnja(int IDKupnja, int KorisnikID, int ProizvodID, double Cijena, int Kolicina, String Datum, String Nacin, String NazivKorisnika, String NazivProizvoda) {
        this.IDKupnja = IDKupnja;
        this.KorisnikID = KorisnikID;
        this.ProizvodID = ProizvodID;
        this.Cijena = Cijena;
        this.Kolicina = Kolicina;
        this.Datum = Datum;
        this.Nacin = Nacin;
        this.NazivKorisnika = NazivKorisnika;
        this.NazivProizvoda = NazivProizvoda;
    }

    public int getIDKupnja() {
        return IDKupnja;
    }

    public void setIDKupnja(int IDKupnja) {
        this.IDKupnja = IDKupnja;
    }

    public int getKorisnikID() {
        return KorisnikID;
    }

    public void setKorisnikID(int KorisnikID) {
        this.KorisnikID = KorisnikID;
    }

    public int getProizvodID() {
        return ProizvodID;
    }

    public void setProizvodID(int ProizvodID) {
        this.ProizvodID = ProizvodID;
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

    public String getDatum() {
        return Datum;
    }

    public void setDatum(String Datum) {
        this.Datum = Datum;
    }

    public String getNacin() {
        return Nacin;
    }

    public void setNacin(String Nacin) {
        this.Nacin = Nacin;
    }

    public String getNazivKorisnika() {
        return NazivKorisnika;
    }

    public void setNazivKorisnika(String NazivKorisnika) {
        this.NazivKorisnika = NazivKorisnika;
    }

    public String getNazivProizvoda() {
        return NazivProizvoda;
    }

    public void setNazivProizvoda(String NazivProizvoda) {
        this.NazivProizvoda = NazivProizvoda;
    }

    public String getEmailKorisnika() {
        return EmailKorisnika;
    }

    public void setEmailKorisnika(String EmailKorisnika) {
        this.EmailKorisnika = EmailKorisnika;
    }

    @Override
    public String toString() {
        return "Kupnja{" + "IDKupnja=" + IDKupnja + ", KorisnikID=" + KorisnikID + ", ProizvodID=" + ProizvodID + ", Cijena=" + Cijena + ", Kolicina=" + Kolicina + ", Datum=" + Datum + ", Nacin=" + Nacin + ", NazivKorisnika=" + NazivKorisnika + ", NazivProizvoda=" + NazivProizvoda + ", EmailKorisnika=" + EmailKorisnika + '}';
    }

   
    
}
