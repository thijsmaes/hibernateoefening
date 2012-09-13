package be.vdab.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.vdab.services.DocentService;

/**
 * Servlet implementation class DocentVerwijderenServlet
 */
@WebServlet("/docenten/verwijderen.htm")
public class DocentVerwijderenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String REDIRECT_URL = "/";
	private final DocentService docentService = new DocentService();

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		docentService.delete(Long.parseLong(request.getParameter("docentNr")));
		response.sendRedirect(response.encodeRedirectUrl(request.getContextPath() + REDIRECT_URL));
	}
}
