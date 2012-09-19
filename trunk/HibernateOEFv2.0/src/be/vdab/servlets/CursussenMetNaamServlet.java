package be.vdab.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.vdab.entities.Cursus;
import be.vdab.services.CursusService;

@WebServlet("/cursussen/metnaam.htm")
public class CursussenMetNaamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/WEB-INF/JSP/cursussen/metnaam.jsp";
	private final CursusService cursusService = new CursusService();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String woord = request.getParameter("woord");
		if (woord != null) {
			if (woord.isEmpty()) {
				request.setAttribute("fouten", Arrays.asList("Woord verplicht"));
			} else {
				List<Cursus> cursussen = cursusService.findByWoordInNaam(woord);
				if (cursussen.isEmpty()) {
					request.setAttribute("fouten", Arrays.asList("Geen cursussen gevonden"));
				} else {
					request.setAttribute("cursussen", cursussen);
					}
			}
		}
		request.getRequestDispatcher(VIEW).forward(request, response);
	}
}
