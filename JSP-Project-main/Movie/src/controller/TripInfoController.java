package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDAO;
import vo.ScheduleVO;
import vo.TripVO;

public class TripInfoController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {		
		if (req.getParameter("tripNo") != null) {
			int tripNo = Integer.parseInt(req.getParameter("tripNo"));
			
			TripDAO instance = TripDAO.getInstance();
			//선택한 영화의 정보를 받아옴
			TripVO tripInfo = instance.tripInfo(tripNo);
			//선택한 영화의 상영시간 스케줄을 받아옴
			ArrayList<ScheduleVO> scheduleAList = instance.scheduleAList(tripNo);
			
			if(scheduleAList != null) {
				req.setAttribute("tripInfo", tripInfo);
				req.setAttribute("scheduleAList", scheduleAList);
				req.getRequestDispatcher("/view/tripInfo.jsp").forward(req, resp);	
			}
		}		
	}

}
