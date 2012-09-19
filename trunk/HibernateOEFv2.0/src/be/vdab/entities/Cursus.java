package be.vdab.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.TableGenerator;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
// @Table(name = "cursussen")
// @DiscriminatorColumn(name = "Soort")
public abstract class Cursus {
	private static final long serialVersionUID = 1L;
	@Id
	// @GeneratedValue
	@TableGenerator(name = "CursusGenerator",
			table = "hoogstevolgnrs",
			pkColumnName = "Naam",
			valueColumnName = "HoogsteVolgNr",
			pkColumnValue = "CursussenNr ")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "CursusGenerator")	
	private long cursusNr;
	private String naam;

	protected Cursus() { 
	}

	
	@Override
	public String toString() {
		return cursusNr + ":" + naam;
	}


	public String getNaam() {
		return naam;
	}


	public void setNaam(String naam) {
		this.naam = naam;
	}
}
