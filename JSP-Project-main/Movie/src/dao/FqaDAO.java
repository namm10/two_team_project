package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.FqaVO;

public class FqaDAO {
	
	private FqaDAO() {
	}

	private static FqaDAO instance = new FqaDAO();

	public static FqaDAO getInstance() {
		return instance;
	}
	
	
	//리뷰 목록 불러오기
	public ArrayList<FqaVO> reviewList(int movieNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<FqaVO> list = new ArrayList<FqaVO>();
		try {
			conn = JdbcUtil.getConnection();

			String query = "select * from  fqa where movieNo=? order by num desc";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String content = rs.getString("content");
				Date writedate = rs.getDate("writedate");
				FqaVO fqaVO = new FqaVO(num, id, content, writedate);
				list.add(fqaVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//DB 객체 반환
			JdbcUtil.close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public void insertReview(String txt, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement("INSERT INTO faq VALUES(?, ?, ?, ?, SYSDATE)");
			pstmt.setString(2, id);
			pstmt.setString(3, txt);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt, conn);
		}
		
	}
	
	public int maxReviewNum(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int number=0;
		try {
			conn = JdbcUtil.getConnection();
			String query = "select max(num) from  fqa where num=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				number = rs.getInt(1);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs, pstmt, conn);
		}
		
		return number;
	}
	
	public void deleteReview(int num,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement("delete from reviews where id = ? And num=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
			/*
			 * int pos = pstmt.executeUpdate(); if(pos > 0) { pstmt = conn.
			 * prepareStatement("UPDATE dayroom SET seatCnt = seatCnt - 1 WHERE schNo = ?");
			 * pstmt.setInt(1, schNo); 
			 * pstmt.executeUpdate(); }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt, conn);
		}
	}
	
}



