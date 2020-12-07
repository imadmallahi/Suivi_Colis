package web;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import email.send_email_gmail;
import metier.IBesoin;
import metier.ImplMetier;
import models.Agent;
import models.Attente;
import models.Client;
import models.Colis;
import models.Commande;
import models.Distributeur;
import models.InformationCommandeWithAgentAndAdherent;
import models.Reclamation;
import models.Superviser;

@WebServlet("/Servlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 4, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class Servlet extends HttpServlet {
	private static final String VISITEUR = "visiteur";
	private static final String CLIENT = "client";
	private static final String DISTRIBUTEUR = "distributeur";
	private static final String SUPERVISEUR = "superviseur";
	private static final String AGENT = "agent";
	private static final String ADMIN = "admin";
	private static final String TYPE_ACCOUNT = "type_account";
	private IBesoin metier;
	private Commande commande;
	private Colis colis;
	private String NomCompte;
	private HttpSession sessionAgent;
	private Agent agent;
	private static String lang;
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
		metier = new ImplMetier();
		commande = new Commande();
		colis = new Colis();
		agent = new Agent();
		NomCompte = new String(" ");
		lang = "en";
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		sessionAgent = request.getSession();
		String action = request.getParameter("action");
		request.setCharacterEncoding("UTF-8");
		
		if (lang == null) {
			lang = "en";
			System.out.println(lang);
		}
		if (sessionAgent == null) {
			sessionAgent = request.getSession();
			sessionAgent.setAttribute("lang", lang);
			sessionAgent.setAttribute(TYPE_ACCOUNT, VISITEUR);
		}
		request.setAttribute("NomCompte", NomCompte);
		try {
			if (action != null) {
				if (action.equals("changeLang")) {
					lang = request.getParameter("lang");
					sessionAgent.setAttribute("lang", lang);
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);

				} else if (action.equals("changeLangq")) {
					lang = request.getParameter("lang");
					sessionAgent.setAttribute("lang", lang);
					request.getRequestDispatcher("Question.jsp").forward(request, response);
				} else if (action.equals("Admin")) {
					request.getRequestDispatcher("partieAdmin.jsp").forward(request, response);

			
			} else if (action.equals("sup")) {
				request.getRequestDispatcher("partieSuperviseur.jsp").forward(request, response);

		}else if (action.equals("changelangt")) {
					lang = request.getParameter("lang");
					sessionAgent.setAttribute("lang", lang);
					request.getRequestDispatcher("Track.jsp").forward(request, response);
				} else if (action.equals("ajouterAtt")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						int id = Integer.parseInt(request.getParameter("ip"));
						Attente d = metier.getToAffecter(id);
						String text = "Hi Mr " + d.getRole()
								+ "\n You have accepted with us . \n Your account is : \n \n  Username : " + d.getNtele()
								+ " \n Password : " + d.getPassword()
								+ "\n \n Thank you for using our service Yaqout .\n service Yaqout ( www.yaqout.com ) .  ";
						if (d.getRole().equals("Agent")) {
							metier.addAgent(new Agent(d.getNom(), d.getPassword(), d.getAdresse(), d.getNtele(),
									d.getZone(), d.getVille(), d.getPaye(), d.getDateInsc(), d.getIdSuperviseur(),
									d.getEmail(), d.getLat_agence(), d.getLong_agence(), d.getPhoto()));
						} else if (d.getRole().toLowerCase().equals(DISTRIBUTEUR)) {
							metier.addDistributeur(new Distributeur(d.getNom(), d.getPassword(), d.getAdresse(),
									d.getNtele(), d.getZone(), d.getVille(), d.getPaye(), d.getDateInsc(),
									d.getIdSuperviseur(), d.getEmail(), d.getPhoto()));
						} else {
							metier.addClient(new Client(d.getNom(), d.getPassword(), d.getAdresse(), d.getNtele(),
									d.getVille(), d.getPaye(), d.getDateInsc(), d.getEmail(), d.getPhoto()));
						}
						try {
							new send_email_gmail(d.getEmail(), "Yaqout", text);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						metier.removeListAtt(id);
						request.setAttribute("active3", "active");
						if (d.getRole().equals("Agent")) {
							List<Agent> agents = new ArrayList<Agent>();
							if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
								agents = metier.getAllAgent();
							} else {
								agents = metier.getAllAgent((int)sessionAgent.getAttribute("id_superviseur"));
							}
							request.setAttribute("agents", agents);
							request.getRequestDispatcher("Listes/ListAgents.jsp").forward(request, response);
						} else if (d.getRole().toLowerCase().equals(DISTRIBUTEUR)) {
							List<Distributeur> dis = new ArrayList<Distributeur>();
							if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
								dis = metier.getAllDestributeur();
							} else {
								dis = metier.getAllDestributeur((int)sessionAgent.getAttribute("id_superviseur"));
							}
							request.setAttribute("listDistributeur", dis);
							request.getRequestDispatcher("Listes/ListDistributeur.jsp").forward(request, response);
						} else {
							request.setAttribute("active2", "active");
							request.setAttribute("listClient", metier.getAllClient());
							request.getRequestDispatcher("Listes/ListClient.jsp").forward(request, response);
						}
					} else {
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
					}
				} else if (action.equals("partieClient")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT))
						request.getRequestDispatcher("partieClient.jsp").forward(request, response);
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("Inscription")) {
					request.getRequestDispatcher("Inscriptions/Inscription.jsp").forward(request, response);
				} else if (action.equals("track")) {
					request.getRequestDispatcher("Track.jsp").forward(request, response);
				} else if (action.equals("forget")) {
					request.getRequestDispatcher("forgetClient.jsp").forward(request, response);
				} else if (action.equals("MapsAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)){
						List<Agent> agences = new ArrayList<Agent>();
						agences = metier.getAllAgence();
						request.setAttribute("agences", agences);
						request.setAttribute("active41", "active");
						request.getRequestDispatcher("ListeMapsAgent.jsp").forward(request, response);
					}
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
					
				} else if (action.equals("suivreCommande")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							)
						request.getRequestDispatcher("SuivreUneCommande.jsp").forward(request, response);
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				}else if (action.equals("deleteReclamation")) {
					System.out.println(sessionAgent.getAttribute(TYPE_ACCOUNT));
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)){
						System.out.println(1);
						int id = Integer.parseInt(request.getParameter("id"));
						System.out.println(2);
						metier.deleteReclamation(id);
						System.out.println(3);
						List<Reclamation> listReclamation = metier.getAllReclamation();
						request.setAttribute("listReclamation", listReclamation);
						request.getRequestDispatcher("ReclamationAdmin.jsp").forward(request, response);
					}						
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				}
				else if (action.equals("InscriptionClient")) {
					request.setAttribute("ListPays", metier.getAllPays());
					request.setAttribute("ListVille", metier.getAllCitySuperviseur());
					request.getRequestDispatcher("Inscriptions/InscriptionClient.jsp").forward(request, response);
				} else if (action.equals("InscriptionAgent")) {
					request.setAttribute("ListPays", metier.getAllPays());
					request.setAttribute("ListVille", metier.getAllCitySuperviseur());
					request.getRequestDispatcher("Inscriptions/InscriptionAgent.jsp").forward(request, response);
				} else if (action.equals("EspaceSuperviseur")) {
					request.getRequestDispatcher("Logins/LoginSuperviseur.jsp").forward(request, response);
				} else if (action.equals("EspaceAdmin")) {
					request.getRequestDispatcher("Logins/LoginAdmin.jsp").forward(request, response);
				} else if (action.equals("EspaceDistributeur")) {
					request.getRequestDispatcher("Logins/LoginDistributeur.jsp").forward(request, response);
				} else if (action.equals("EspaceAgent")) {
					request.getRequestDispatcher("Logins/LoginAgent.jsp").forward(request, response);
				} else if (action.equals("EspaceClient")) {
					request.getRequestDispatcher("Logins/LoginClient.jsp").forward(request, response);
				} else if (action.equals("Questions")) {
					request.getRequestDispatcher("Question.jsp").forward(request, response);
				} else if (action.equals("partieInscription")) {
					request.setAttribute("listPays", metier.getAllPays());
					request.getRequestDispatcher("Inscriptions/InscriptionAgent.jsp").forward(request, response);
				} else if (action.equals("InscriptionDistributeur")) {
					request.setAttribute("ListPays", metier.getAllPays());
					request.setAttribute("ListVille", metier.getAllCitySuperviseur());
					request.getRequestDispatcher("Inscriptions/InscriptionDistributeur.jsp").forward(request, response);
				} else if (action.equals("EspaceSuperviseur")) {
					request.getRequestDispatcher("Logins/LoginSuperviseur.jsp").forward(request, response);
				} else if (action.equals("homeAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT))
						request.getRequestDispatcher("AccueilAgent.jsp").forward(request, response);
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("homeClient")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT))
						request.getRequestDispatcher("partieClient.jsp").forward(request, response);
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("partieInscription")) {
					request.setAttribute("listPays", metier.getAllPays());
					request.getRequestDispatcher("Inscriptions/InscriptionAgent.jsp").forward(request, response);
				} else if (action.equals("commandeCreate")) {
					if ((sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT))) {
						request.setAttribute("listeAgent", metier.getAllAgent());
						request.setAttribute("listeCodeClient", metier.getAllClient());
						request.getRequestDispatcher("CommandeCreateFormular.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("CreateNewAgent")) {
					request.getRequestDispatcher("CreateNewAgent.jsp").forward(request, response);
				} else if (action.equals("reclamation_client")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT))
						request.getRequestDispatcher("ReclamationClient.jsp").forward(request, response);
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("reclamation_admin")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						List<Reclamation> listReclamation = metier.getAllReclamation();
						request.setAttribute("listReclamation", listReclamation);
						request.getRequestDispatcher("ReclamationAdmin.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("adduser")) {
					request.setAttribute("active7", "active");
					request.setAttribute("ListPays", metier.getAllPays());
					request.setAttribute("ListVille", metier.getAllCitySuperviseur());
					request.getRequestDispatcher("Inscriptions/AddSuperviseur.jsp").forward(request, response);
				} else if (action.equals("ListSuperviseur")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("ListSuperviseur", metier.getAllSupervser());
						request.setAttribute("active312", "active");
						request.getRequestDispatcher("Listes/ListSuperviseur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						List<Agent> agents = new ArrayList<Agent>();
						if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN))
							agents = metier.getAllAgent();
						else
							agents = metier
									.getAllAgent(Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + ""));
						request.setAttribute("agents", agents);
						request.setAttribute("active3", "active");
						request.getRequestDispatcher("Listes/ListAgents.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListAtt")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						List<Attente> ListAtt = new ArrayList<Attente>();
						if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN))
							ListAtt = metier.getAllListAtt();
						else
							ListAtt = metier
									.getListAtt(Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + ""));
						request.setAttribute("ListAtt", ListAtt);
						request.setAttribute("active5", "active");
						request.getRequestDispatcher("Listes/ListAtt.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListDistributeur")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						List<Distributeur> listDistributeur = new ArrayList<Distributeur>();
						if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN))
							listDistributeur = metier.getAllDestributeur();
						else
							listDistributeur = metier.getAllDestributeur(
									Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + ""));
						request.setAttribute("listDistributeur", listDistributeur);
						request.setAttribute("active4", "active");
						request.getRequestDispatcher("Listes/ListDistributeur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListeCommande")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande", metier.getAllCommandeEntrer());
						request.getRequestDispatcher("Listes/ListCommandeEntrer.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListClient")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listClient", metier.getAllClient());
						request.getRequestDispatcher("Listes/ListClient.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if(action.equals("verificationClient")){
					System.out.println("ajax parfait  avant"+ sessionAgent.getAttribute(TYPE_ACCOUNT));
					boolean resultat_test = metier.verificationExistanceClient(Integer.parseInt(request.getParameter("idClient"))); 
					 response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
					 response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
					 if(resultat_test) response.getWriter().write("success");
					 else response.getWriter().write("error");
					System.out.println("ajax parfait  "+ sessionAgent.getAttribute(TYPE_ACCOUNT));
				}else if (action.equals("ListeCommandeForAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande",
								metier.getCommandeOfAgent("en attente", (int) (sessionAgent.getAttribute("id_agent"))));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("LisCommandeEnRoute")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande",
								metier.getCommandeOfAgent("en route", (int) (sessionAgent.getAttribute("id_agent"))));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("LisCommandeEffectuee")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande",
								metier.getCommandeOfAgent("effectue", (int) (sessionAgent.getAttribute("id_agent"))));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("LisCommandeAllInAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande",
								metier.getCommandeOfAgent((int) (sessionAgent.getAttribute("id_agent"))));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListeColisForAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listColis",
								metier.getColisForAgent((int) (sessionAgent.getAttribute("id_agent"))));
						request.getRequestDispatcher("Listes/ListColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ReadCommande")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						int idCommandeTraitement = Integer.parseInt(request.getParameter("id"));
						
						System.out.println(idCommandeTraitement+"ùùùùùùùùùùùùù");
						request.setAttribute("informationCommandeWithAgentAndAdherent",	metier.getCommandeById(idCommandeTraitement));
						request.setAttribute("listeColis", metier.getColisByCommandeId(idCommandeTraitement));
						request.getRequestDispatcher("Profils/profilCommande.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("UpdateCommande")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
						int idCommandeTraitement = Integer.parseInt(request.getParameter("id"));
						request.setAttribute("informationCommandeWithAgentAndAdherent",
								metier.getCommandeById(idCommandeTraitement));
						request.setAttribute("listeColis", metier.getColisByCommandeId(idCommandeTraitement));
						request.setAttribute("listeAgent", metier.getAllAgent());
						request.getRequestDispatcher("UpdateCommande.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("DeleteCommande")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						metier.deleteCommande(Integer.parseInt(request.getParameter("id")));
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("supprimierAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR))
						metier.removeAgent(Integer.parseInt(request.getParameter("ip")));
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("personAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						request.setAttribute("p", metier.getAgent(Integer.parseInt(request.getParameter("ip"))));
						request.getRequestDispatcher("Profils/profilAgent.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("personClient")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						request.setAttribute("p", metier.getClient(Integer.parseInt(request.getParameter("ip"))));
						request.getRequestDispatcher("Profils/profilClient.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("profilAtt")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("p", metier.getAtt(Integer.parseInt(request.getParameter("ip"))));
						request.getRequestDispatcher("Profils/profilListAtt.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("personDistributeur")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						request.setAttribute("p",
								metier.getDestributeur((int) sessionAgent.getAttribute("idDistributeur")));
						request.getRequestDispatcher("Profils/profilDistributeur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("updateProfileDistributeur")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("p",
								metier.getDestributeur((int) sessionAgent.getAttribute("idDistributeur")));
						request.getRequestDispatcher("Updates/UpdateprofilDistributeur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("personDistributeurV")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						request.setAttribute("p", metier.getDestributeur(Integer.parseInt(request.getParameter("ip"))));
						request.getRequestDispatcher("Profils/profilAgent.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("profilUser")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						request.setAttribute("p", metier
								.getSupervser(Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + "")));
						request.setAttribute("active21", "active");
						request.getRequestDispatcher("Profils/profilSuperviseur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("updateProfileClient")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
						request.setAttribute(CLIENT, metier.getClient((int) sessionAgent.getAttribute("idClient")));
						request.setAttribute("active2", "active");
						request.getRequestDispatcher("Updates/UpdateProfileClient.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("updateProfileSup")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("sup", metier.getSupervser(Integer.parseInt(request.getParameter("id"))));
						request.getRequestDispatcher("Updates/UpdateSuperviseur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListeColis")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("listColis", metier.getAllColis());
						request.getRequestDispatcher("Listes/ListColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ReadColis")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("colis",
								metier.getColisById(Integer.parseInt(request.getParameter("id"))));
						request.getRequestDispatcher("DetailsColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("UpdateColis")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						request.setAttribute("colis",
								metier.getColisById(Integer.parseInt(request.getParameter("id"))));
						request.setAttribute("listCommande", metier.getAllCommande());
						request.getRequestDispatcher("UpdateColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("prendreCommande")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						int idCommande = Integer.parseInt(request.getParameter("id"));
						metier.modifEtatCommande(idCommande, "en route");
						metier.addIdDistributeurOfCommande(idCommande,
								(int) sessionAgent.getAttribute("idDistributeur"));
						request.setAttribute("listCommande", metier.getCommandeOfDistributeur("en route",
								(int) sessionAgent.getAttribute("idDistributeur")));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("adduser")) {
					request.setAttribute("active7", "active");
					request.setAttribute("ListPays", metier.getAllPays());
					request.setAttribute("ListVille", metier.getAllCitySuperviseur());
					request.getRequestDispatcher("Inscriptions/AddSuperviseur.jsp").forward(request, response);
				} else if (action.equals("ListAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("agents",
								metier.getAllAgent(Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + "")));
						request.setAttribute("active3", "active");
						request.getRequestDispatcher("Listes/ListAgents.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListAtt")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("ListAtt",
								metier.getListAtt(Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + "")));
						request.setAttribute("active5", "active");
						request.getRequestDispatcher("Listes/ListAtt.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);

				} else if (action.equals("ListDistributeur")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						request.setAttribute("listDistributeur", metier.getAllDestributeur(
								Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + "")));
						request.setAttribute("active4", "active");
						request.getRequestDispatcher("Listes/ListDistributeur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("DeleteCommande")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
						metier.deleteCommande(Integer.parseInt(request.getParameter("id")));
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("supprimierAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR))
						metier.removeAgent(Integer.parseInt(request.getParameter("ip")));
					else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("personAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("p", metier.getAgent(Integer.parseInt(request.getParameter("ip"))));
						request.getRequestDispatcher("Profils/profilAgent.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("personSuperviseurV")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("p", metier.getSupervser(request.getParameter("ip")));
						request.setAttribute("active21", "active");
						request.getRequestDispatcher("Profils/profilSuperviseur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("profilAtt")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("p", metier.getAtt(Integer.parseInt(request.getParameter("ip"))));
						request.getRequestDispatcher("Profils/profilListAtt.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("personDistributeur")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("p", metier.getDestributeur(Integer.parseInt(request.getParameter("ip"))));
						request.getRequestDispatcher("Profils/profilAgent.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("profilUser")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						request.setAttribute("p", metier
								.getSupervser(Integer.parseInt(sessionAgent.getAttribute("id_superviseur") + "")));
						request.setAttribute("active21", "active");
						request.getRequestDispatcher("Profils/profilSuperviseur.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("profilClient")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
						request.setAttribute("p", metier.getClient((int) sessionAgent.getAttribute("idClient")));
						request.setAttribute("active2", "active");
						request.getRequestDispatcher("Profils/profilClient.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ListeColis")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("listColis", metier.getAllColis());
						request.getRequestDispatcher("Listes/ListColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("ReadColis")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("colis",
								metier.getColisById(Integer.parseInt(request.getParameter("id"))));
						request.getRequestDispatcher("DetailsColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("UpdateColis")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("colis",
								metier.getColisById(Integer.parseInt(request.getParameter("id"))));
						request.setAttribute("listCommande", metier.getAllCommande());
						request.getRequestDispatcher("UpdateColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("DeleteColis")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						metier.deleteColis(Integer.parseInt(request.getParameter("id")));
						request.setAttribute("listColis",
								metier.getColisForAgent((int) (sessionAgent.getAttribute("id_agent"))));
						request.getRequestDispatcher("Listes/ListColis.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("DeleteAtt")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
							|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
						int id = Integer.parseInt(request.getParameter("ip"));
						metier.removeListAtt(id);
						request.setAttribute("ListAtt", metier.getAllListAtt());
						request.getRequestDispatcher("Listes/ListAtt.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("accueilAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.getRequestDispatcher("AccueilAgent.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("listCommandeClient")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
						request.setAttribute("listCommande",
								metier.getCommandeClient((int) sessionAgent.getAttribute("idClient")));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("deconnecter")) {
					String lang = (String) sessionAgent.getAttribute("lang");
					sessionAgent.invalidate();
					sessionAgent = null;
					sessionAgent = request.getSession();
					sessionAgent.setAttribute("lang", lang);
					sessionAgent.setAttribute(TYPE_ACCOUNT, VISITEUR);
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("profilAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute(AGENT, metier.getAgent((int) sessionAgent.getAttribute("id_agent")));
						request.getRequestDispatcher("Profils/ProfilAgentOfficial.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("updateProfileAgent")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute(AGENT, metier.getAgent((int) sessionAgent.getAttribute("id_agent")));
						request.getRequestDispatcher("Updates/UpdateAgent.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("BienRecu")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						metier.modifEtatCommande(Integer.parseInt(request.getParameter("id")), "effectue");
						request.setAttribute("listCommande",
								metier.getCommandeOfAgent("effectue", (int) sessionAgent.getAttribute("id_agent")));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("liste_commande_en_attente_enter")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande",
								metier.getAllCommandeEntrer((int) sessionAgent.getAttribute("id_agent"), "en route"));
						request.getRequestDispatcher("Listes/ListCommandeEntrer.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("liste_commande_effectuee_entrer")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande",
								metier.getAllCommandeEntrer((int) sessionAgent.getAttribute("id_agent"), "effectue"));
						request.getRequestDispatcher("Listes/ListCommandeEntrer.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("liste_all_commande_effectuee_entrer")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("listCommande",
								metier.getAllCommandeEntrer((int) sessionAgent.getAttribute("id_agent")));
						request.getRequestDispatcher("Listes/ListCommandeEntrer.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("liste_commande_en_routeD")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("listCommande", metier.getCommandeOfDistributeur("en route",
								(int) sessionAgent.getAttribute("id_superviseur")));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("liste_commande_en_attenteD")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("listCommande", metier.getCommandeATTorEFFOfDistributeurAtt("en attente",
								(int) sessionAgent.getAttribute("id_superviseur")));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else if (action.equals("liste_commande_effectueeD")) {
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
						request.setAttribute("listCommande", metier.getCommandeATTorEFFOfDistributeur("effectue",
								(int) sessionAgent.getAttribute("idDistributeur")));
						request.getRequestDispatcher("Listes/ListCommandeSortie.jsp").forward(request, response);
					} else
						request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				}
			} else {
				sessionAgent = request.getSession();
				sessionAgent.setAttribute("lang", lang);
				sessionAgent.setAttribute(TYPE_ACCOUNT, VISITEUR);
				request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			}
		} catch (Exception e) {
			sessionAgent = request.getSession();
			sessionAgent.setAttribute("lang", lang);
			sessionAgent.setAttribute(TYPE_ACCOUNT, VISITEUR);
			request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		sessionAgent =request.getSession();
		String action = request.getParameter("action");
		System.out.println(action);
		request.setAttribute("NomCompte", NomCompte);
		request.setCharacterEncoding("UTF-8");
		if (lang == null) {
			lang = "en";
			System.out.println(lang);
		}
		if (sessionAgent == null) {
			sessionAgent = request.getSession();
			sessionAgent.setAttribute("lang", lang);
			sessionAgent.setAttribute(TYPE_ACCOUNT, VISITEUR);
		}
		if (action == null) {
			sessionAgent = request.getSession();
			sessionAgent.setAttribute("lang", lang);
			sessionAgent.setAttribute(TYPE_ACCOUNT, VISITEUR);
			request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
		} else {
			if (action.equals("Ajouter superviseur")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					Superviser s = null;
					InputStream in = (request.getPart("profil")).getInputStream();
					String date = java.time.LocalDate.now() + " ";
					String name = request.getParameter("nom");
					String adress = request.getParameter("adress");
					String city = request.getParameter("ville");
					String password = request.getParameter("password");
					String country = request.getParameter("country");
					System.out.println("======" + password);
					String phone = request.getParameter("tel");
					String email = request.getParameter("email");
					s = new Superviser(name, password, adress, phone, city, date, email, country, in);
					System.out.println(s.toString());
					request.setAttribute("active7", "active");
					metier.addSuperviser(s);
					request.getRequestDispatcher("Inscriptions/AddSuperviseur.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("addNewAgent")) {
				agent = new Agent();
				System.out.println(request.getCharacterEncoding());
				agent.setAdresse(request.getParameter("adresse_agent"));
				agent.setEmail(request.getParameter("email_agent"));
				agent.setDateInsc(request.getParameter("date_inscription_agent"));
				agent.setIdSuperviseur(1);// prendre le numero dmn la session
				agent.setNom(request.getParameter("name_agent"));
				agent.setNtele(request.getParameter("num_tele_agent"));
				agent.setPassword(request.getParameter("password"));
				agent.setPaye(request.getParameter("pays_agent"));
				agent.setZone(request.getParameter("zone_agent"));
				agent.setVille(request.getParameter("ville_agent"));
				metier.addAgent(agent);
				request.getRequestDispatcher("partieSuperviseur.jsp").forward(request, response);
			} else if (action.equals("ConnecterAgent")) {
				Agent agent = null;

				String nom = request.getParameter("username");
				String password = request.getParameter("password");
				System.out.println(nom+password);
				agent = metier.getAgentByUserNameTele(nom);
				System.out.println(agent.toString());
				try {
					if (agent.getNtele().equals(nom) && agent.getPassword().equals(password)) {
						NomCompte = agent.getNom();
						String lang = (String) sessionAgent.getAttribute("lang");
						sessionAgent.invalidate();
						sessionAgent = null;
						sessionAgent = request.getSession();
						sessionAgent.setAttribute("id_agent", agent.getIdS());
						sessionAgent.setAttribute("id_superviseur", agent.getIdSuperviseur());
						sessionAgent.setAttribute("name_account", agent.getNom());
						sessionAgent.setAttribute("zone_agent", agent.getZone());
						sessionAgent.setAttribute("lang", lang);
						sessionAgent.setAttribute("profil", agent.getBase64Image());

						sessionAgent.setAttribute(TYPE_ACCOUNT, AGENT);
						System.out.println(sessionAgent.getAttribute(TYPE_ACCOUNT));
						request.setAttribute("NomCompte", NomCompte);
						request.getRequestDispatcher("AccueilAgent.jsp").forward(request, response);
					} else {
						request.setAttribute("erreur", "Nom d'utilisateur ou mot de passe est invalide");
						request.getRequestDispatcher("Logins/LoginAgent.jsp").forward(request, response);
					}
				} catch (Exception e) {
					request.setAttribute("erreur", "Donnez-moi votre login et le mot de passe pour connecter ");
					request.getRequestDispatcher("Logins/LoginAgent.jsp").forward(request, response);
				}
			} else if (action.equals("ConnecterAdmin")) {
				String username = request.getParameter("username");
				String password = request.getParameter("password");

				try {
					if (username.equals("imad") && password.equals("0615223491")) {
						NomCompte = "Admin";
						String lang = (String) sessionAgent.getAttribute("lang");
						sessionAgent.invalidate();
						sessionAgent = null;
						sessionAgent = request.getSession();
						sessionAgent.setAttribute("lang", lang);
						sessionAgent.setAttribute("name_account", NomCompte);
						sessionAgent.setAttribute(TYPE_ACCOUNT, ADMIN);
						request.setAttribute("NomCompte", NomCompte);
						request.getRequestDispatcher("partieAdmin.jsp").forward(request, response);
					} else {
						request.setAttribute("erreur", "Nom d'utilisateur ou mot de passe est invalide");
						request.getRequestDispatcher("Logins/LoginAdmin.jsp").forward(request, response);
					}
				} catch (Exception e) {
					request.setAttribute("erreur", "Donnez-moi votre Logins/Login et le mot de passe pour connecter ");
					request.getRequestDispatcher("Logins/LoginAdmin.jsp").forward(request, response);
				}
			} else if (action.equals("ConnecterSuperviseur")) {
				Superviser superviseur = null;
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				superviseur = metier.getSupervserTele(username);
				System.out.println(username + password);

				System.out.println(superviseur.toString());
				try {
					if (superviseur.getNtele().equals(username) && superviseur.getPassword().equals(password)) {
						NomCompte = superviseur.getNom();
						String lang = (String) sessionAgent.getAttribute("lang");
						sessionAgent.invalidate();
						sessionAgent = null;
						sessionAgent = request.getSession();
						sessionAgent.setAttribute("lang", lang);
						sessionAgent.setAttribute("name_account", superviseur.getNom());
						sessionAgent.setAttribute(TYPE_ACCOUNT, SUPERVISEUR);
						sessionAgent.setAttribute("id_superviseur", superviseur.getIdS());
						sessionAgent.setAttribute("image", superviseur.getPhoto());
						sessionAgent.setAttribute("profil", superviseur.getBase64Image());
						System.out.println(sessionAgent.getAttribute("image").toString());
						
						request.setAttribute("NomCompte", NomCompte);
						request.getRequestDispatcher("partieSuperviseur.jsp").forward(request, response);
					} else {
						request.setAttribute("erreur", "Nom d'utilisateur ou mot de passe est invalide");
						request.getRequestDispatcher("Logins/LoginSuperviseur.jsp").forward(request, response);
					}
				} catch (Exception e) {
					request.setAttribute("erreur", "Donnez-moi votre Logins/Login et le mot de passe pour connecter ");
					request.getRequestDispatcher("Logins/LoginSuperviseur.jsp").forward(request, response);
				}
			} else if (action.equals("updateDataCommande")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
					commande = new Commande();
					if (request.getParameter("montantCommande") != null) {
						commande.setTotalCommande(request.getParameter("montantCommande"));
					} else {
						commande.setTotalCommande("-1");
					}
					commande.setIdAgentDistination(
							Integer.parseInt(request.getParameter("zone_point_destination_commande")));
					commande.setPoint_destination(request.getParameter("point_destination_commande"));
					commande.setNumAgent(request.getParameter("zone_point_depart_commande"));
					commande.setPoint_depart_commande(request.getParameter("point_depart_commande"));
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						commande.setIdSuperviseur((int) sessionAgent.getAttribute("id_superviseur"));
					} else {
						commande.setIdSuperviseur(-1);
					}
					commande.setNumAdherent(request.getParameter("num_adherent"));
					System.out.println(request.getParameter("id_commande")+"****");
					commande.setId(Integer.parseInt(request.getParameter("id_commande")));
					commande.setEtat(request.getParameter("etat_commande"));
					commande.setEmplacement(request.getParameter("emplacementCommande"));
					commande.setCin_destinataire(request.getParameter("cin_destinataire"));
					commande.setNom_prenom_destinataire(request.getParameter("nom_prenom_destinataire"));
					commande.setNum_telephone_destinataire(request.getParameter("num_tele_destinataire"));
					metier.updateCommande(commande);
					String[] listeNatureColis = request.getParameterValues("nature_colis[]");
					String[] listePoidsColis = request.getParameterValues("poids_colis[]");
					String[] listeidcolisupdate = request.getParameterValues("id_colis[]");
					if (listeNatureColis != null) {
						for (int i = 0; i < listeNatureColis.length; i++) {
							colis = new Colis();
							colis.setNature(listeNatureColis[i]);
							colis.setPoids(listePoidsColis[i]);
							colis.setId(Integer.parseInt(listeidcolisupdate[i]));
							System.out.println("colis1");
							metier.updateColis(colis);
						}
					}
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)){
						if(sessionAgent.getAttribute("lang").equals("fr"))
						request.setAttribute("messageError", "Les informations de votre commande sont à jours");
						else
							request.setAttribute("messageError", "Your order information is up to date");
						request.getRequestDispatcher("Pagesuccess.jsp").forward(request, response);
					}else
						request.getRequestDispatcher("partieClient.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ConnecterDistributeur")) {
				Distributeur distributeur = null;
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				distributeur = metier.getDistributeurTele(username);
				System.out.println(username + password);

				System.out.println(distributeur.toString());
				try {
					if (distributeur.getNtele().equals(username) && distributeur.getPassword().equals(password)) {
						NomCompte = distributeur.getNom();
						String lang = (String) sessionAgent.getAttribute("lang");
						sessionAgent.invalidate();
						sessionAgent = null;
						sessionAgent = request.getSession();
						sessionAgent.setAttribute("lang", lang);
						sessionAgent.setAttribute("idDistributeur", distributeur.getIdD());
						sessionAgent.setAttribute("id_superviseur", distributeur.getIdSuperviseur());
						sessionAgent.setAttribute("name_account", distributeur.getNom());
						sessionAgent.setAttribute(TYPE_ACCOUNT, DISTRIBUTEUR);
						System.out.println(distributeur.getBase64Image());
						sessionAgent.setAttribute("profil", distributeur.getBase64Image());
						request.setAttribute("active2", "active");
						request.setAttribute("NomCompte", NomCompte);

						request.getRequestDispatcher("partieDistributeur.jsp").forward(request, response);
					} else {
						request.setAttribute("erreur", "Nom d'utilisateur ou mot de passe est invalide");
						request.getRequestDispatcher("Logins/LoginDistributeur.jsp").forward(request, response);
					}
				} catch (Exception e) {
					request.setAttribute("erreur", "Donnez-moi votre Logins/Login et le mot de passe pour connecter ");
					request.getRequestDispatcher("Logins/LoginDistributeur.jsp").forward(request, response);
				}
			} else if (action.equals("ConnecterClient")) {
				Client client = null;
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				client = metier.getClientTele(username);
				try {
					if (client.getNtele().equals(username) && client.getPassword().equals(password)) {
						NomCompte = client.getNom();
						String lang = (String) sessionAgent.getAttribute("lang");
						sessionAgent.invalidate();
						sessionAgent = null;
						sessionAgent = request.getSession();
						sessionAgent.setAttribute("lang", lang);
						sessionAgent.setAttribute("idClient", client.getIdC());
						sessionAgent.setAttribute("name_account", client.getNom());
						sessionAgent.setAttribute(TYPE_ACCOUNT, CLIENT);
						sessionAgent.setAttribute("profil", client.getBase64Image());
						request.setAttribute("active2", "active");
						request.setAttribute("NomCompte", NomCompte);
						request.getRequestDispatcher("partieClient.jsp").forward(request, response);
					} else {
						request.setAttribute("erreur", "Nom d'utilisateur ou mot de passe est invalide");
						request.getRequestDispatcher("Logins/LoginClient.jsp").forward(request, response);
					}
				} catch (Exception e) {
					request.setAttribute("erreur", "Donnez-moi votre Login et le mot de passe pour connecter ");
					request.getRequestDispatcher("Logins/LoginClient.jsp").forward(request, response);
				}

			} else if (action.equals("ListAgent")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("agents", metier.getAllAgent());
					request.getRequestDispatcher("Listes/ListAgents.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListSuperviseur")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("ListSuperviseur", metier.getAllSupervser());
					request.getRequestDispatcher("Listes/ListSuperviseur.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListDistributeur")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("listDistributeur", metier.getAllDestributeur());
					request.getRequestDispatcher("Listes/ListDistributeur.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListAtt")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("ListAtt", metier.getAllListAtt());
					request.getRequestDispatcher("Listes/ListAtt.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListAttS")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("ListAtt", metier.getListAtt(Integer.parseInt(request.getParameter("idS"))));
					request.getRequestDispatcher("Listes/ListAtt.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListAgentS")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("agents", metier.getAllAgent(Integer.parseInt(request.getParameter("idS"))));
					request.getRequestDispatcher("Listes/ListAgents.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListDistributeurS")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("listDistributeur",
							metier.getAllDestributeur(Integer.parseInt(request.getParameter("idS"))));
					request.getRequestDispatcher("Listes/ListDistributeur.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("Add")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					String date = java.time.LocalDate.now() + " ";
					String name = request.getParameter("nom");
					String adress = request.getParameter("adresse");
					String city = request.getParameter("ville");
					String password = request.getParameter("password");
					String phone = request.getParameter("tel");
					String pays = request.getParameter("pays");
					String email = request.getParameter("email");
					try {
						new send_email_gmail(email, "Yaqout",
								"Bonjour Mr : " + name + " \n  Vous avez été enregistré  \n Yaqout.com ");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					int sup = Integer.parseInt(request.getParameter(SUPERVISEUR)); // list
					String role = request.getParameter("role");
					InputStream in = (request.getPart("profil")).getInputStream();
					Attente att = new Attente(name, password, adress, phone, city, pays, date, sup, email, role, in);
					metier.addListAtt(att);

					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ajoutClient")) {
				String date = java.time.LocalDate.now() + " ";
				InputStream in = (request.getPart("profil")).getInputStream();
				String name = request.getParameter("nom");
				String adress = request.getParameter("adresse");
				String city = request.getParameter("ville");
				String password = request.getParameter("password");
				String phone = request.getParameter("tel");
				String pays = request.getParameter("pays");
				String email = request.getParameter("email");
				Client c = new Client(name,password,adress,phone, city,pays,date,email,in); 
				String resultatAdd = metier.addClient(c);
				Client c2 = metier.getClientEmail(email);
				Client c3 = metier.getClientTele(phone);
				if(!resultatAdd.equals("")){
					Attente att = new Attente(name, password, adress, phone, city, pays, date, 1, email, "Client", in);
					request.setAttribute("attente", att);
					request.getRequestDispatcher("Inscriptions/InscriptionClientError.jsp").forward(request, response);
				}else {
				request.setAttribute("ok", "ok");
				request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				}
			} else if (action.equals("ajoutAgent")) {
				String date = java.time.LocalDate.now() + " ";
				String name = request.getParameter("nom");
				String adress = request.getParameter("adresse");
				String city = request.getParameter("ville");
				String password = request.getParameter("password");
				String phone = request.getParameter("tel");
				String pays = request.getParameter("pays");
				String email = request.getParameter("email");
				Superviser s = metier.getSupervserCity(city);
				InputStream in;
				if (request.getPart("profil") != null) {
					in = (request.getPart("profil")).getInputStream();
				} else {
					in = new BufferedInputStream(new FileInputStream("WebContent/assetss/img/default.png"));
				}

				int Idsup = s.getIdS(); // list
				String zone_agence = request.getParameter("zone_agence");
				double lat_agence = Double.parseDouble(request.getParameter("lat_agence"));
				double long_agence = Double.parseDouble(request.getParameter("long_agence"));
				String role = "Agent";
				Attente att = new Attente(name, password, adress, phone, zone_agence, city, pays, date, Idsup, email,
						role, lat_agence, long_agence, in);
				String resultatAddAgen = metier.addListAtt(att);
				if(!resultatAddAgen.equals("")){
					request.setAttribute("ListPays", metier.getAllPays());
					request.setAttribute("ListVille", metier.getAllCitySuperviseur());
					request.setAttribute("zone_agence", zone_agence);
					request.setAttribute("lat_agence", lat_agence);
					request.setAttribute("long_agence", long_agence);
					request.setAttribute("attente", att);
					request.getRequestDispatcher("Inscriptions/InscriptionAgentError.jsp").forward(request, response);
				}else {
					request.setAttribute("ok", "ok");
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);

				}
			} else if (action.equals("Track")) {
				try{
				if (request.getParameter("ll") != "") {
					String id = request.getParameter("ll");
					String etat =metier.getEtatCommandeByIdCommande(Integer.parseInt(request.getParameter("ll")));
					if(sessionAgent.getAttribute("lang").equals("ar")){
						if(etat.equals("en route"))
							etat="في الطريق";
						else if(etat.equals("effectue"))
							etat ="تمت العملية بنجاح";
						else if (etat.equals("en attente"))
							etat ="في الانتظار";
						else
							etat ="لا يوجد طلب بهدا الرقم  " ;
						
						
					}
					if(sessionAgent.getAttribute("lang").equals("fr")){
						if(etat.equals("en route"))
							etat="En route";
						else if(etat.equals("effectue"))
							etat ="Effectuée";
						else if (etat.equals("en attente"))
							etat ="En attente";
						
						
					}
					if(sessionAgent.getAttribute("lang").equals("en")){
						if(etat.equals("en route"))
							etat="on the way";
						else if(etat.equals("effectue"))
							etat ="success";
						else if (etat.equals("en attente"))
							etat ="waiting";
						else
							etat ="number's command not found " ;
						
					}
					System.out.println(id);
					request.setAttribute("etatCommande",etat);
					request.setAttribute("numeroCommande", request.getParameter("ll"));
				}

				request.getRequestDispatcher("Track.jsp").forward(request, response);
				}catch (Exception e) {
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
				}
			} else if (action.equals("send")) {
				System.out.println(request.getParameter("email"));				
				String role = request.getParameter("role");
				System.out.println(request.getParameter("role"));
				
				if (role.equals("Client")) {
					if (metier.getClientEmail(request.getParameter("email")).getIdC()!=0) {
						Client c = metier.getClientEmail(request.getParameter("email"));
						System.out.println(c.toString());
						Random raynd = new Random();
						sessionAgent.setAttribute("ver","0");
						int  rand = raynd.nextInt(1000000);
						sessionAgent.setAttribute("ver",""+rand);
						sessionAgent.setAttribute("forgetRole"," ");
						sessionAgent.setAttribute("forgetRole","Client");
						sessionAgent.setAttribute("compte",c);
						try {
							new send_email_gmail(request.getParameter("email"), "forget", "num "+rand);
						} catch (Exception e) {e.printStackTrace();
						}
						request.setAttribute("etat", rand);
						request.getRequestDispatcher("forgetVerf.jsp").forward(request, response);
					}else{request.setAttribute("etat", "not found");
					request.getRequestDispatcher("forgetClient.jsp").forward(request, response);
					}			
					
				}else if(role.equals("Distributeur")){
					if (metier.getDistributeurEmail(request.getParameter("email")).getIdD()!=0) {
						Distributeur d = metier.getDistributeurEmail(request.getParameter("email"));
						System.out.println(d.toString());
						Random raynd = new Random();
						sessionAgent.setAttribute("ver","0");
						int  rand = raynd.nextInt(1000000);
						sessionAgent.setAttribute("ver",""+rand);
						sessionAgent.setAttribute("forgetRole"," ");
						sessionAgent.setAttribute("forgetRole","Distributeur");
						sessionAgent.setAttribute("compte",d);						
						try {
							new send_email_gmail(request.getParameter("email"), "forget", "num "+rand);
						} catch (Exception e) {
							e.printStackTrace();
						}
						request.setAttribute("etat", rand);
						request.getRequestDispatcher("forgetVerf.jsp").forward(request, response);
						
					}else{
						System.out.println("mkynch");
						request.setAttribute("etat", "not found");
						request.getRequestDispatcher("forgetClient.jsp").forward(request, response);
					}				
				}else if (role.equals("Agent")){				
					if (metier.getAgentEmail(request.getParameter("email")).getIdS()!=0) {
						Agent a = metier.getAgentEmail(request.getParameter("email"));
						System.out.println(a.toString());
						Random raynd = new Random();
						sessionAgent.setAttribute("ver","0");
						int  rand = raynd.nextInt(1000000);
						System.out.println();
						sessionAgent.setAttribute("ver",""+rand);
						sessionAgent.setAttribute("forgetRole"," ");
						sessionAgent.setAttribute("forgetRole","Agent");
						sessionAgent.setAttribute("compte",a);
						try {
							new send_email_gmail(request.getParameter("email"), "forget", " Code :"+rand);
						} catch (Exception e) {e.printStackTrace();
						}
						request.setAttribute("etat", rand);
						request.getRequestDispatcher("forgetVerf.jsp").forward(request, response);
					}else{
						request.setAttribute("etat", "not found");
						request.getRequestDispatcher("forgetClient.jsp").forward(request, response);
					}
				}else{
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);

				}
			}else if (action.equals("sendV")) {
					System.out.println(request.getParameter("number"));
					String smd=request.getParameter("number");
					if(smd.equals(sessionAgent.getAttribute("ver"))){					
					String role2 = (String) sessionAgent.getAttribute("forgetRole");
					if (role2.equals("Client")){
						System.out.println(request.getParameter("password"));
						Client a = (Client) sessionAgent.getAttribute("compte");
						metier.UpDatePasswordClient(a.getIdC(), request.getParameter("password"));
						try {
							new send_email_gmail(a.getEmail(), "Password", "username :"+a.getNtele()+"\n password :"+request.getParameter("password"));
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						System.out.println(a.toString());
						request.setAttribute("erreur", "username and password in your email");
						request.getRequestDispatcher("Logins/LoginClient.jsp").forward(request, response);
					}else if (role2.equals("Distributeur")){
						System.out.println(request.getParameter("password"));
						Distributeur d = (Distributeur) sessionAgent.getAttribute("compte");
						
						System.out.println(d.toString());
						metier.UpDatePasswordDistributeur(d.getIdD(), request.getParameter("password"));
						try {
							new send_email_gmail(d.getEmail(), "Password", "username :"+d.getNtele()+"\n password :"+request.getParameter("password"));
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						request.setAttribute("erreur", "username and password in your email");
						request.getRequestDispatcher("Logins/LoginDistributeur.jsp").forward(request, response);
					
					}else if(role2.equals("Agent")){
						System.out.println(request.getParameter("password"));
						Agent ag = (Agent) sessionAgent.getAttribute("compte");
						System.out.println(ag.toString());
						metier.UpDatePasswordAgent(ag.getIdS(), request.getParameter("password"));
						try {
							new send_email_gmail(ag.getEmail(), "Password", "username :"+ag.getNtele()+"\n password :"+request.getParameter("password"));
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						request.setAttribute("erreur", "username and password in your email");
						request.getRequestDispatcher("Logins/LoginAgent.jsp").forward(request, response);
					
					}else
					{request.getRequestDispatcher("Acceuil.jsp").forward(request, response);}
					}else{
						request.setAttribute("message", "Number is not Correcte");
						request.getRequestDispatcher("forgetVerf.jsp").forward(request, response);
					}
				}else if (action.equals("ajoutDistributeur")) {
				String date = java.time.LocalDate.now() + " ";
				String name = request.getParameter("nom");
				String adress = request.getParameter("adresse");
				String city = request.getParameter("ville");
				String password = request.getParameter("password");
				String phone = request.getParameter("tel");
				String pays = request.getParameter("pays");
				String email = request.getParameter("email");
				Superviser s = metier.getSupervserCity(city);
				int Idsup = s.getIdS();
				String role = DISTRIBUTEUR;
				System.out.println(request.getCharacterEncoding());
				InputStream in = (request.getPart("profil")).getInputStream();
				Attente att = new Attente(name, password, adress, phone, city, pays, date, Idsup, email, role, in);
				String resultatAddDistr = metier.addListAtt(att);
				if(!resultatAddDistr.equals("")){

					request.setAttribute("ListPays", metier.getAllPays());
					request.setAttribute("ListVille", metier.getAllCitySuperviseur());
					request.setAttribute("attente", att);
					request.getRequestDispatcher("Inscriptions/InscriptionDistributeurErrorC.jsp").forward(request, response);
				}else {
					request.setAttribute("ok", "ok");
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);

				}
			} else if (action.equals("Maps")) {
				request.getRequestDispatcher("Maps.jsp").forward(request, response);
			} else if (action.equals("ListSuperviseur")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					request.setAttribute("ListSuperviseur", metier.getAllSupervser());
					request.getRequestDispatcher("Listes/ListSuperviseur.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListAgent")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
					request.setAttribute("agents", metier.getAllAgent());
					request.getRequestDispatcher("Listes/ListAgents.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListDistributeur")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
					request.setAttribute("listDistributeur", metier.getAllDestributeur());
					request.getRequestDispatcher("Listes/ListDistributeur.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListAtt")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
					request.setAttribute("ListAtt", metier.getAllListAtt());
					request.getRequestDispatcher("Listes/ListAtt.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListAttS")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
					request.setAttribute("ListAtt", metier.getListAtt(Integer.parseInt(request.getParameter("idS"))));
					request.getRequestDispatcher("Listes/ListAtt.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListAgentS")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
					request.setAttribute("agents", metier.getAllAgent(Integer.parseInt(request.getParameter("idS"))));
					request.getRequestDispatcher("Listes/ListAgents.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ListDistributeurS")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)) {
					request.setAttribute("listDistributeur",
							metier.getAllDestributeur(Integer.parseInt(request.getParameter("idS"))));
					request.getRequestDispatcher("Listes/ListDistributeur.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("saveCommandeClient")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
					commande = new Commande();
					if (request.getParameter("montantCommande") != null)
						commande.setTotalCommande(request.getParameter("montantCommande"));
					else
						commande.setTotalCommande("-1");
					commande.setIdAgentDistination(
							Integer.parseInt(request.getParameter("zone_point_destination_commande")));
					if (request.getParameter("point_destination_commande") != null)
						commande.setPoint_destination(request.getParameter("point_destination_commande"));
					else
						commande.setPoint_destination("agence");
					if (request.getParameter("zone_point_depart_commande") != null)
						commande.setNumAgent(request.getParameter("zone_point_depart_commande"));
					else
						commande.setNumAgent(String.valueOf(sessionAgent.getAttribute("id_agent")));
					if (request.getParameter("point_depart_commande") != null)
						commande.setPoint_depart_commande(request.getParameter("point_depart_commande"));
					else
						commande.setPoint_depart_commande("agence");
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT))
						commande.setIdSuperviseur((int) sessionAgent.getAttribute("id_superviseur"));
					else {
						commande.setIdSuperviseur(
								(metier.getAgent(Integer.parseInt(request.getParameter("zone_point_depart_commande"))))
										.getIdSuperviseur());
					}
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT))
						commande.setNumAdherent(sessionAgent.getAttribute("idClient").toString());
					else
						commande.setNumAdherent(request.getParameter("num_adherent"));
					commande.setEtat("en attente");
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT))
						commande.setEmplacement("Maison départ");
					else
					commande.setEmplacement("Agence départ");
					commande.setCin_destinataire(request.getParameter("nom_prenom_destinataire"));
					commande.setNom_prenom_destinataire(request.getParameter("cin_destinataire"));
					commande.setNum_telephone_destinataire(request.getParameter("num_tele_destinataire"));
					commande.setMonnaie_total_commande(request.getParameter("monnaie_total_commande"));
					metier.addNewCommande(commande);
					colis = new Colis();
					String[] listeNatureColis = request.getParameterValues("nature_colis[]");
					String[] listePoidsColis = request.getParameterValues("poids_colis[]");
					if (listeNatureColis != null) {
						for (int i = 0; i < listeNatureColis.length; i++) {
							colis.setNature(listeNatureColis[i]);
							colis.setPoids(listePoidsColis[i]);
							metier.addNewColis(colis);
						}
					}
					if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
						request.setAttribute("messageError", "Your commande has been successfully created");
						request.getRequestDispatcher("Pagesuccess.jsp").forward(request, response);
					} else {
						request.setAttribute("messageError", "Votre commande à bien été ajouter");
						request.getRequestDispatcher("Pagesuccess.jsp").forward(request, response);
					}
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("updateColis")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
					colis = new Colis();
					colis.setNature(request.getParameter("nature_colis"));
					colis.setPoids(request.getParameter("poids_colis"));
					colis.setId(Integer.parseInt(request.getParameter("id_colis_update")));
					colis.setId_commande(Integer.parseInt(request.getParameter("id_commande")));
					metier.updateColis(colis);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("ajouter_colis_commande")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
					colis = new Colis();
					colis.setNature(request.getParameter("nature_colis"));
					colis.setPoids(request.getParameter("poids_colis"));
					colis.setId_commande(Integer.parseInt(request.getParameter("id_commande")));
					metier.addNewColis(colis);
					response.sendRedirect(request.getHeader("Referer"));
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("AfficherColis")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
					request.setAttribute("colis", metier.getColisByCodeSuivi(request.getParameter("code")));
					request.getRequestDispatcher("DetailsColis.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("Maps")) {
				request.getRequestDispatcher("Maps.jsp").forward(request, response);
			} else if (action.equals("updateAgent")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(AGENT)) {
					agent = new Agent();
					if (request.getParameter("updateCheckbox") != null) {
						String password = metier.getAgent((int) sessionAgent.getAttribute("id_agent")).getPassword();
						if (password.equals(request.getParameter("lastpassword"))) {
							agent.setPassword(request.getParameter("password"));
						} else {
							//sessionAgent = null;
							request.setAttribute("messageError",
									"L'ancien mot de passe que vous avez reseigner est incorrect");
							request.getRequestDispatcher("PageErrorMotDepasse.jsp").forward(request, response);
						}
					} else {
						agent.setPassword(metier.getAgent((int) sessionAgent.getAttribute("id_agent")).getPassword());
					}
					agent.setAdresse(request.getParameter("adresse"));
					agent.setIdSuperviseur(Integer.parseInt(request.getParameter(SUPERVISEUR)));
					agent.setVille(request.getParameter("ville"));
					agent.setNom(request.getParameter("nom"));
					agent.setEmail(request.getParameter("email"));
					agent.setPaye(request.getParameter("pays"));
					agent.setNtele(request.getParameter("tel"));
					agent.setZone(request.getParameter("zone_agence"));
					agent.setLat_agence(Double.parseDouble(request.getParameter("lat_agence")));
					agent.setLong_agence(Double.parseDouble(request.getParameter("long_agence")));
					metier.updateAgent((int) sessionAgent.getAttribute("id_agent"), agent);
					request.setAttribute("messageError", "Les informations de votre compte sont à jours");
					request.getRequestDispatcher("Pagesuccess.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("track_commande")) {
				String etat =metier.getEtatCommandeByIdCommande(Integer.parseInt(request.getParameter("num_commande")),(int) sessionAgent.getAttribute("idClient"));
				if(sessionAgent.getAttribute("lang").equals("ar")){
					if(etat.equals("en route"))
						etat="في الطريق";
					else if(etat.equals("effectue"))
						etat ="تمت العملية بنجاح";
					else if (etat.equals("en attente"))
						etat ="في الانتظار";
					else
						etat ="لا يوجد طلب بهدا الرقم  " ;
					
				}
				if(sessionAgent.getAttribute("lang").equals("en")){
					if(etat.equals("en route"))
						etat="on the way";
					else if(etat.equals("effectue"))
						etat ="success";
					else if (etat.equals("en attente"))
						etat ="waiting";
					else
						etat ="number's command not found " ;
					
				}
					
				request.setAttribute("etatCommande",etat);
				request.setAttribute("numeroCommande", request.getParameter("num_commande"));
				request.getRequestDispatcher("SuivreUneCommande.jsp").forward(request, response);

			} else if (action.equals("updateDataClient")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
					Client client = new Client();
					if (request.getParameter("updateCheckbox") != null) {
						String password = metier.getClient((int) sessionAgent.getAttribute("idClient")).getPassword();
						if (password.equals(request.getParameter("lastpassword"))) {
							client.setPassword(request.getParameter("password"));
						} else {
							request.getRequestDispatcher("PageErrorMotDepasse.jsp").forward(request, response);
						}
					} else {
						client.setPassword(metier.getClient((int) sessionAgent.getAttribute("idClient")).getPassword());
					}
					client.setAdresse(request.getParameter("adresse"));
					client.setEmail(request.getParameter("email"));
					client.setNom(request.getParameter("nom"));
					client.setIdC(Integer.parseInt(request.getParameter("id_client")));
					client.setNtele(request.getParameter("tel"));
					client.setPays(request.getParameter("pays"));
					client.setVille(request.getParameter("ville"));
					metier.updateClient(client);
					request.setAttribute("messageError", "Les informations de votre compte sont à jours");
					request.getRequestDispatcher("Pagesuccess.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("updateDataSuper")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(SUPERVISEUR)
						|| sessionAgent.getAttribute(TYPE_ACCOUNT).equals(ADMIN)) {
					Superviser sup = new Superviser();
					if (request.getParameter("updateCheckbox") != null) {
						String password = metier.getSupervser(Integer.parseInt(request.getParameter("id")))
								.getPassword();
						if (password.equals(request.getParameter("lastpassword"))) {
							sup.setPassword(request.getParameter("password"));
						} else {
							sessionAgent = null;
							request.getRequestDispatcher("PageErrorMotDepasse.jsp").forward(request, response);
						}
					} else {
						sup.setPassword(
								metier.getSupervser(Integer.parseInt(request.getParameter("id"))).getPassword());
					}
					sup.setAdresse(request.getParameter("adresse"));
					sup.setEmail(request.getParameter("email"));
					sup.setNom(request.getParameter("nom"));
					sup.setNtele(request.getParameter("tel"));
					sup.setCountry(request.getParameter("pays"));
					sup.setVille(request.getParameter("ville"));
					metier.updateSuperviseur(sup);
					request.setAttribute("messageError", "Les informations de votre compte sont à jours");
					request.getRequestDispatcher("partieAdmin.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else if (action.equals("envoyer_reclamation")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(CLIENT)) {
					metier.envoyerReclamation(new String(request.getParameter("rec_client").getBytes("UTF-8")),
							(String) sessionAgent.getAttribute("name_account"));

					request.setAttribute("messageError",
							"Votre réclamation a bien été ajouter, vous recevez une réponse dans le plus tôt possible");
					request.getRequestDispatcher("Pagesuccess.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);

			} else if (action.equals("updateDistributeur")) {
				if (sessionAgent.getAttribute(TYPE_ACCOUNT).equals(DISTRIBUTEUR)) {
					Distributeur distributeur = new Distributeur();
					if (request.getParameter("updateCheckbox") != null) {
						String password = metier.getDestributeur((int) sessionAgent.getAttribute("idDistributeur"))
								.getPassword();
						if (password.equals(request.getParameter("lastpassword"))) {
							distributeur.setPassword(request.getParameter("password"));
						} else {
							sessionAgent = null;
							request.getRequestDispatcher("PageErrorMotDepasse.jsp").forward(request, response);
						}
					} else {
						distributeur.setPassword(metier
								.getDestributeur((int) sessionAgent.getAttribute("idDistributeur")).getPassword());
					}
					distributeur.setNom(request.getParameter("nom"));
					distributeur.setEmail(request.getParameter("email"));
					distributeur.setVille(request.getParameter("ville"));
					distributeur.setPaye(request.getParameter("pays"));
					distributeur.setAdresse(request.getParameter("adresse"));
					distributeur.setNtele(request.getParameter("tel"));
					distributeur.setIdD(Integer.parseInt(request.getParameter("id_dist")));
					metier.updateDistributeur(distributeur);
					request.getRequestDispatcher("AccueilAgent.jsp").forward(request, response);
				} else
					request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			} else {
				sessionAgent = request.getSession();
				sessionAgent.setAttribute("lang", lang);
				sessionAgent.setAttribute(TYPE_ACCOUNT, VISITEUR);
				request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
			}
		}
	}
}