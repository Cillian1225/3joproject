package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PeopleDAO;
import dto.PeopleDTO;


@WebServlet("*.person")


public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		System.out.println("요청된 연결 : " + url);
		
		try {
			
			PersonDAO dao = PersonDAO.getInstance();
			
			if(url.contentEquals("/personInput.person")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String name = request.getParameter("name");
				String contact = request.getParameter("contact");
				
				int result = dao.insert(id, name, contact, null);
				request.getRequestDispatcher("index.jsp").forward(request, response);

			} else if(url.contentEquals("/personList.person")) {
				List<PersonDTO> list = dao.getAll();
				request.setAttribute("list", list);
				request.getRequestDispatcher("personList.jsp").forward(request, response);
				
			} else if(url.contentEquals("/personDelete.person")) {
				int id = Integer.parseInt(request.getParameter("id"));
				int result = dao.delete(id);
				response.sendRedirect("personDelete.jsp");
				
			} else if(url.contentEquals("/personModify.person")) {
				List<PersonDTO> list = dao.getAll();
				
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("person/modify.jsp").forward(request, response);
				
			} else if(url.contentEquals("/modifyProc.person")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String name = request.getParameter("name");
				String contact = request.getParameter("contact");
				
				int result = dao.modify(id);
				request.setAttribute("result", result);

				request.getRequestDispatcher("person/modify.jsp").forward(request, response);
			}
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
