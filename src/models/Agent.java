package models;

import java.io.InputStream;
import java.io.Serializable;

public class Agent implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	private int idS;
	private String nom;
	private String password;
	private String adresse;
	private String Ntele;
	private String zone;
	private String ville;
	private  String pays;	
	private String dateInsc;
	private int idSuperviseur;
	private String email;
	private double lat_agence;
	private double long_agence;
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

	
	
	public Agent( String nom, String password, String adresse, String ntele, String zone, String ville,
			String pays, String dateInsc, int idSuperviseur, String email, double lat_agence, double long_agence, InputStream photo) {
		super();
		this.nom = nom;
		this.password = password;
		this.adresse = adresse;
		Ntele = ntele;
		this.zone = zone;
		this.ville = ville;
		this.pays = pays;
		this.dateInsc = dateInsc;
		this.idSuperviseur = idSuperviseur;
		this.email = email;
		this.lat_agence = lat_agence;
		this.long_agence = long_agence;
		this.photo = photo;
	}


	public double getLat_agence() {
		return lat_agence;
	}


	public void setLat_agence(double lat_agence) {
		this.lat_agence = lat_agence;
	}


	public double getLong_agence() {
		return long_agence;
	}


	public void setLong_agence(double long_agence) {
		this.long_agence = long_agence;
	}


	public Agent() {
		super();
		// TODO Auto-generated constructor stub
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
		return pays;
	}


	public void setPaye(String paye) {
		this.pays = paye;
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



	public Agent(String nom, String password, String adresse, String ntele, String zone, String ville, String paye,
			String dateInsc, int idSuperviseur) {
		    super();
	}
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "Agent [idS=" + idS + ", nom=" + nom + ", password=" + password + ", adresse=" + adresse + ", Ntele="
				+ Ntele + ", zone=" + zone + ", ville=" + ville + ", pays=" + pays + ", dateInsc=" + dateInsc
				+ ", idSuperviseur=" + idSuperviseur + ", email=" + email + ", lat_agence=" + lat_agence
				+ ", long_agence=" + long_agence + ", photo=" + photo + ", base64Image=" + base64Image + "]";
	}

	public Agent(String nom, String password, String adresse, String ntele, String zone, String ville, String pays,
			String dateInsc, int idSuperviseur, String email) {
		super();

		this.nom = nom;
		this.password = password;
		this.adresse = adresse;
		Ntele = ntele;
		this.zone = zone;
		this.ville = ville;
		this.pays = pays;
		this.dateInsc = dateInsc;
		this.idSuperviseur = idSuperviseur;
		this.email = email;
	}


	
	
}
