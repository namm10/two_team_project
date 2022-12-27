<%@page import="vo.TripVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>

<%
ArrayList<TripVO> list = new ArrayList<TripVO>();

	 if(request.getAttribute("tripList") == null) {
		response.sendRedirect("tripList.do");
	}else {
		list = (ArrayList) request.getAttribute("tripList");
	}
%>

<div class="ui container">
<!--     <div class="visual">
        <img src="./images/logo.jpg" alt="visualImg">
    </div> -->

    <div class="main">
        <h2>영화 후기 보기 (해당 영화를 선택해 주세요.)</h2>

        <div class="tripList">
            <div class="ui link cards unit">
            <%
            for (TripVO vo : list) {
            			String cat = "";
            			
            			switch (vo.getCategory()) {
            				case 1 :
            					cat = "액션";
            					break;
            				case 2 :
            					cat = "로맨스";
            					break;
            				case 3 :
            					cat = "코미디";
            					break;
            				case 4 :
            					cat = "스릴러";
            					break;
            				case 5 :
            					cat = "애니메이션";
            					break;
            			}
            %>
                <div class="card" onclick="location.href = '/reviewList.do?tripNo=<%=vo.getTripNo()%>';">
                    <div class="image">
                        <img src="/images/<%=vo.getImg()%>">
                    </div>

                    <div class="content"> 
                        <div class="header"><%=vo.getTripName() %></div>

                        <div class="meta">
                            <span class="date"><%=cat %></span>
                        </div>

                        <div class="description">
                        	<%=vo.getInfo() %>
                        </div>
                    </div>

                    <div class="extra content">
                        <span class="right floated">
                       	<%=vo.getRuntime() %>분
                        </span>

                        <span>
                            <i class="user icon"></i>
                            No: <%=vo.getTripNo() %>
                        </span>
                    </div>
                </div>
            <% } %>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>