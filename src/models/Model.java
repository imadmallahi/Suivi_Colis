package models;

public class Model {
	//pour Authentification 
	
	private Superviser superviseur ;
	private Agent agent;
	private Distributeur distributeur;
	private Client client;

	
	
	

	public Superviser getSuperviseur() {
		return superviseur;
	}






	public void setSuperviseur(Superviser superviseur) {
		this.superviseur = superviseur;
	}






	public Agent getAgent() {
		return agent;
	}






	public void setAgent(Agent agent) {
		this.agent = agent;
	}






	public Distributeur getDistributeur() {
		return distributeur;
	}






	public void setDistributeur(Distributeur distributeur) {
		this.distributeur = distributeur;
	}






	public Model() {
		// TODO Auto-generated constructor stub
	}






	public Client getClient() {
		return client;
	}






	public void setClient(Client client) {
		this.client = client;
	}

}
