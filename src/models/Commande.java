package models;

public class Commande {
	private int id;
	private String numAgent;
	private String numAdherent;
	private String totalCommande;
	private int idSuperviseur;
	private int idDistributeur;
	private String etat;
	private int idAgentDistination;
	private String point_destination;
	private String point_depart_commande;
	private String emplacement;
	private String nom_prenom_destinataire;
	private String cin_destinataire;
	private String num_telephone_destinataire;
	private String monnaie_total_commande;
	private String date_creation; 

	public String getDate_creation() {
		return date_creation;
	}

	public void setDate_creation(String date_creation) {
		this.date_creation = date_creation;
	}

	public String getMonnaie_total_commande() {
		return monnaie_total_commande;
	}

	public void setMonnaie_total_commande(String monnaie_total_commande) {
		this.monnaie_total_commande = monnaie_total_commande;
	}

	public String getNom_prenom_destinataire() {
		return nom_prenom_destinataire;
	}

	public void setNom_prenom_destinataire(String nom_prenom_destinataire) {
		this.nom_prenom_destinataire = nom_prenom_destinataire;
	}

	public String getCin_destinataire() {
		return cin_destinataire;
	}

	public void setCin_destinataire(String cin_destinataire) {
		this.cin_destinataire = cin_destinataire;
	}

	public String getNum_telephone_destinataire() {
		return num_telephone_destinataire;
	}

	public void setNum_telephone_destinataire(String num_telephone_destinataire) {
		this.num_telephone_destinataire = num_telephone_destinataire;
	}

	public String getEmplacement() {
		return emplacement;
	}

	public void setEmplacement(String emplacement) {
		this.emplacement = emplacement;
	}

	public String getPoint_depart_commande() {
		return point_depart_commande;
	}

	public void setPoint_depart_commande(String point_depart_commande) {
		this.point_depart_commande = point_depart_commande;
	}

	public String getPoint_destination() {
		return point_destination;
	}

	public void setPoint_destination(String point_destination) {
		this.point_destination = point_destination;
	}

	public int getIdSuperviseur() {
		return idSuperviseur;
	}

	public void setIdSuperviseur(int idSuperviseur) {
		this.idSuperviseur = idSuperviseur;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Commande(int id) {
		super();
		this.id = id;
	}

	public Commande(String numAgent, String numAdherent, String totalCommande) {
		super();
		this.numAgent = numAgent;
		this.numAdherent = numAdherent;
		this.totalCommande = totalCommande;
	}

	public Commande() {
		super();
	}

	public String getNumAgent() {
		return numAgent;
	}

	public void setNumAgent(String numAgent) {
		this.numAgent = numAgent;
	}

	public String getNumAdherent() {
		return numAdherent;
	}

	public void setNumAdherent(String numAdherent) {
		this.numAdherent = numAdherent;
	}

	public String getTotalCommande() {
		return totalCommande;
	}

	@Override
	public String toString() {
		return "Commande [id=" + id + ", numAgent=" + numAgent + ", numAdherent=" + numAdherent + ", totalCommande="
				+ totalCommande + ", idSuperviseur=" + idSuperviseur + ", idDistributeur=" + idDistributeur + ", etat="
				+ etat + ", idAgentDistination=" + idAgentDistination + "]";
	}

	public void setTotalCommande(String totalCommande) {
		this.totalCommande = totalCommande;
	}

	public int getIdDistributeur() {
		return idDistributeur;
	}

	public void setIdDistributeur(int idDistributeur) {
		this.idDistributeur = idDistributeur;
	}

	public int getIdAgentDistination() {
		return idAgentDistination;
	}

	public void setIdAgentDistination(int idAgentDistination) {
		this.idAgentDistination = idAgentDistination;
	}

}