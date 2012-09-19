package be.vdab.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import be.vdab.entities.Manager;

public class ManagerDAO extends AbstractDAO {
	public Manager read(long managerNr) {
		return getEntityManager().find(Manager.class, managerNr);
	}

	public List<Manager> findAll() {
		TypedQuery<Manager> query = getEntityManager().createNamedQuery(
				"findManagers", Manager.class);
		return query.getResultList();
	}
}
