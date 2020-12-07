package models;

public class Colis {
	
	private String nature ; 
	private String poids; 
	private int id; 
	private int id_commande; 
	
	
	@Override
	public String toString() {
		return "Colis [nature=" + nature + ", poids=" + poids + ", id=" + id + ", id_commande=" + id_commande + "]";
	}
	

	public int getId_commande() {
		return id_commande;
	}
	public void setId_commande(int id_commande) {
		this.id_commande = id_commande;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getPoids() {
		return poids;
	}
	public void setPoids(String poids) {
		this.poids = poids;
	}

	public Colis(String nature, String poids, String pointsDepart, String pointDestination, String codeSuivi,
			String etat) {
		super();
		this.nature = nature;
		this.poids = poids;

	}
	public Colis() {
		super();
	} 
	
	

}
