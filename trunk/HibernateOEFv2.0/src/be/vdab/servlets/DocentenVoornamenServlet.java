package be.vdab.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.vdab.services.DocentService;

/**
 * Servlet implementation class DocentenVoornamenServlet
 */
@WebServlet("/docenten/voornamen.htm")
public class DocentenVoornamenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/WEB-INF/JSP/docenten/voornamen.jsp";
	private final DocentService docentService = new DocentService();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("voornamen", docentService.findVoornamen());
		request.getRequestDispatcher(VIEW).forward(request, response);
	}
}
