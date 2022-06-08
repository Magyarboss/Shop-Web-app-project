/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeli;

/**
 *
 * @author Magyarboss
 */
public class Potkategorija {
    
    int potkategorijaID;
    int kategorijaID;
    String naziv;

    public Potkategorija(int potkategorijaID, int kategorijaID, String naziv) {
        this.potkategorijaID = potkategorijaID;
        this.kategorijaID = kategorijaID;
        this.naziv = naziv;
    }

    public int getPotkategorijaID() {
        return potkategorijaID;
    }

    public void setPotkategorijaID(int potkategorijaID) {
        this.potkategorijaID = potkategorijaID;
    }

    public int getKategorijaID() {
        return kategorijaID;
    }

    public void setKategorijaID(int kategorijaID) {
        this.kategorijaID = kategorijaID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    @Override
    public String toString() {
        return "Potkategorija{" + "potkategorijaID=" + potkategorijaID + ", kategorijaID=" + kategorijaID + ", naziv=" + naziv + '}';
    }
    
    
    
    
    
}
