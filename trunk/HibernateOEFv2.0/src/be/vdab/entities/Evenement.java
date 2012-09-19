package be.vdab.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "evenementen")
public class Evenement implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@TableGenerator(name = "EvenementGenerator", table = "hoogstevolgnrs", pkColumnName = "Naam", valueColumnName = "HoogsteVolgNr", pkColumnValue = "EvenementenNr ")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "EvenementGenerator")
	private long id;
	@Temporal(TemporalType.DATE)
	private Date datum;
	private String titel;
}
