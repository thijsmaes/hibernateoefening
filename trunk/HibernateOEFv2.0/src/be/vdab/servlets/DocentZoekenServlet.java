package be.vdab.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.vdab.DAO.DocentDAO;
import be.vdab.entities.Docent;
import be.vdab.services.DocentService;

/**
 * Servlet implementation class DocentZoekenServlet
 */
@WebServlet("/docenten/zoeken.htm")
public class DocentZoekenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/WEB-INF/JSP/docenten/zoeken.jsp";
	private final DocentService docentService = new DocentService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (! request.getParameterMap().isEmpty()){
			List<String> fouten = new ArrayList<String>();
			try{
				long docentNr = Long.parseLong(request.getParameter("docentNr"));
				Docent docent = docentService.read(docentNr);
				if(docent==null){
					fouten.add("Docent niet gevonden");
				} else{
					request.setAttribute("docent", docent);
				}
			}catch (NumberFormatException ex){
				fouten.add("tik een getal");
			}
			if (!fouten.isEmpty()){
				request.setAttribute("fouten", fouten);
			}
		}
		request.getRequestDispatcher(VIEW).forward(request, response);
	}
}
