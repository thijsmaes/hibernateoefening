package be.vdab.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.*;

import be.vdab.enums.Geslacht;
import be.vdab.valueobjects.EmailAdres;

@Entity
/*
 * @NamedQuery(name = "findDocentenByWedde", query =
 * "select d from Docent d where d.wedde between " +
 * ":van and :tot order by d.wedde,d.docentNr")
 */
@Table(name = "docenten")
public class Docent implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private long docentNr;
	private String voornaam;
	private String familienaam;
	private BigDecimal wedde;
	@Enumerated(EnumType.STRING)
	private Geslacht geslacht;
	@ElementCollection
	@CollectionTable(name = "docentenbijnamen", joinColumns = @JoinColumn(name = "docentNr"))
	@Column(name = "Bijnaam")
	private Set<String> bijnamen;
	@Embedded
	private EmailAdres emailAdres;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CampusNr")
	private Campus campus;
	
	@ManyToMany(mappedBy = "docenten")
	private Set<Verantwoordelijkheid> verantwoordelijkheden;
	
	@Version
	private Timestamp versie;
	
	public Campus getCampus() {
		return campus;
	}

	public void setCampus(Campus campus) {
		if (this.campus != null && this.campus.getDocenten().contains(this)) {
			this.campus.removeDocent(this);
		}
		this.campus = campus;
		if (campus != null && !campus.getDocenten().contains(this)) {
			campus.addDocent(this);
		}
	}

	public long getDocentNr() {
		return docentNr;
	}

	public void setDocentNr(long docentNr) {
		this.docentNr = docentNr;
	}

	public Geslacht getGeslacht() {
		return geslacht;
	}

	public void setGeslacht(Geslacht geslacht) {
		this.geslacht = geslacht;
	}

	protected Docent() {

	}

	public Docent(String voornaam, String familienaam, BigDecimal wedde,
			Geslacht geslacht, EmailAdres emailAdres) {
		setVoornaam(voornaam);
		setFamilienaam(familienaam);
		setWedde(wedde);
		setGeslacht(geslacht);
		bijnamen = new HashSet<String>();
		setEmailAdres(emailAdres);
		verantwoordelijkheden = new LinkedHashSet<Verantwoordelijkheid>();
	}

	public void setEmailAdres(EmailAdres emailAdres) {
		this.emailAdres = emailAdres;
	}

	public EmailAdres getEmailAdres() {
		return emailAdres;
	}

	public String getVoornaam() {
		return voornaam;
	}

	public void setVoornaam(String voornaam) {
		this.voornaam = voornaam;
	}

	public String getFamilienaam() {
		return familienaam;
	}

	public void setFamilienaam(String familienaam) {
		this.familienaam = familienaam;
	}

	public BigDecimal getWedde() {
		return wedde;
	}

	public void setWedde(BigDecimal wedde) {
		this.wedde = wedde;
	}

	public void opslag(BigDecimal percentage) {
		BigDecimal factor = BigDecimal.ONE.add(percentage
				.divide(new BigDecimal(100)));
		wedde = wedde.multiply(factor).setScale(2, RoundingMode.HALF_UP);
	}

	public String getNaam() {
		return voornaam + " " + familienaam;
	}

	@Override
	public String toString() {
		return docentNr + ":" + voornaam + " " + familienaam;
	}

	public Set<String> getBijnamen() {
		// return bijnamen;
		return Collections.unmodifiableSet(bijnamen);
	}

	public void addBijnaam(String bijnaam) {
		bijnamen.add(bijnaam);
	}

	public void removeBijnaam(String bijnaam) {
		bijnamen.remove(bijnaam);
	}

	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Docent)) {
			return false;
		}
		return ((Docent) obj).emailAdres.equals(this.emailAdres);
	}

	@Override
	public int hashCode() {
		return emailAdres.hashCode();
	}

	public void addVerantwoordelijkheid(
			Verantwoordelijkheid verantwoordelijkheid) {
		verantwoordelijkheden.add(verantwoordelijkheid);
		if (!verantwoordelijkheid.getDocenten().contains(this)) {
			verantwoordelijkheid.addDocent(this);
		}
	}

	public void removeVerantwoordelijkheid(
			Verantwoordelijkheid verantwoordelijkheid) {
		verantwoordelijkheden.remove(verantwoordelijkheid);
		if (verantwoordelijkheid.getDocenten().contains(this)) {
			verantwoordelijkheid.removeDocent(this);
		}
	}
									
	public Set<Verantwoordelijkheid> getVerantwoordelijkheden() {
		return Collections.unmodifiableSet(verantwoordelijkheden);
	}
}
