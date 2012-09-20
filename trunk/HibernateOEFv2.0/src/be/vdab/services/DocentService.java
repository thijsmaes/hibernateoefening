package be.vdab.services;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;

import javax.persistence.OptimisticLockException;
import javax.persistence.RollbackException;

import be.vdab.DAO.CampusDAO;
import be.vdab.DAO.DocentDAO;
import be.vdab.entities.Campus;
import be.vdab.entities.Docent;
import be.vdab.exceptions.DocentNietGevondenException;
import be.vdab.exceptions.EmailAdresAlInGebruikException;
import be.vdab.exceptions.RecordAangepastException;
import be.vdab.util.VoornaamInfo;




public class DocentService {
	private final DocentDAO docentDAO = new DocentDAO();
	private CampusDAO campusDAO = new CampusDAO();

	public Docent read(long docentNr) {
		return docentDAO.read(docentNr);

		// EntityManager entityManager = JPAFilter.getEntityManager();
		// try {
		// return docentDAO.read(docentNr, entityManager);
		// } finally {
		// entityManager.close();
		// }
	}

	public void create(Docent docent) {

		if (docentDAO.findByEmailAdres(docent.getEmailAdres()) != null) {
			throw new EmailAdresAlInGebruikException();
		}
		docentDAO.beginTransaction();
		docentDAO.create(docent);
		docentDAO.commit();

		/*
		 * EntityManager entityManager = JPAFilter.getEntityManager(); try {
		 * entityManager.getTransaction().begin(); docentDAO.create(docent,
		 * entityManager); entityManager.getTransaction().commit(); } catch
		 * (RuntimeException ex) { entityManager.getTransaction().rollback();
		 * throw ex; } finally { entityManager.close(); }
		 */
	}

	public void delete(long docentNr) {
		docentDAO.beginTransaction();
		docentDAO.delete(docentNr);
		docentDAO.commit();

		/*
		 * EntityManager entityManager = JPAFilter.getEntityManager(); try {
		 * entityManager.getTransaction().begin(); docentDAO.delete(docentNr,
		 * entityManager); entityManager.getTransaction().commit(); } catch
		 * (RuntimeException ex) { entityManager.getTransaction().rollback();
		 * throw ex; } finally { entityManager.close(); }
		 */
	}

	public void opslag(long docentNr, BigDecimal percentage){
		docentDAO.beginTransaction();
		Docent docent = docentDAO.read(docentNr);
		if (docent == null) {
			throw new DocentNietGevondenException();
		}
		docent.opslag(percentage);
		try{
			docentDAO.commit();
		}catch (RollbackException ex){
			if(ex.getCause() instanceof OptimisticLockException){
				throw new RecordAangepastException();
			}
		}	

		/*
		 * EntityManager entityManager = JPAFilter.getEntityManager(); try {
		 * entityManager.getTransaction().begin(); Docent docent =
		 * docentDAO.read(docentNr, entityManager); if (docent == null) { throw
		 * new DocentNietGevondenException(); } docent.opslag(percentage);
		 * //entityManager.merge(docent);
		 * 
		 * System.out.println(entityManager.getFlushMode());
		 * entityManager.getTransaction().commit(); } catch (RuntimeException
		 * ex) { entityManager.getTransaction().rollback(); throw ex; } finally
		 * { entityManager.close(); }
		 */
}

	public List<Docent> findByWedde(BigDecimal van, BigDecimal tot,
			int vanafRij, int aantalRijen) {
		return docentDAO.findByWedde(van, tot/* , vanafRij, aantalRijen */);
	}

	public List<VoornaamInfo> findVoornamen() {
		return docentDAO.findVoornamen();
	}

	public BigDecimal findMaxWedde() {
		return docentDAO.findMaxWedde();
	}

	public int algemeneOpslag(BigDecimal percentage, BigDecimal totEnMetWedde) {
		BigDecimal factor = BigDecimal.ONE.add(percentage
				.divide(new BigDecimal(100)));
		docentDAO.beginTransaction();
		int aantalDocentenAangepast = docentDAO.algemeneOpslag(factor,
				totEnMetWedde);
		docentDAO.commit();
		return aantalDocentenAangepast;
	}

	public void bijnaamToevoegen(long docentNr, String bijnaam) {
		docentDAO.beginTransaction();
		Docent docent = docentDAO.read(docentNr);
		if (docent == null) {
			throw new DocentNietGevondenException();
		}
		docent.addBijnaam(bijnaam);
		docentDAO.commit();
	}

	public void bijnamenVerwijderen(long docentNr, String[] bijnamen) {
		docentDAO.beginTransaction();
		Docent docent = docentDAO.read(docentNr);
		if (docent == null) {
			throw new DocentNietGevondenException();
		}
		for (String bijnaam : bijnamen) {
			docent.removeBijnaam(bijnaam);
		}
		docentDAO.commit();
	}

	public List<Docent> find(String beginFamilienaam, long campusNr) {
		Campus campus = campusDAO.read(campusNr);
		if (campus == null) {
			return Collections.emptyList();
		}
		return docentDAO.findByFamilienaamEnCampus(beginFamilienaam, campus);
	}

}
