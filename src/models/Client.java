package models;

import java.io.InputStream;
import java.io.Serializable;

public class Client implements Serializable {
	private int idC;
	private String nom;
	private String password;
	private String adresse;
	private String Ntele;
	private String ville;
	private String pays;
	private String dateInsc;
	private String email;
	private InputStream photo;
	private String base64Image;
	//zone
	

	private static final long serialVersionUID = 1L;
	
	
	public Client( String nom, String password, String adresse, String ntele, String ville, String pays,
			String dateInsc, String email, InputStream photo) {
		super();
		
		this.nom = nom;
		this.password = password;
		this.adresse = adresse;
		Ntele = ntele;
		this.ville = ville;
		this.pays = pays;
		this.dateInsc = dateInsc;
		this.email = email;
		this.photo = photo;
	}

	public Client() {
		super();
	}

	public int getIdC() {
		return idC;
	}

	public void setIdC(int idC) {
		this.idC = idC;
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

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public String getDateInsc() {
		return dateInsc;
	}

	public void setDateInsc(String dateInsc) {
		this.dateInsc = dateInsc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
 
     
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

	

	@Override
	public String toString() {
		return "Client [idC=" + idC + ", nom=" + nom + ", password=" + password + ", adresse=" + adresse + ", Ntele="
				+ Ntele + ", ville=" + ville + ", pays=" + pays + ", dateInsc=" + dateInsc + ", email=" + email + "]";
	}
	
	
	
	
}
