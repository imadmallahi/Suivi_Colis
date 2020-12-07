package models;

import java.io.InputStream;
import java.io.Serializable;

public class Distributeur  implements Serializable{
	
	private int idD;
	private String nom;
	private String password;
	private String adresse;
	private String Ntele;
	private String zone;
	private String ville;
	private String paye;
	private String dateInsc;
	private int idSuperviseur;
	private String email;
	private InputStream photo;
	private String base64Image;
	
	 public String getBase64Image() {
	        return base64Image;
	    }
	 
	 public void setBase64Image(String base64Image) {
	        this.base64Image = base64Image;
	    }
  public InputStream getPhoto() {
			return photo;
		}

	public void setPhoto(InputStream photo) {
			this.photo = photo;
		}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	

	@Override
	public String toString() {
		return "Distributeur [idD=" + idD + ", nom=" + nom + ", password=" + password + ", adresse=" + adresse
				+ ", Ntele=" + Ntele + ", zone=" + zone + ", ville=" + ville + ", paye=" + paye + ", dateInsc="
				+ dateInsc + ", idSuperviseur=" + idSuperviseur + ", email=" + email + "]";
	}

	public Distributeur(String nom, String password, String adresse, String ntele, String zone, String ville,
			String paye, String dateInsc, int idSuperviseur, String email, InputStream photo) {
		super();
		this.nom = nom;
		this.password = password;
		this.adresse = adresse;
		Ntele = ntele;
		this.zone = zone;
		this.ville = ville;
		this.paye = paye;
		this.dateInsc = dateInsc;
		this.idSuperviseur = idSuperviseur;
		this.email = email;
		this.photo = photo;
	}

	public int getIdD() {
		return idD;
	}

	public void setIdD(int idD) {
		this.idD = idD;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getNtele() {
		return Ntele;
	}

	public void setNtele(String ntele) {
		Ntele = ntele;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getPaye() {
		return paye;
	}

	public void setPaye(String paye) {
		this.paye = paye;
	}

	public String getDateInsc() {
		return dateInsc;
	}

	public void setDateInsc(String dateInsc) {
		this.dateInsc = dateInsc;
	}

	public int getIdSuperviseur() {
		return idSuperviseur;
	}

	public void setIdSuperviseur(int idSuperviseur) {
		this.idSuperviseur = idSuperviseur;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Distributeur() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
