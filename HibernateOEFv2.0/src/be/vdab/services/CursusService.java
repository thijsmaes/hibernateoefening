package be.vdab.services;

import java.util.List;

import be.vdab.DAO.CursusDAO;
import be.vdab.entities.Cursus;

public class CursusService {
	private final CursusDAO cursusDAO = new CursusDAO();

	public List<Cursus> findByWoordInNaam(String woord) {
		return cursusDAO.findByWoordInNaam(woord);
	}
}
