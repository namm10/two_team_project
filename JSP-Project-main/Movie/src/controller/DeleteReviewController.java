package controller;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;

public class DeleteReviewController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServerException, IOException, ServletException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		int tripNo = Integer.parseInt(req.getParameter("tripNo"));
		if(num != 0) {
			ReviewDAO instance = ReviewDAO.getInstance();
			instance.deleteReview(num,tripNo);
		}
		
		req.getRequestDispatcher("/reviewList.do?tripNo="+tripNo).forward(req, resp);
	}

}

/*
 * <a href= * "/deleteReview.do?num=${reviewList.num}&user=${user.getId()}&tripNo=${reviewList.tripNo}">
 */
