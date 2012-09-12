package be.vdab.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="docenten")
public class Docent implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private long docentNr;
	private String voornaam;
	private String familienaam;
	private BigDecimal wedde;
	protected Docent (){
		
	}
	public Docent (String voornaam, String familienaam, BigDecimal wedde){
		setVoornaam(voornaam);
		setFamilienaam(familienaam);
		setWedde(wedde);
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
	
	public void opslag (BigDecimal percentage){
		BigDecimal factor = BigDecimal.ONE.add(percentage.divide(new BigDecimal(100)));
		wedde = wedde.multiply(factor).setScale(2, RoundingMode.HALF_UP);
	}
	
	public String getNaam(){
		return voornaam + " " + familienaam;
	}
	
	@Override
	public String toString(){
		return docentNr + ":" + voornaam + " " + familienaam;
	}
	
}
