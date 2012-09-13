package be.vdab.DAO;

import javax.persistence.EntityManager;

import be.vdab.entities.Docent;
import be.vdab.filters.JPAFilter;

public class DocentDAO {
	public Docent read(long docentNr, EntityManager entityManager){
		entityManager = JPAFilter.getEntityManager();
		try{
			return entityManager.find(Docent.class, docentNr);
		}finally{
			entityManager.close();
		}
	}
	
	public void create(Docent docent, EntityManager entityManager){
		entityManager.persist(docent);
	}
	
	public void delete(long docentNr, EntityManager entityManager){
		Docent docent = entityManager.find(Docent.class, docentNr);
		if (docent!=null){
			entityManager.remove(docent);
		}
	}
	
}
