package be.vdab.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import be.vdab.entities.Cursus;

public class CursusDAO extends AbstractDAO {

	public List<Cursus> findByWoordInNaam(String woord) {
		TypedQuery<Cursus> query = getEntityManager().createNamedQuery(
				"findCursussenByWoordInNaam", Cursus.class);
		query.setParameter("zoals", '%' + woord + '%');
		return query.getResultList();
	}
}
