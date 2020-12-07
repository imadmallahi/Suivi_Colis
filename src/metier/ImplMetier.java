package metier;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import models.AES;
import models.Agent;
import models.Attente;
import models.Client;
import models.Colis;
import models.Commande;
import models.Distributeur;
import models.InformationCommandeWithAgentAndAdherent;
import models.Reclamation;
import models.Superviser;

public class ImplMetier implements IBesoin {
	final String secretKey = "0615223491";

	@Override
	public void addSuperviser(Superviser s) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("insert into superviser("
					+ "nom,password,NTele,adresse,dateInscp,ville,email,pays,image) values (?,?,?,?,?,?,?,?,?)");
			
			
			ps.setString(1, s.getNom());
			ps.setString(2,AES.encrypt(s.getPassword(), secretKey) );
			ps.setString(3, s.getNtele());
			ps.setString(4, s.getAdresse());
			ps.setString(5, s.getDateInsc());
			ps.setString(6, s.getVille());
			ps.setString(7, s.getEmail());
			ps.setString(8, s.getCountry());
			ps.setBlob(9, s.getPhoto());

			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public Superviser getSupervser(String user) {
		Connection con = SingletonConnexion.getCon();

		Superviser d = new Superviser();
		try {
			PreparedStatement ps = con.prepareStatement("select * from superviser where nom ='" + user + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdS(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword( AES.decrypt(rs.getString(3), secretKey));
				d.setNtele(rs.getString(4));
				d.setAdresse(rs.getString(5));
				d.setDateInsc(rs.getString(6));
				d.setVille(rs.getString(7));
				d.setEmail(rs.getString(8));
				d.setCountry(rs.getString(10));
				d.setPhoto(rs.getBinaryStream(9));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob(9)));
				} else {
					d.setBase64Image(null);
				}
			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public Superviser getSupervserTele(String tele) {
		Connection con = SingletonConnexion.getCon();

		Superviser d = new Superviser();
		try {
			PreparedStatement ps = con.prepareStatement("select * from superviser where NTele ='" + tele + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdS(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setNtele(rs.getString(4));
				d.setAdresse(rs.getString(5));
				d.setDateInsc(rs.getString(6));
				d.setVille(rs.getString(7));
				d.setEmail(rs.getString(8));
				d.setCountry(rs.getString(10));
				d.setPhoto(rs.getBinaryStream(9));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob(9)));
				} else {
					d.setBase64Image(null);
				}
			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public Superviser getSupervser(int user) {
		Connection con = SingletonConnexion.getCon();

		Superviser d = new Superviser();
		try {
			PreparedStatement ps = con.prepareStatement("select * from superviser where idSuperviser =" + user);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdS(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setNtele(rs.getString(4));
				d.setAdresse(rs.getString(5));
				d.setDateInsc(rs.getString(6));
				d.setVille(rs.getString(7));
				d.setEmail(rs.getString(8));
				d.setPhoto(rs.getBinaryStream(9));
				d.setCountry(rs.getString(10));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob(9)));
				} else {
					d.setBase64Image(null);
				}
			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public Superviser getSupervserCity(String user) {
		Connection con = SingletonConnexion.getCon();

		Superviser d = new Superviser();
		try {
			PreparedStatement ps = con.prepareStatement("select * from superviser where ville ='" + user + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdS(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setNtele(rs.getString(4));
				d.setAdresse(rs.getString(5));
				d.setDateInsc(rs.getString(6));
				d.setVille(rs.getString(7));
				d.setEmail(rs.getString(8));
				d.setPhoto(rs.getBinaryStream(9));
				d.setCountry(rs.getString(10));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob(9)));
				} else {
					d.setBase64Image(null);
				}
			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public List<Superviser> getAllSupervser() {
		Connection con = SingletonConnexion.getCon();
		List<Superviser> listSuperviseur = new ArrayList<Superviser>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from superviser");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Superviser sp = new Superviser();
				sp.setIdS(rs.getInt("idSuperviser"));
				sp.setNom(rs.getString("nom"));
				sp.setAdresse(rs.getString("adresse"));
				sp.setDateInsc(rs.getString("dateInscp"));
				sp.setPassword(AES.decrypt(rs.getString("password"), secretKey));
				sp.setVille(rs.getString("ville"));
				sp.setNtele(rs.getString("NTele"));
				listSuperviseur.add(sp);

			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSuperviseur;
	}

	@Override
	public void removeSuperviser(int id) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("delete from superviser where idSupervisers=" + id);
			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void addAgent(Agent s) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("insert into "
					+ "agent(nomA,passwordA,adresseA,dateInscpA,VilleA,PayA,NTeleA,zone,idSuperviseur,email,long_agence,lat_agence,photo) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)");

			ps.setString(1, s.getNom());
			ps.setString(2, AES.encrypt(s.getPassword(), secretKey));
			ps.setString(3, s.getAdresse());
			ps.setString(4, s.getDateInsc());
			ps.setString(5, s.getVille());
			ps.setString(6, s.getPaye());
			ps.setString(7, s.getNtele());
			ps.setString(8, s.getZone());
			ps.setInt(9, s.getIdSuperviseur());
			ps.setString(10, s.getEmail());
			ps.setDouble(11, s.getLong_agence());
			ps.setDouble(12, s.getLat_agence());
			ps.setBlob(13, s.getPhoto());

			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public String addClient(Client c) {
		Connection connexion2 = SingletonConnexion.getCon();
		try {
			PreparedStatement preparestatement2 = connexion2.prepareStatement(
					"select * from client where email ='" + c.getEmail() + "' OR Ntele = '" + c.getNtele() + "'");
			ResultSet resultatstatement2 = preparestatement2.executeQuery();
			if (resultatstatement2.next()) {
				preparestatement2.close();
				return "ErrorEmailOrNtele";

			}

			preparestatement2.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "jh";
		}
		
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement(
					"insert into " + "client(nom,password,Ntele,ville,pays,dateInscription,adresse,email,photo) "
							+ "values (?,?,?,?,?,?,?,?,?)");

			ps.setString(1, c.getNom());
			ps.setString(2, AES.encrypt(c.getPassword(), secretKey));
			ps.setString(3, c.getNtele());
			ps.setString(4, c.getVille());
			ps.setString(5, c.getPays());
			ps.setString(6, c.getDateInsc());
			ps.setString(7, c.getAdresse());
			ps.setString(8, c.getEmail());
			ps.setBlob(9, c.getPhoto());
			
			ps.executeUpdate();
			ps.close();
			return "";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "ok";
		}
	}

	public Agent getAgent(int id) {
		Connection con = SingletonConnexion.getCon();

		Agent d = new Agent();
		try {
			PreparedStatement ps = con.prepareStatement("select * from agent where idAgent=" + id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdS(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setAdresse(rs.getString(4));
				d.setDateInsc(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setNtele(rs.getString(8));
				d.setZone(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getString(11));
				d.setLong_agence(rs.getDouble(12));
				d.setLat_agence(rs.getDouble(13));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	public Agent getAgentEmail(String id) {
		Connection con = SingletonConnexion.getCon();

		Agent d = new Agent();
		try {
			PreparedStatement ps = con.prepareStatement("select * from agent where email='" + id + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdS(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setAdresse(rs.getString(4));
				d.setDateInsc(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setNtele(rs.getString(8));
				d.setZone(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getString(11));
				d.setLong_agence(rs.getDouble(12));
				d.setLat_agence(rs.getDouble(13));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	public List<String> getAllPays() {
		Connection con = SingletonConnexion.getCon();

		List<String> listPays = new ArrayList<String>();
		try {
			PreparedStatement ps = con.prepareStatement("select distinct pays from superviser ");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listPays.add(rs.getString(1));

			}

			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listPays;
	}

	public List<Agent> getAllAgent() {
		Connection con = SingletonConnexion.getCon();
		List<Agent> listAgents = new ArrayList<Agent>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from agent");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Agent ag = new Agent();
				ag.setIdS(rs.getInt(1));
				ag.setNom(rs.getString(2));
				ag.setPassword(AES.decrypt(rs.getString(3), secretKey));
				ag.setAdresse(rs.getString(4));
				ag.setDateInsc(rs.getString(5));
				ag.setVille(rs.getString(6));
				ag.setPaye(rs.getString(7));
				ag.setNtele(rs.getString(8));
				ag.setZone(rs.getString(9));
				ag.setIdSuperviseur(rs.getInt(10));
				ag.setLong_agence(rs.getDouble(12));
				ag.setLat_agence(rs.getDouble(13));
				listAgents.add(ag);

			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAgents;
	}

	public void removeAgent(int id) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("delete from agent where idAgent=" + id);
			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Agent> getAllAgent(int idS) {
		Connection con = SingletonConnexion.getCon();
		List<Agent> listAgents = new ArrayList<Agent>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from agent where 	idSuperviseur =" + idS);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Agent ag = new Agent();
				ag.setIdS(rs.getInt(1));
				ag.setNom(rs.getString(2));
				ag.setPassword(AES.decrypt(rs.getString(3), secretKey));
				ag.setAdresse(rs.getString(4));
				ag.setDateInsc(rs.getString(5));
				ag.setVille(rs.getString(6));
				ag.setPaye(rs.getString(7));
				ag.setNtele(rs.getString(8));
				ag.setZone(rs.getString(9));
				ag.setIdSuperviseur(rs.getInt(10));
				listAgents.add(ag);

			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAgents;

	}

	@Override
	public List<String> getAllCitySuperviseur() {
		Connection con = SingletonConnexion.getCon();
		List<String> villes = new ArrayList<String>();
		try {
			PreparedStatement ps = con.prepareStatement("select DISTINCT ville from superviser ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String s = new String();
				s = rs.getString(1);
				villes.add(s);

			}
			ps.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return villes;

	}

	@Override
	public void addDistributeur(Distributeur s) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into " + "distributeur(nom,password,zone,Ntele,ville,paye,"
							+ "dateInscription,adresse,idSuperviseur,email,photo) " + "values (?,?,?,?,?,?,?,?,?,?,?)");

			ps.setString(1, s.getNom());
			ps.setString(2,AES.encrypt(s.getPassword(), secretKey) );
			ps.setString(3, s.getZone());
			ps.setString(4, s.getNtele());
			ps.setString(5, s.getVille());
			ps.setString(6, s.getPaye());
			ps.setString(8, s.getAdresse());
			ps.setString(7, s.getDateInsc());
			ps.setInt(9, s.getIdSuperviseur());
			ps.setString(10, s.getEmail());
			ps.setBlob(11, s.getPhoto());

			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public Distributeur getDestributeur(int id) {
		Connection con = SingletonConnexion.getCon();

		Distributeur d = new Distributeur();
		try {
			PreparedStatement ps = con.prepareStatement("select * from distributeur where idD=" + id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdD(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setZone(rs.getString(4));
				d.setNtele(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setDateInsc(rs.getString(8));
				d.setAdresse(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public Distributeur getDistributeur(String user) {
		Connection con = SingletonConnexion.getCon();

		Distributeur d = new Distributeur();
		try {
			PreparedStatement ps = con.prepareStatement("select * from distributeur where nom='" + user + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdD(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setZone(rs.getString(4));
				d.setNtele(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setDateInsc(rs.getString(8));
				d.setAdresse(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public Distributeur getDistributeurTele(String tele) {
		Connection con = SingletonConnexion.getCon();

		Distributeur d = new Distributeur();
		try {
			PreparedStatement ps = con.prepareStatement("select * from distributeur where Ntele='" + tele + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdD(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setZone(rs.getString(4));
				d.setNtele(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setDateInsc(rs.getString(8));
				d.setAdresse(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public Distributeur getDistributeurEmail(String user) {
		Connection con = SingletonConnexion.getCon();

		Distributeur d = new Distributeur();
		try {
			PreparedStatement ps = con.prepareStatement("select * from distributeur where email='" + user + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdD(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setZone(rs.getString(4));
				d.setNtele(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setDateInsc(rs.getString(8));
				d.setAdresse(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getString(11));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public List<Distributeur> getAllDestributeur() {
		Connection con = SingletonConnexion.getCon();
		List<Distributeur> listDistributeur = new ArrayList<Distributeur>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from distributeur");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Distributeur d = new Distributeur();
				d.setIdD(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setAdresse(rs.getString(9));
				d.setDateInsc(rs.getString(8));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setNtele(rs.getString(5));
				d.setZone(rs.getString(4));
				d.setIdSuperviseur(rs.getInt(10));

				listDistributeur.add(d);

			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listDistributeur;
	}

	@Override
	public List<Client> getAllClient() {
		Connection con = SingletonConnexion.getCon();
		List<Client> listClient = new ArrayList<Client>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from client");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Client c = new Client();
				c.setIdC(rs.getInt(1));
				c.setNom(rs.getString(2));
				c.setPassword(AES.decrypt(rs.getString(3), secretKey));
				c.setAdresse(rs.getString(8));
				c.setDateInsc(rs.getString(7));
				c.setVille(rs.getString(5));
				c.setPays(rs.getString(6));
				c.setNtele(rs.getString(4));
				c.setEmail(rs.getString(9));

				listClient.add(c);

			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listClient;
	}

	@Override
	public List<Distributeur> getAllDestributeur(int idS) {
		Connection con = SingletonConnexion.getCon();
		List<Distributeur> listDistributeur = new ArrayList<Distributeur>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from distributeur where idSuperviseur =" + idS);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Distributeur d = new Distributeur();
				d.setIdD(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setAdresse(rs.getString(9));
				d.setDateInsc(rs.getString(8));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setNtele(rs.getString(5));
				d.setZone(rs.getString(4));
				d.setIdSuperviseur(rs.getInt(10));

				listDistributeur.add(d);

			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listDistributeur;
	}

	@Override
	public void removeDestributeur(int id) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("delete from agent where idAgent=" + id);
			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public String addListAtt(Attente s) {
		Connection connexion = SingletonConnexion.getCon();
		try {
			PreparedStatement preparestatement = connexion.prepareStatement(
					"select * from listattend where email ='" + s.getEmail() + "' OR Ntele = '" + s.getNtele() + "'");
			ResultSet resultatstatement = preparestatement.executeQuery();
			if (resultatstatement.next()) {
				preparestatement.close();
				return "ErrorEmailOrNtele";
			}
			preparestatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (s.getRole().equals("Client")) {
			Connection connexion2 = SingletonConnexion.getCon();
			try {
				PreparedStatement preparestatement2 = connexion2.prepareStatement(
						"select * from client where email ='" + s.getEmail() + "' OR Ntele = '" + s.getNtele() + "'");
				ResultSet resultatstatement2 = preparestatement2.executeQuery();
				if (resultatstatement2.next()) {
					preparestatement2.close();
					return "ErrorEmailOrNtele";

				}

				preparestatement2.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (s.getRole().equals("distributeur")) {
			Connection connexion3 = SingletonConnexion.getCon();
			try {
				PreparedStatement preparestatement3 = connexion3
						.prepareStatement("select * from distributeur where email ='" + s.getEmail() + "' OR Ntele = '"
								+ s.getNtele() + "'");
				ResultSet resultatstatement3 = preparestatement3.executeQuery();
				if (resultatstatement3.next()) {
					preparestatement3.close();
					return "ErrorEmailOrNtele";
				}

				preparestatement3.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (s.getRole().equals("Agent")) {
			Connection connexion4 = SingletonConnexion.getCon();
			try {
				PreparedStatement preparestatement4 = connexion4.prepareStatement(
						"select * from agent where email ='" + s.getEmail() + "' OR NteleA = '" + s.getNtele() + "'");
				ResultSet resultatstatement4 = preparestatement4.executeQuery();
				if (resultatstatement4.next()) {
					preparestatement4.close();
					return "ErrorEmailOrNtele";
				}
				preparestatement4.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("insert into "
					+ "listattend(nom,password,zone,Ntele,ville,paye,dateInscription,adresse,idSuperviseur,email,role,long_agence,lat_agence,photo) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, s.getNom());
			ps.setString(2,AES.encrypt(s.getPassword(), secretKey) );
			ps.setString(3, s.getZone());
			ps.setString(4, s.getNtele());
			ps.setString(5, s.getVille());
			ps.setString(6, s.getPaye());
			ps.setString(7, s.getDateInsc());
			ps.setString(8, s.getAdresse());
			ps.setInt(9, s.getIdSuperviseur());
			ps.setString(10, s.getEmail());
			ps.setString(11, s.getRole());
			ps.setDouble(12, s.getLong_agence());
			ps.setDouble(13, s.getLat_agence());
			ps.setBlob(14, s.getPhoto());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public List<Attente> getListAtt(int id) {
		Connection con = SingletonConnexion.getCon();
		List<Attente> listAtt = new ArrayList<Attente>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from listattend where idSuperviseur =" + id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Attente d = new Attente();
				d.setIdA(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setAdresse(rs.getString(9));
				d.setDateInsc(rs.getString(8));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setNtele(rs.getString(5));
				d.setZone(rs.getString(4));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getString(11));
				d.setRole(rs.getString(12));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

				listAtt.add(d);

			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAtt;
	}

	@Override
	public Attente getAtt(int id) {
		Connection con = SingletonConnexion.getCon();
		Attente Att = new Attente();
		try {
			PreparedStatement ps = con.prepareStatement("select * from listattend where idT =" + id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				Att.setIdA(rs.getInt(1));
				Att.setNom(rs.getString(2));
				Att.setPassword(AES.decrypt(rs.getString(3), secretKey));
				Att.setAdresse(rs.getString(9));
				Att.setDateInsc(rs.getString(8));
				Att.setVille(rs.getString(6));
				Att.setPaye(rs.getString(7));
				Att.setNtele(rs.getString(5));
				Att.setZone(rs.getString(4));
				Att.setIdSuperviseur(rs.getInt(10));
				Att.setEmail(rs.getString(11));
				Att.setRole(rs.getString(12));
				Att.setPhoto(rs.getBinaryStream(15));
				if (Att.getPhoto() != null) {
					Att.setBase64Image(Transfer(rs.getBlob(15)));
				} else {
					Att.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Att;
	}

	@Override
	public List<Attente> getAllListAtt() {
		Connection con = SingletonConnexion.getCon();
		List<Attente> listAtt = new ArrayList<Attente>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from listattend");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Attente d = new Attente();
				d.setIdA(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setAdresse(rs.getString(9));
				d.setDateInsc(rs.getString(8));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setNtele(rs.getString(5));
				d.setZone(rs.getString(4));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getString(11));
				d.setRole(rs.getString(12));
				listAtt.add(d);

			}
			ps.close();
		} catch (SQLException e) {

		}
		return listAtt;
	}

	@Override
	public List<Attente> getAllListAttVille(String ville) {
		Connection con = SingletonConnexion.getCon();
		List<Attente> listAtt = new ArrayList<Attente>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from listattend where ville = '" + ville + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Attente d = new Attente();
				d.setIdA(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setZone(rs.getString(4));
				d.setNtele(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setDateInsc(rs.getString(8));
				d.setAdresse(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getNString(11));
				d.setRole(rs.getString(12));
				listAtt.add(d);

			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAtt;
	}

	@Override
	public void removeListAtt(int id) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("delete from listattend where idT=" + id);
			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public Attente getToAffecter(int id) {
		Connection con = SingletonConnexion.getCon();

		Attente d = new Attente();
		try {
			PreparedStatement ps = con.prepareStatement("select * from listattend where idT=" + id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				d.setIdA(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setZone(rs.getString(4));
				d.setNtele(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setDateInsc(rs.getString(8));
				d.setAdresse(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getString(11));
				d.setRole(rs.getString(12));
				d.setLat_agence(rs.getDouble(13));
				d.setLong_agence(rs.getDouble(14));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	public void addNewCommande(Commande commande) {
		Connection connection = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = connection.prepareStatement(
					"insert into commande(num_agent,num_adherent,montant_total,etat,idSuperviseur,idAgentDistination,point_depart,point_destination,emplacement,date_creation,date_last_update,nom_prenom_destinataire,cin_destinataire,num_telephone_destinataire,monnaie_total_commande)  values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			System.out.println("wslt hna");
			System.out.println(commande.toString());
			prepareStatement.setString(1, commande.getNumAgent());
			prepareStatement.setString(2, commande.getNumAdherent());
			prepareStatement.setString(3, commande.getTotalCommande());
			prepareStatement.setString(4, commande.getEtat());
			prepareStatement.setInt(5, commande.getIdSuperviseur());
			prepareStatement.setInt(6, commande.getIdAgentDistination());
			prepareStatement.setString(7, commande.getPoint_depart_commande());
			prepareStatement.setString(8, commande.getPoint_destination());
			prepareStatement.setString(9, commande.getEmplacement());
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			prepareStatement.setString(10, dateFormat.format(date));
			prepareStatement.setString(11, dateFormat.format(date));
			prepareStatement.setString(12, commande.getNom_prenom_destinataire());
			prepareStatement.setString(13, commande.getCin_destinataire());
			prepareStatement.setString(14, commande.getNum_telephone_destinataire());
			prepareStatement.setString(15, commande.getMonnaie_total_commande());
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addNewColis(Colis colis) {
		Connection connection = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = connection.prepareStatement("select max(id) as id from commande");
			ResultSet rs = ps.executeQuery();
			rs.next();
			int id_commande = rs.getInt(1);
			try {
				PreparedStatement prepareStatement = connection
						.prepareStatement("insert into colis(nature,poids,id_commande) values (?,?,?)");
				prepareStatement.setString(1, colis.getNature());
				prepareStatement.setString(2, colis.getPoids());
				prepareStatement.setInt(3, id_commande);

				prepareStatement.executeUpdate();
				prepareStatement.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	public ArrayList<Commande> getAllCommande() {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<Commande> listeCommande = new ArrayList<>();

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement("select * from commande ");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setNumAdherent(resultatStatement.getString(3));
				commande.setNumAgent(resultatStatement.getString(2));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setIdSuperviseur(resultatStatement.getInt(6));
				commande.setIdDistributeur(resultatStatement.getInt(7));
				commande.setEtat(resultatStatement.getString(5));
				commande.setId(resultatStatement.getInt(1));
				commande.setIdAgentDistination(resultatStatement.getInt(8));
				listeCommande.add(commande);
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getAllCommandeEntrer(int idDistination, String etat) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommande = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where idAgentDistination='"
							+ idDistination + "'  and etat ='" + etat
							+ "' and agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommande.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getAllCommandeEntrer(int idDistination) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommande = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where idAgentDistination='"
							+ idDistination
							+ "' and agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommande.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getAllCommandeEntrer() {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommande = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where "
							+ "agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommande.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public ArrayList<Colis> getColisByCommandeId(int id) {
		Connection con = SingletonConnexion.getCon();
		ArrayList<Colis> listeColis = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from colis where id_commande=" + id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Colis colis = new Colis();
				colis.setId(rs.getInt(1));
				colis.setNature(rs.getString(2));
				colis.setPoids(rs.getString(3));
				colis.setId_commande(rs.getInt(4));
				listeColis.add(colis);
			}

			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeColis;
	}

	public InformationCommandeWithAgentAndAdherent getCommandeById(int Id) {
		Connection con = SingletonConnexion.getCon();
		Connection conn = SingletonConnexion.getCon();
		InformationCommandeWithAgentAndAdherent informationCommandeWithAgentAndAdherent = null;
		Commande commande = new Commande();
		Agent agent = new Agent();
		Client client = new Client();
		try {
			PreparedStatement prepareStatements = con.prepareStatement(
					"select commande.id, agent.zone, client.idC, client.nom, commande.montant_total, commande.etat, superviser.nom, "
							+ "commande.point_depart, commande.point_destination, commande.emplacement, "
							+ "commande.date_creation,commande.nom_prenom_destinataire, commande.cin_destinataire, commande.num_telephone_destinataire, "
							+ "commande.monnaie_total_commande, commande.num_agent,commande.num_adherent, commande.idAgentDistination from commande, agent, superviser, client where commande.num_agent= agent.idAgent and client.idC = commande.num_adherent and superviser.idSuperviser = commande.idSuperviseur and commande.id="
							+ Id);
			PreparedStatement preapareStatementForGetAgentDestination = conn.prepareStatement(
					"select agent.zone from agent, commande where agent.idAgent = commande.idAgentDistination and commande.id = "
							+ Id);
			ResultSet resultatStatement = prepareStatements.executeQuery();
			ResultSet resultatStatementForAgentDestination = preapareStatementForGetAgentDestination.executeQuery();
			resultatStatementForAgentDestination.next();
			String zoneAgenceDestination = resultatStatementForAgentDestination.getString(1);
			if(resultatStatement.next()==true){
				
			
			System.out.println("+++" + resultatStatement.getInt(1));
			commande.setId(resultatStatement.getInt(1));
			commande.setTotalCommande(resultatStatement.getString(5));
			commande.setEtat(resultatStatement.getString(6));
			commande.setPoint_depart_commande(resultatStatement.getString(8));
			commande.setPoint_destination(resultatStatement.getString(9));
			commande.setEmplacement(resultatStatement.getString(10));
			commande.setDate_creation(resultatStatement.getString(11));
			commande.setNom_prenom_destinataire(resultatStatement.getString(12));
			commande.setCin_destinataire(resultatStatement.getString(13));
			commande.setNum_telephone_destinataire(resultatStatement.getString(14));
			commande.setMonnaie_total_commande(resultatStatement.getString(15));
			commande.setNumAgent(resultatStatement.getString(16));
			commande.setNumAdherent(resultatStatement.getString(17));
			commande.setIdAgentDistination(resultatStatement.getInt(18));
			agent.setZone(resultatStatement.getString(2));
			client.setIdC(resultatStatement.getInt(3));
			client.setNom(resultatStatement.getString(4));

			String nomSuperviseur = resultatStatement.getString(7);
			informationCommandeWithAgentAndAdherent = new InformationCommandeWithAgentAndAdherent(agent, client,
					commande, nomSuperviseur, zoneAgenceDestination);
			}
			prepareStatements.close();
			preapareStatementForGetAgentDestination.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return informationCommandeWithAgentAndAdherent;
	}

	public void updateCommande(Commande commande) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = con.prepareStatement(
					"update commande set num_agent = ? ,num_adherent = ?, montant_total = ?, idAgentDistination= ?, point_depart = ?, point_destination = ?, date_last_update=? , cin_destinataire=?, 	num_telephone_destinataire=?, nom_prenom_destinataire=?where id = "
							+ commande.getId());
			prepareStatement.setString(1, commande.getNumAgent());
			prepareStatement.setString(2, commande.getNumAdherent());
			prepareStatement.setString(3, commande.getTotalCommande());
			prepareStatement.setInt(4, commande.getIdAgentDistination());
			prepareStatement.setString(5, commande.getPoint_depart_commande());
			prepareStatement.setString(6, commande.getPoint_destination());
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			prepareStatement.setString(7, dateFormat.format(date));
			prepareStatement.setString(8, commande.getCin_destinataire());
			prepareStatement.setString(9, commande.getNum_telephone_destinataire());
			prepareStatement.setString(10, commande.getNom_prenom_destinataire());
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void modifEtatCommande(int idCommande, String etat) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = con
					.prepareStatement("update commande set  etat = ? where id = " + idCommande);
			prepareStatement.setString(1, etat);
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void addIdDistributeurOfCommande(int idCommande, int idDistr) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = con
					.prepareStatement("update commande set  idDistributeur = ? where id = " + idCommande);
			prepareStatement.setInt(1, idDistr);
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateColis(Colis colis) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = con
					.prepareStatement("update colis set nature = ?,poids = ? where id = " + colis.getId());
			prepareStatement.setString(1, colis.getNature());
			prepareStatement.setString(2, colis.getPoids());
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteCommande(int id) {
		Connection con = SingletonConnexion.getCon();

		PreparedStatement prepareStatement, prepareStatement2;
		try {
			prepareStatement2 = con.prepareStatement("delete from colis where id_commande = " + id);
			prepareStatement = con.prepareStatement("delete from commande where id = " + id);
			prepareStatement2.executeUpdate();
			prepareStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Colis> getAllColis() {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<Colis> listeColis = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement("select * from colis ");
			ResultSet rs = prepareStatements.executeQuery();
			while (rs.next()) {
				Colis colis = new Colis();
				colis.setId(rs.getInt(1));
				colis.setNature(rs.getString(2));
				colis.setPoids(rs.getString(3));
				colis.setId_commande(rs.getInt(4));
				listeColis.add(colis);
			}

			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeColis;
	}

	public Colis getColisById(int id) {
		Connection connexion = SingletonConnexion.getCon();
		Colis colis = new Colis();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement("select * from colis where id=" + id);
			ResultSet rs = prepareStatements.executeQuery();
			rs.next();
			colis.setId(rs.getInt(1));
			colis.setNature(rs.getString(2));
			colis.setPoids(rs.getString(3));
			colis.setId_commande(rs.getInt(7));
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return colis;
	}

	public void deleteColis(int id) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("delete from colis where id=" + id);
			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// my add
	public Agent getAgentByUserName(String nom) {
		Connection con = SingletonConnexion.getCon();

		Agent agent = new Agent();
		try {
			PreparedStatement ps = con.prepareStatement("select * from agent where nomA ='" + nom + "'");
			ResultSet rs = ps.executeQuery();
			rs.next();
			agent.setIdS(rs.getInt(1));
			agent.setNom(rs.getString(2));
			agent.setPassword(AES.decrypt(rs.getString(3), secretKey));
			agent.setAdresse(rs.getString(4));
			agent.setDateInsc(rs.getString(5));
			agent.setVille(rs.getString(6));
			agent.setPaye(rs.getString(7));
			agent.setNtele(rs.getString(8));
			agent.setZone(rs.getString(9));
			agent.setIdSuperviseur(rs.getInt(10));
			agent.setEmail(rs.getString(11));
			agent.setPhoto(rs.getBinaryStream("photo"));

			if (agent.getPhoto() != null) {
				agent.setBase64Image(Transfer(rs.getBlob("photo")));
			} else {
				agent.setBase64Image(null);
			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agent;
	}

	// my add
	public Agent getAgentByUserNameTele(String tele) {
		Connection con = SingletonConnexion.getCon();

		Agent agent = new Agent();
		try {
			PreparedStatement ps = con.prepareStatement("select * from agent where NTeleA ='" + tele + "'");
			ResultSet rs = ps.executeQuery();
			rs.next();
			agent.setIdS(rs.getInt(1));
			agent.setNom(rs.getString(2));
			agent.setPassword(AES.decrypt(rs.getString(3), secretKey));
			agent.setAdresse(rs.getString(4));
			agent.setDateInsc(rs.getString(5));
			agent.setVille(rs.getString(6));
			agent.setPaye(rs.getString(7));
			agent.setNtele(rs.getString(8));
			agent.setZone(rs.getString(9));
			agent.setIdSuperviseur(rs.getInt(10));
			agent.setEmail(rs.getString(11));
			agent.setPhoto(rs.getBinaryStream("photo"));

			if (agent.getPhoto() != null) {
				agent.setBase64Image(Transfer(rs.getBlob("photo")));
			} else {
				agent.setBase64Image(null);
			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return agent;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeOfAgent(String etat, int id_agent) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommandeWithAgentAndAdherent = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where num_agent='"
							+ id_agent + "'  and etat ='" + etat
							+ "' and agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();

			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommandeWithAgentAndAdherent
						.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommandeWithAgentAndAdherent;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeOfAgent(int id_agent) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommandeWithAgentAndAdherent = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where num_agent='"
							+ id_agent
							+ "' and agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();

			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommandeWithAgentAndAdherent
						.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommandeWithAgentAndAdherent;
	}

	public ArrayList<Commande> getCommandeOfAgentEntrer(String etat, int id_agent) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<Commande> listeCommande = new ArrayList<>();

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select * from commande where idAgentDistination=" + id_agent + "  and etat ='" + etat + "'");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setNumAdherent(resultatStatement.getString(3));
				commande.setNumAgent(resultatStatement.getString(2));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setIdSuperviseur(resultatStatement.getInt(6));
				commande.setIdDistributeur(resultatStatement.getInt(7));
				commande.setEtat(resultatStatement.getString(5));
				commande.setIdAgentDistination(resultatStatement.getInt(8));
				commande.setId(resultatStatement.getInt(1));
				listeCommande.add(commande);
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public ArrayList<Commande> getCommandeOfClient(String etat, int idClient) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<Commande> listeCommande = new ArrayList<>();

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select * from commande where num_adherent='" + idClient + "'  and etat ='" + etat + "'");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setNumAdherent(resultatStatement.getString(3));
				commande.setNumAgent(resultatStatement.getString(2));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setIdSuperviseur(resultatStatement.getInt(6));
				commande.setIdDistributeur(resultatStatement.getInt(7));
				commande.setEtat(resultatStatement.getString(5));
				commande.setId(resultatStatement.getInt(1));
				commande.setIdAgentDistination(resultatStatement.getInt(8));
				listeCommande.add(commande);
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeOfDistributeur(String etat,
			int idSuperviseur) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommandeWithAgentAndAdherent = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where commande.idSuperviseur="
							+ idSuperviseur + "  and etat ='" + etat
							+ "' and agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();

			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommandeWithAgentAndAdherent
						.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommandeWithAgentAndAdherent;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeATTorEFFOfDistributeur(String etat, int idD) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommandeWithAgentAndAdherent = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where commande.idDistributeur="
							+ idD + "  and etat ='" + etat
							+ "' and agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			System.out.println("h");
			while (resultatStatement.next()) {
				System.out.println("h");
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommandeWithAgentAndAdherent
						.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommandeWithAgentAndAdherent;
	}

	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeATTorEFFOfDistributeurAtt(String etat,
			int idD) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommandeWithAgentAndAdherent = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where commande.idSuperviseur="
							+ idD + "  and etat ='" + etat
							+ "' and agent.idAgent = commande.num_agent and client.idC = commande.num_adherent");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			System.out.println("h");
			while (resultatStatement.next()) {
				System.out.println("h");
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommandeWithAgentAndAdherent
						.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommandeWithAgentAndAdherent;
	}

	public ArrayList<Commande> getCommandeOfSuperviseur(String etat, int idSuper) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<Commande> listeCommande = new ArrayList<>();

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select * from commande where idSuperviseur=" + idSuper + " and etat ='" + etat + "'");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setNumAdherent(resultatStatement.getString(3));
				commande.setNumAgent(resultatStatement.getString(2));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setIdSuperviseur(resultatStatement.getInt(6));
				commande.setIdDistributeur(resultatStatement.getInt(7));
				commande.setEtat(resultatStatement.getString(5));
				commande.setId(resultatStatement.getInt(1));
				commande.setIdAgentDistination(resultatStatement.getInt(8));
				listeCommande.add(commande);
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public ArrayList<Colis> getColisForAgent(int id_agent) {
		Connection con = SingletonConnexion.getCon();
		ArrayList<Colis> listeColis = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement(
					"select colis.id,colis.nature,colis.poids,colis.id_commande from colis, commande where colis.id_commande = commande.id and commande.num_agent='"
							+ id_agent + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Colis colis = new Colis();
				colis.setId(rs.getInt(1));
				colis.setNature(rs.getString(2));
				colis.setPoids(rs.getString(3));
				colis.setId_commande(rs.getInt(4));
				listeColis.add(colis);
			}

			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeColis;
	}
	// my add end

	@Override
	public List<Attente> getListAttRole(String role) {
		Connection con = SingletonConnexion.getCon();
		List<Attente> listAtt = new ArrayList<Attente>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from listattend where role like '" + role + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Attente d = new Attente();
				d.setIdA(rs.getInt(1));
				d.setNom(rs.getString(2));
				d.setPassword(AES.decrypt(rs.getString(3), secretKey));
				d.setZone(rs.getString(4));
				d.setNtele(rs.getString(5));
				d.setVille(rs.getString(6));
				d.setPaye(rs.getString(7));
				d.setDateInsc(rs.getString(8));
				d.setAdresse(rs.getString(9));
				d.setIdSuperviseur(rs.getInt(10));
				d.setEmail(rs.getNString(11));
				d.setRole(rs.getString(12));
				d.setPhoto(rs.getBinaryStream("photo"));

				if (d.getPhoto() != null) {
					d.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					d.setBase64Image(null);
				}

				listAtt.add(d);

			}
			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAtt;
	}

	// client
	@Override
	public ArrayList<InformationCommandeWithAgentAndAdherent> getCommandeClient(int idC) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<InformationCommandeWithAgentAndAdherent> listeCommande = new ArrayList<>();
		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select commande.id, agent.zone, client.nom, commande.montant_total, commande.etat from commande, agent, client where agent.idAgent = commande.num_agent and commande.num_adherent = client.idC and client.idC = "
							+ idC);
			ResultSet resultatStatement = prepareStatements.executeQuery();

			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setEtat(resultatStatement.getString(5));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setId(resultatStatement.getInt(1));
				Agent agent = new Agent();
				agent.setZone(resultatStatement.getString(2));
				Client client = new Client();
				client.setNom(resultatStatement.getString(3));
				listeCommande.add(new InformationCommandeWithAgentAndAdherent(agent, client, commande));
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	@Override
	public Colis getColisByCodeSuivi(String code) {
		Connection connexion = SingletonConnexion.getCon();
		Colis colis = new Colis();
		try {
			PreparedStatement prepareStatements = connexion
					.prepareStatement("select * from colis where code_suivi='" + code + "'");
			ResultSet rs = prepareStatements.executeQuery();
			rs.next();
			colis.setId(rs.getInt(1));
			colis.setNature(rs.getString(2));
			colis.setPoids(rs.getString(3));
			colis.setId_commande(rs.getInt(7));
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return colis;
	}

	public Client getClient(String user) {
		Connection con = SingletonConnexion.getCon();

		Client c = new Client();
		try {
			PreparedStatement ps = con.prepareStatement("select * from client where nom= '" + user + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				c.setIdC(rs.getInt(1));
				c.setNom(rs.getString(2));
				c.setPassword(AES.decrypt(rs.getString(3), secretKey));
				c.setAdresse(rs.getString(8));
				c.setDateInsc(rs.getString(7));
				c.setVille(rs.getString(5));
				c.setPays(rs.getString(6));
				c.setNtele(rs.getString(4));
				c.setEmail(rs.getString(9));
				c.setPhoto(rs.getBinaryStream("photo"));

				if (c.getPhoto() != null) {
					c.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					c.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	public Client getClientTele(String tele) {
		Connection con = SingletonConnexion.getCon();

		Client c = new Client();
		try {
			PreparedStatement ps = con.prepareStatement("select * from client where Ntele= '" + tele + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				c.setIdC(rs.getInt(1));
				c.setNom(rs.getString(2));
				c.setPassword(AES.decrypt(rs.getString(3), secretKey));
				c.setAdresse(rs.getString(8));
				c.setDateInsc(rs.getString(7));
				c.setVille(rs.getString(5));
				c.setPays(rs.getString(6));
				c.setNtele(rs.getString(4));
				c.setEmail(rs.getString(9));
				c.setPhoto(rs.getBinaryStream("photo"));

				if (c.getPhoto() != null) {
					c.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					c.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	public Client getClientEmail(String email) {
		Connection con = SingletonConnexion.getCon();

		Client c = new Client();
		try {
			PreparedStatement ps = con.prepareStatement("select * from client where email= '" + email + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				c.setIdC(rs.getInt(1));
				c.setNom(rs.getString(2));
				c.setPassword(AES.decrypt(rs.getString(3), secretKey));
				c.setAdresse(rs.getString(8));
				c.setDateInsc(rs.getString(7));
				c.setVille(rs.getString(5));
				c.setPays(rs.getString(6));
				c.setNtele(rs.getString(4));
				c.setEmail(rs.getString(9));
				c.setPhoto(rs.getBinaryStream("photo"));

				if (c.getPhoto() != null) {
					c.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					c.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	public Client getClient(int id) {
		Connection con = SingletonConnexion.getCon();

		Client c = new Client();
		try {
			PreparedStatement ps = con.prepareStatement("select * from client where idC= '" + id + "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				c.setIdC(rs.getInt(1));
				c.setNom(rs.getString(2));
				c.setPassword(AES.decrypt(rs.getString(3), secretKey));
				c.setAdresse(rs.getString(8));
				c.setDateInsc(rs.getString(7));
				c.setVille(rs.getString(5));
				c.setPays(rs.getString(6));
				c.setNtele(rs.getString(4));
				c.setEmail(rs.getString(9));
				c.setPhoto(rs.getBinaryStream("photo"));

				if (c.getPhoto() != null) {
					c.setBase64Image(Transfer(rs.getBlob("photo")));
				} else {
					c.setBase64Image(null);
				}

			}

			ps.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public List<Agent> getAllAgence() {
		Connection con = SingletonConnexion.getCon();
		List<Agent> listAgences = new ArrayList<Agent>();
		try {
			PreparedStatement ps = con.prepareStatement("select  zone,lat_agence, long_agence from agent");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if (rs.getDouble(2) != 0 || rs.getDouble(3) != 0) {
					Agent ag = new Agent();

					ag.setZone(rs.getString(1));
					ag.setLat_agence(rs.getDouble(2));
					ag.setLong_agence(rs.getDouble(3));
					listAgences.add(ag);
				}
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAgences;
	}

	public void updateAgent(int id, Agent agent) {
		Connection connexion = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = connexion.prepareStatement(
					"update agent set nomA = ? ,passwordA = ? ,adresseA = ? ,VilleA = ? ,PayA = ? ,NTeleA = ? ,zone = ? ,idSuperviseur = ? ,email = ? ,long_agence = ? ,lat_agence = ? where idAgent = "
							+ id);
			prepareStatement.setString(1, agent.getNom());
			prepareStatement.setString(2, AES.encrypt(agent.getPassword(), secretKey));
			prepareStatement.setString(3, agent.getAdresse());
			prepareStatement.setString(4, agent.getVille());
			prepareStatement.setString(5, agent.getPaye());
			prepareStatement.setString(6, agent.getNtele());
			prepareStatement.setString(7, agent.getZone());
			prepareStatement.setInt(8, agent.getIdSuperviseur());
			prepareStatement.setString(9, agent.getEmail());
			prepareStatement.setDouble(10, agent.getLong_agence());
			prepareStatement.setDouble(11, agent.getLat_agence());

			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateClient(Client client) {
		Connection connexion = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = connexion.prepareStatement(
					"update client set 	nom = ? ,password = ? ,	ville = ? ,pays = ? ,NTele = ? ,adresse = ? , email = ? where idC = "
							+ client.getIdC());
			prepareStatement.setString(1, client.getNom());
			prepareStatement.setString(2, AES.encrypt(client.getPassword(), secretKey));
			prepareStatement.setString(3, client.getVille());
			prepareStatement.setString(4, client.getPays());
			prepareStatement.setString(5, client.getNtele());
			prepareStatement.setString(6, client.getAdresse());
			prepareStatement.setString(7, client.getEmail());
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateSuperviseur(Superviser sup) {
		Connection connexion = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = connexion.prepareStatement(
					"update superviser set 	nom = ? ,password = ? ,	ville = ? ,pays = ? ,NTele = ? ,adresse = ? , email = ? where nom = '"
							+ sup.getNom() + "'");
			prepareStatement.setString(1, sup.getNom());
			prepareStatement.setString(2, AES.encrypt(sup.getPassword(), secretKey));
			prepareStatement.setString(3, sup.getVille());
			prepareStatement.setString(4, sup.getCountry());
			prepareStatement.setString(5, sup.getNtele());
			prepareStatement.setString(6, sup.getAdresse());
			prepareStatement.setString(7, sup.getEmail());
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Commande> getCommandeByEtat(String etat, int num_agent) {
		Connection connexion = SingletonConnexion.getCon();
		ArrayList<Commande> listeCommande = new ArrayList<>();

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select * from commande where etat = '" + etat + "' and num_agent=" + num_agent + "");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Commande commande = new Commande();
				commande.setNumAdherent(resultatStatement.getString(3));
				commande.setNumAgent(resultatStatement.getString(2));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setIdSuperviseur(resultatStatement.getInt(6));
				commande.setIdDistributeur(resultatStatement.getInt(7));
				commande.setEtat(resultatStatement.getString(5));
				commande.setId(resultatStatement.getInt(1));
				commande.setIdAgentDistination(resultatStatement.getInt(8));
				listeCommande.add(commande);
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeCommande;
	}

	public void updateDistributeur(Distributeur distributeur) {
		Connection con = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatement = con.prepareStatement(
					"update distributeur set nom = ? ,email = ?, ville = ?, paye= ?, adresse = ?, 	Ntele = ?, password=? where idD = "
							+ distributeur.getIdD());
			prepareStatement.setString(1, distributeur.getNom());
			prepareStatement.setString(2, distributeur.getEmail());
			prepareStatement.setString(3, distributeur.getVille());
			prepareStatement.setString(4, distributeur.getPaye());
			prepareStatement.setString(5, distributeur.getAdresse());
			prepareStatement.setString(6, distributeur.getNtele());
			prepareStatement.setString(7,AES.encrypt(distributeur.getPassword(), secretKey) );
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getEtatCommandeByIdCommande(int idCommande, int idClient) {
		Connection connexion = SingletonConnexion.getCon();
		String EtatCommande = "";

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement(
					"select etat from commande where num_adherent ='" + idClient + "' and id = " + idCommande);
			ResultSet resultatStatement = prepareStatements.executeQuery();
			if (resultatStatement.next()) {
				return resultatStatement.getString(1);
			} else
				return "Vous n'avez aucune commande avec le code suivant";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EtatCommande;
	}

	public String getEtatCommandeByIdCommande(int idCommande) {
		Connection connexion = SingletonConnexion.getCon();
		String EtatCommande = "";

		try {
			PreparedStatement prepareStatements = connexion
					.prepareStatement("select etat from commande where  id = " + idCommande);

			ResultSet resultatStatement = prepareStatements.executeQuery();
			if (resultatStatement.next()) {
				return resultatStatement.getString(1);
			} else
				return "Vous n'avez aucune commande avec le code suivant";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return EtatCommande;
	}

	public void envoyerReclamation(String reclamation, String client) {
		Connection connexion = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatements = connexion
					.prepareStatement("insert into reclamation(id_client, reclamation) values(?,?)");
			prepareStatements.setString(1, client);
			prepareStatements.setString(2, reclamation);
			prepareStatements.executeUpdate();
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<Reclamation> getAllReclamation() {
		Connection connexion = SingletonConnexion.getCon();
		List<Reclamation> listeReclamation = new ArrayList<>();

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement("select * from reclamation ");
			ResultSet resultatStatement = prepareStatements.executeQuery();
			while (resultatStatement.next()) {
				Reclamation reclamation = new Reclamation();
				reclamation.setId(resultatStatement.getInt(1));
				reclamation.setNom(resultatStatement.getString(2));
				reclamation.setMessage(resultatStatement.getString(3));

				listeReclamation.add(reclamation);
			}
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listeReclamation;

	}

	private String Transfer(Blob b) throws Exception {

		Blob blob = b;

		InputStream inputStream = blob.getBinaryStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead = -1;

		try {
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		byte[] imageBytes = outputStream.toByteArray();

		String base64Image = Base64.getEncoder().encodeToString(imageBytes);

		try {
			inputStream.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			outputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return base64Image;

	}

	public void UpDatePasswordClient(int id, String NewPassword) {
		Connection connexion = SingletonConnexion.getCon();
		String tt=AES.encrypt(NewPassword, secretKey);
		try {
			PreparedStatement prepareStatement = connexion
					.prepareStatement("update client set password = '" + tt + "'  where idC = " + id);
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void UpDatePasswordDistributeur(int id, String NewPassword) {
		Connection connexion = SingletonConnexion.getCon();
		String tt=AES.encrypt(NewPassword, secretKey);

		try {
			PreparedStatement prepareStatement = connexion
					.prepareStatement("update distributeur set password = '" + tt + "'  where idD = " + id);
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void UpDatePasswordAgent(int id, String NewPassword) {
		Connection connexion = SingletonConnexion.getCon();
		String tt=AES.encrypt(NewPassword, secretKey);

		try {
			PreparedStatement prepareStatement = connexion
					.prepareStatement("update agent set passwordA = '" + tt + "'  where idAgent = " + id);
			prepareStatement.executeUpdate();
			prepareStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean verificationExistanceClient(int id){
		Connection connexion = SingletonConnexion.getCon();

		try {
			PreparedStatement prepareStatements = connexion.prepareStatement("select * from client where idC = "+id);
			ResultSet resultatStatement = prepareStatements.executeQuery();
			if(resultatStatement.next()) {
				prepareStatements.close();
				return true; 
			}else {
				prepareStatements.close();
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	 }
	public void deleteReclamation(int id){
		Connection connexion = SingletonConnexion.getCon();
		try {
			PreparedStatement prepareStatements = connexion					 
					.prepareStatement("delete from reclamation where id ="+id);			
			prepareStatements.executeUpdate();
			prepareStatements.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
