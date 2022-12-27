package controller;

import java.io.IOException;

import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import vo.ReviewVO;

public class ReviewInsertController  implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServerException, IOException, ServletException {
		String id = req.getParameter("userId");
		String txt = req.getParameter("txt");
		int No = Integer.parseInt(req.getParameter("No"));
		
		ReviewDAO instance = ReviewDAO.getInstance();
		instance.insertReview(txt, id, No);
		
		String dis = "/reviewList.do?No=" + No;
		req.getRequestDispatcher(dis).forward(req, resp);
	}

}
