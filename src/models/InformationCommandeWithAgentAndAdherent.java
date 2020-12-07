package models;

public class InformationCommandeWithAgentAndAdherent {
	private Agent agent;
	private Client client;
	private Commande commande;
	private String nomSuperviseur;
	private String zoneAgenceDestination; 

	public String getZoneAgenceDestination() {
		return zoneAgenceDestination;
	}

	@Override
	public String toString() {
		return "InformationCommandeWithAgentAndAdherent [agent=" + agent + ", client=" + client + ", commande="
				+ commande + ", nomSuperviseur=" + nomSuperviseur + ", zoneAgenceDestination=" + zoneAgenceDestination
				+ "]";
	}

	public void setZoneAgenceDestination(String zoneAgenceDestination) {
		this.zoneAgenceDestination = zoneAgenceDestination;
	}

	public InformationCommandeWithAgentAndAdherent(Agent agent, Client client, Commande commande, String nomSuperviseur,
			String zoneAgenceDestination) {
		super();
		this.agent = agent;
		this.client = client;
		this.commande = commande;
		this.nomSuperviseur = nomSuperviseur;
		this.zoneAgenceDestination = zoneAgenceDestination;
	}

	public String getNomSuperviseur() {
		return nomSuperviseur;
	}

	public void setNomSuperviseur(String nomSuperviseur) {
		this.nomSuperviseur = nomSuperviseur;
	}

	public InformationCommandeWithAgentAndAdherent(Agent agent, Client client, Commande commande) {
		super();
		this.agent = agent;
		this.client = client;
		this.commande = commande;
	}
	public InformationCommandeWithAgentAndAdherent(Agent agent, Client client, Commande commande,String nomSuperviseur) {
		super();
		this.agent = agent;
		this.client = client;
		this.commande = commande;
		this.nomSuperviseur = nomSuperviseur; 
	}
	
	public Agent getAgent() {
		return agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Commande getCommande() {
		return commande;
	}

	public void setCommande(Commande commande) {
		this.commande = commande;
	}

}
