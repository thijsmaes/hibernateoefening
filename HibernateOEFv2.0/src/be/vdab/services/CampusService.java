package be.vdab.services;

import java.util.List;

import be.vdab.DAO.CampusDAO;
import be.vdab.DAO.ManagerDAO;
import be.vdab.entities.Campus;
import be.vdab.entities.Manager;
import be.vdab.exceptions.CampusNietGevondenException;
import be.vdab.exceptions.ManagerNietGevondenException;

public class CampusService {
	private final CampusDAO campusDAO = new CampusDAO();
	private final ManagerDAO managerDAO = new ManagerDAO();

	public List<Campus> findByGemeente(String gemeente) {
		return campusDAO.findByGemeente(gemeente);
	}

	public List<Campus> findAll() {
		return campusDAO.findAll();
	}

	public Campus read(long campusNr) {
		return campusDAO.read(campusNr);
	}

	public void kenManagerToe(long campusNr, long managerNr) {
		campusDAO.beginTransaction();
		Campus campus = campusDAO.read(campusNr);
		if (campus == null) {
			throw new CampusNietGevondenException();
		}
		Manager manager = managerDAO.read(managerNr);
		if (manager == null) {
			throw new ManagerNietGevondenException();
		}
		campus.setManager(manager);
		campusDAO.commit();
	}
}
