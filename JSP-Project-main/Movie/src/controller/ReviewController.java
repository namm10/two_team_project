package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDAO;
import dao.ReviewDAO;
import vo.TripVO;
import vo.ReviewVO;

public class ReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {
		
	int category = 0;
		
		if (req.getParameter("tripNo") != null) {
			category = Integer.parseInt(req.getParameter("tripNo"));
		}
		
		TripDAO instance = TripDAO.getInstance();
		ArrayList<TripVO> tripList = instance.selectCategory(category);

		req.setAttribute("tripList", tripList);
		req.getRequestDispatcher("/view/review.jsp").forward(req, resp);
		
	}

}
