package models;

public class Reclamation {
	private String Nom;
	private String Message;
	private int Id;
	
	public Reclamation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNom() {
		return Nom;
	}
	public void setNom(String nom) {
		Nom = nom;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	@Override
	public String toString() {
		return "Reclamation [Nom=" + Nom + ", Message=" + Message + ", Id=" + Id + "]";
	}
	public Reclamation(String nom, String message) {
		super();
		Nom = nom;
		Message = message;
	}


}
