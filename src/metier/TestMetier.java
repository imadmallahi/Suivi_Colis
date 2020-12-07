package metier;


import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.xml.bind.DatatypeConverter;

import models.Agent;
import models.Attente;
import models.Client;
import models.Colis;
import models.Commande;
import models.Distributeur;
import models.InformationCommandeWithAgentAndAdherent;
import models.Reclamation;
import models.Superviser;

public class TestMetier {
	
	public static void main(String[] args) throws Exception, NoSuchPaddingException{
		
		IBesoin metier = new ImplMetier();
		//List<Superviser> listSuper = new ArrayList<Superviser>();
		Date date = new Date();
		String s=date.toString();
		System.out.println(s);
		System.out.println(java.time.LocalDate.now()+" ");
		/*//metier.addSuperviser(new Superviser("imad", "imad", "Khalid", "+312234","Casa",s));
		
		metier.addDistributeur(new Distributeur("SAid", "11222", "Fes", "ge", "Wed fes", "Fes", "Morocco", s,14,"f@h.com"));
		metier.addAgent(new Agent("SAid", "11222", "Fes", "ge", "Wed fes", "Fes", "Morocco", s,14,"f@h.com"));
		
		/*List<Attente> listAtt= new ArrayList<Attente>();
		listAtt=metier.getAllListAtt();	
		Distributeur d = metier.getToAffecter(1);

		System.out.println(d.toString());
		
		System.out.println(metier.getDestributeur(6).toString());

		System.out.println(d.toString());
		
		metier.getCommandeClient(1);
		
		

		Attente ab = new Attente("imad", "Imad", "TGHAT", "061234567", "wed fes", "FES", "MORROCO", s, 3, "imad@mellahi.com", "Agent");
		metier.addListAtt(ab);
		
		Client c = metier.getClient("imad");
		System.out.println(c.toString());

		List<Agent> agences = metier.getAllAgence();
		for (Agent agent : agences) {
			
			System.out.println(agent.getLat_agence()+" , "+agent.getLong_agence()+"\n");
			
		}

		
		Attente a =metier.getAtt(10);			
		System.out.println(a.toString());

		List<String> listPays = metier.getAllPaysOfAgent();
		for (String string : listPays) {
			System.out.println(string);
		}
		List<String> ListPays = metier.getAllPaysOfAgent();
		List<Agent> agences= new ArrayList<Agent>();
		agences=metier.getAllAgence();			
		for (Agent agent : agences) {
			System.out.println(agent.toString());
		}
		
		Distributeur d = metier.getDistributeur("imad");
		System.out.println(d);
		metier.addIdDistributeurOfCommande(17, 2);
		metier.modifEtatCommande(17, "en route");
		
		List<Commande> listCommande = metier.getAllCommandeEntrer(2,"en route");
		for (Commande commande : listCommande) {
			System.out.println(commande.toString());
		}
		List<Commande> listeCommande = metier.getCommandeOfDistributeur("effectue",1);
		for (Commande commande : listeCommande) {
			System.out.println(commande.toString());
		}
		
		List<String> Lville = metier.getAllCitySuperviseur();
		for (String client : Lville) {
			System.out.println(client.toString());
		}
		List<String> ListPays = metier.getAllPaysOfAgent();
		for (String string : ListPays) {
			System.out.println(string.toString());
		}
		
			///Admin
	public ArrayList<Colis> getAllColis();
	public ArrayList<Commande> getAllCommande();
	public List<Distributeur> getAllDestributeur();
	public List<Client> getAllClient();
	public List<Superviser> getAllSupervser();

		 
		
		ArrayList<Colis> list = metier.getAllColis();
		for (Colis colis : list) {
			System.out.println(colis.toString());
		}
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommande = new ArrayList<>();				
		listeCommande = metier.getCommandeOfDistributeur("en attente", 1);
		for (InformationCommandeWithAgentAndAdherent informationCommandeWithAgentAndAdherent : listeCommande) {
		 System.out.println(informationCommandeWithAgentAndAdherent.getAgent().toString());
		}
		
		
		InputStream in =null ;
		
			try {
				in=new BufferedInputStream(new FileInputStream("WebContent/assetss/img/default.png"));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		*/
		Client c2= metier.getClient(15);
		System.out.println(c2.toString());
		
		
		
	
		
		
		

		
		
		
		
	}

}
