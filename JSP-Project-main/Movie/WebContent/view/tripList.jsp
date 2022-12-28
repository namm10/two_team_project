<%@page import="vo.TripVO"%>
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
    <div class="main">
        <h2>전체 체험 목록</h2>

        <div class="TripList">
            <div class="ui link cards unit">
            <%
				for (TripVO vo : list) {
					String cat = "";
					
					switch (vo.getCategory()) {
						case 1 :
							cat = "자연 체험";
							break;
						case 2 :
							cat = "동물 체험";
							break;
						case 3 :
							cat = "공예 체험";
							break;
						
					}
			%>
                <div id="ddd" class="card l_image" onclick="location.href = '/tripInfo.do?tripNo=<%=vo.getTripNo()%>';">
                    <div class="image">
                        <img class="ddd" src="/images/<%=vo.getImg()%>">
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
                <div>
                    
                </div>
            <% } %>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>