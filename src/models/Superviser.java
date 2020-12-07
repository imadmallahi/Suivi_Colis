package models;

import java.io.InputStream;
import java.io.Serializable;



public class Superviser implements Serializable {
	
	private int idS;
	private String nom;
	private String password;
	private String adresse;
	private String Ntele;
	private String ville;
	private String dateInsc;
	private String email;
	private String country;
	private InputStream photo;
	//zone
	

	private static final long serialVersionUID = 1L;
	
	
	 private String base64Image;
     
	    public String getBase64Image() {
	        return base64Image;
	    }
	 
	    public void setBase64Image(String base64Image) {
	        this.base64Image = base64Image;
	    }



	


	public Superviser() {
		super();
		// TODO Auto-generated constructor stub
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}






	




	@Override
	public String toString() {
		return "Superviser [idS=" + idS + ", nom=" + nom + ", password=" + password + ", adresse=" + adresse
				+ ", Ntele=" + Ntele + ", ville=" + ville + ", dateInsc=" + dateInsc + ", email=" + email + ", country="
				+ country + ", photo=" + photo + "]";
	}





	public Superviser(String nom, String password, String adresse, String ntele, String ville, String dateInsc,
			String email, String country, InputStream photo) {
		super();
		this.nom = nom;
		this.password = password;
		this.adresse = adresse;
		Ntele = ntele;
		this.ville = ville;
		this.dateInsc = dateInsc;
		this.email = email;
		this.country = country;
		this.photo = photo;
	}





	public int getIdS() {
		return idS;
	}




	public void setIdS(int idS) {
		this.idS = idS;
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




	public String getDateInsc() {
		return dateInsc;
	}




	public void setDateInsc(String dateInsc) {
		this.dateInsc = dateInsc;
	}





	public InputStream getPhoto() {
		return photo;
	}





	public void setPhoto(InputStream photo) {
		this.photo = photo;
	}





	public String getCountry() {
		return country;
	}





	public void setCountry(String country) {
		this.country = country;
	}
	
	

}
