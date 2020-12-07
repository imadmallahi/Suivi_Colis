package metier;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Agent;
import models.Attente;
import models.Client;
import models.Colis;
import models.Commande;
import models.Distributeur;
import models.InformationCommandeWithAgentAndAdherent;
import models.Reclamation;
import models.Superviser;

public interface IBesoin {

	// user case pour superviseur
	public void addSuperviser(Superviser s);
	public Superviser getSupervser(String user) ;
	public Superviser getSupervserCity(String city);
	public Superviser getSupervser(int user);
	public void removeSuperviser(int id);
	public List<String> getAllCitySuperviseur(); // pour combox
	public void updateSuperviseur(Superviser sup);

	// user caes pour agents
	public void addAgent(Agent s);
	public Agent getAgent(int id);
	public List<Agent> getAllAgent();
	public List<Agent> getAllAgent(int idS);// le surcharge des agents de meme
											// superviseur
	public void updateAgent(int id,Agent agent);
	public void removeAgent(int id);	
	public Agent getAgentByUserName(String username); 	
	public ArrayList<Commande> getCommandeByEtat(String etat, int num_agent);
	// user case pour Distributeur
	public void addDistributeur(Distributeur s);
	public Distributeur getDestributeur(int id);
	public Distributeur getDistributeur(String user);
	public List<Distributeur> getAllDestributeur(int idS);// le surcharge des
															// Distributeur de
															// meme superviseur
	public void removeDestributeur(int id);

	// user case pour  Liste d'attend
	public String addListAtt(Attente a);
	public List<Attente> getListAtt(int id);
	public Attente getAtt(int id);
	public List<String> getAllPays();
	public List<Attente> getListAttRole(String role); //get All list d'att with même role
	public Attente getToAffecter(int id);
	public List<Attente> getAllListAtt();
	public List<Attente> getAllListAttVille(String ville);// get les liste d'att
															// d'une meme ville
	public void removeListAtt(int id);
	
	

	// commande
	public void addNewCommande(Commande commande);
	public ArrayList<InformationCommandeWithAgentAndAdherent> getAllCommandeEntrer(int idDistination,String etat);
	public ArrayList<InformationCommandeWithAgentAndAdherent> getAllCommandeEntrer(int idDistination); 
	public ArrayList<InformationCommandeWithAgentAndAdherent> getAllCommandeEntrer(); 
	public ArrayList<Commande> getCommandeOfSuperviseur(String etat,int idSuperv);
	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeOfAgent(String etat,int id_agent);
	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeOfAgent(int id_agent);
	public ArrayList<Commande> getCommandeOfAgentEntrer(String etat,int id_agent);
	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeOfDistributeur(String etat,int idSuperviseur);

	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeATTorEFFOfDistributeur(String etat,int idD);

	public ArrayList<Commande> getCommandeOfClient(String etat,int idClient);	 
	public void modifEtatCommande(int idCommande,String etat);
	public void addIdDistributeurOfCommande(int idCommande,int idDistr);
	public InformationCommandeWithAgentAndAdherent getCommandeById(int Id);
	public void updateCommande(Commande commande);
	public void deleteCommande(int id);
	


	// colis
	public void addNewColis(Colis colis);
	public ArrayList<Colis> getColisByCommandeId(int id);
	public void updateColis(Colis colis);
	public Colis getColisById(int id);
	public void deleteColis(int idCommandeTraitement);	
	public ArrayList<Colis> getColisForAgent(int id_agent); 

	
	//client
	public String addClient(Client c);
	public Client getClient(String nom);
	public Client getClient(int id);
	public void updateClient(Client client); 
	
	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeClient(int idC);
	public Colis getColisByCodeSuivi(String code); 
	
	///agence maps
	public List<Agent> getAllAgence();
	
	
	///Admin
	public ArrayList<Colis> getAllColis();
	public ArrayList<Commande> getAllCommande();
	public List<Distributeur> getAllDestributeur();
	public List<Client> getAllClient();
	public List<Superviser> getAllSupervser();
	
	//distributeur ;; 
	public void updateDistributeur(Distributeur distributeur); 
	
	public String getEtatCommandeByIdCommande(int idCommande, int idClient); 
	
	//reclamation; 
	public void envoyerReclamation(String reclamation, String id_client); 
	public List<Reclamation> getAllReclamation(); 
	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeATTorEFFOfDistributeurAtt(String etat,int idD) ;
	String getEtatCommandeByIdCommande(int idCommande);
	public Client getClientEmail(String email);
	Distributeur getDistributeurEmail(String email);
	public Agent getAgentEmail(String id);
	public void UpDatePasswordAgent(int id,String NewPassword);
	public void UpDatePasswordDistributeur(int id,String NewPassword);
	public void UpDatePasswordClient(int id,String NewPassword);
	public Agent getAgentByUserNameTele(String tele);
	public Superviser getSupervserTele(String tele);
	public Distributeur getDistributeurTele(String tele);
	public Client getClientTele(String tele);
	public boolean verificationExistanceClient(int id);
	public void deleteReclamation(int id);

	

}
