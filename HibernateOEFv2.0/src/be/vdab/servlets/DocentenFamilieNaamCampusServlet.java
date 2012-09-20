package be.vdab.servlets;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.vdab.services.CampusService;
import be.vdab.services.DocentService;

/**
 * Servlet implementation class DocentenFamilieNaamCampusServlet
 */
@WebServlet("/docenten/familienaamcampus.htm")
public class DocentenFamilieNaamCampusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/WEB-INF/JSP/docenten/familienaamcampus.jsp";
	private final DocentService docentService = new DocentService();
	private final CampusService campusService = new CampusService();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("campussen", campusService.findAll());
		if (!request.getParameterMap().isEmpty()) {
			if (request.getParameter("campussen") == null) {
				request.setAttribute("fouten", Arrays.asList("Kies een campus"));
			} else {
				request.setAttribute("docenten", docentService.find(request.getParameter("familienaam"),
						Long.parseLong(request.getParameter("campussen"))));
			}
		}
		request.getRequestDispatcher(VIEW).forward(request, response);
	}
}
