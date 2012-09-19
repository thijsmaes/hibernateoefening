package be.vdab.entities;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "verantwoordelijkheden")
public class Verantwoordelijkheid implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private long verantwoordelijkheidNr;
	private String naam;

	public long getVerantwoordelijkheidNr() {
		return verantwoordelijkheidNr;
	}

	public void setVerantwoordelijkheidNr(long verantwoordelijkheidNr) {
		this.verantwoordelijkheidNr = verantwoordelijkheidNr;
	}

	public String getNaam() {
		return naam;
	}

	public void setNaam(String naam) {
		this.naam = naam;
	}

	// je maakt zelf getters voor verantwoordelijkheidNr en naam
	// je maakt zelf een setter voor naam
	public Verantwoordelijkheid(String naam) {
		setNaam(naam);
		docenten = new HashSet<Docent>();
	}

	protected Verantwoordelijkheid() { // default constructor voor JPA
	}

	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Verantwoordelijkheid)) {
			return false;
		}
		return ((Verantwoordelijkheid) obj).naam.equalsIgnoreCase(this.naam);
	}

	@Override
	public int hashCode() {
		return naam.toUpperCase().hashCode();
	}

	@Override
	public String toString() {
		return verantwoordelijkheidNr + ":" + naam;
	}

	@ManyToMany
	@JoinTable(name = "docentenverantwoordelijkheden", joinColumns = @JoinColumn(name="VerantwoordelijkheidNr"),
	inverseJoinColumns = @JoinColumn(name = "DocentNr"))
	private Set<Docent> docenten;

	public void addDocent(Docent docent) {
		docenten.add(docent);
		if (!docent.getVerantwoordelijkheden().contains(this)) {
			docent.addVerantwoordelijkheid(this);
		}
	}

	public void removeDocent(Docent docent) {
		docenten.remove(docent);
		if (docent.getVerantwoordelijkheden().contains(this)) {
			docent.removeVerantwoordelijkheid(this);
		}
	}

	public Set<Docent> getDocenten() {
		return Collections.unmodifiableSet(docenten);
	}
}
