package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDAO;
import vo.TripVO;

public class TripListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {
		int category = 0;
		
		if (req.getParameter("cat_no") != null) {
			category = Integer.parseInt(req.getParameter("cat_no"));
		}
		
		TripDAO instance = TripDAO.getInstance();
		ArrayList<TripVO> tripList = instance.selectCategory(category);

		req.setAttribute("tripList", tripList);
		req.getRequestDispatcher("/view/tripList.jsp").forward(req, resp);
		
	}

}
