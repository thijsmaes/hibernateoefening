package be.vdab.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import be.vdab.entities.Campus;

public class CampusDAO extends AbstractDAO {

	public List<Campus> findByGemeente(String gemeente) {
		TypedQuery<Campus> query = getEntityManager().createNamedQuery(
				"findCampussenByGemeente", Campus.class);
		query.setParameter("gemeente", gemeente);
		return query.getResultList();
	}

	public List<Campus> findAll() {
		TypedQuery<Campus> query = getEntityManager().createNamedQuery(
				"findCampussen", Campus.class);
		return query.getResultList();
	}

	public Campus read(long campusNr) {
		return getEntityManager().find(Campus.class, campusNr);
	}
}
