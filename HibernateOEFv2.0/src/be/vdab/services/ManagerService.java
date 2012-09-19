package be.vdab.services;

import java.util.List;

import be.vdab.DAO.ManagerDAO;
import be.vdab.entities.Manager;

public class ManagerService {
	private final ManagerDAO managerDAO = new ManagerDAO();

	public Manager read(long managerNr) {
		return managerDAO.read(managerNr);
	}

	public List<Manager> findAll() {
		return managerDAO.findAll();
	}
}
