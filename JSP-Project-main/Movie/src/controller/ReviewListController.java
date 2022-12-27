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
import vo.ScheduleVO;

public class ReviewListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {		
		
	
	if (req.getParameter("tripNo") != null) {
		int tripNo = Integer.parseInt(req.getParameter("tripNo"));
		/* int pageNo = Integer.parseInt(req.getParameter("pageNo")); */
		
		TripDAO instance = TripDAO.getInstance();
		ReviewDAO instance1 = ReviewDAO.getInstance();
		TripVO tripInfo = instance.tripInfo(tripNo);
		ArrayList<ReviewVO> reviewList = instance1.reviewList(tripNo);
		int num = instance1.maxReviewNum(tripNo);
		
		
		if(reviewList != null) {
			req.setAttribute("mn", tripNo);
			req.setAttribute("num", num);
			req.setAttribute("tripInfo", tripInfo);
			req.setAttribute("list", reviewList);
			req.getRequestDispatcher("/view/reviewList.jsp").forward(req, resp);
		}
	}
}
}
