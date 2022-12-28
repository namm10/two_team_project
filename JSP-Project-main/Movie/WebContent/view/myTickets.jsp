<%@page import="java.util.ArrayList"%>
<%@page import="vo.TicketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>
<style>
	.tab{background-color:#5c8acc;}
	.sub_tab{background-color:#3965ae;}
	.res{
		margin-left:300px;
		margin-top:100px;
		margin-bottom:100px;
	}
	.box1{
		text-indent: 25px;
	}
	.box2{
		text-indent: 15px;
	}
	.box3{
		text-indent: 20px;
	}
	.box4{
		text-indent: 20px;
	}
	
	.boxx1{
		text-indent: 70px;
	}
	.boxx2{
		text-indent: 13px;
	}
	
</style>
<c:if test="${myTicket==null }">
	<c:redirect url="/myTicket.do?user=${user.getId()}"></c:redirect>
</c:if>

<div class="ui container">
	<div class="res">
		<img src="images/logo2.png">
	</div>
	
    <div class="main" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
	<c:choose>
		<c:when test="${myUser eq 'admin' }">
			<h2>전체 예약 목록(관리자 모드)</h2>
		</c:when>
		<c:otherwise>
			<h2>${user.getId()}님의 예약 목록</h2>
		</c:otherwise>
	</c:choose>
	
		<table class="ui inverted pink table">
			<thead class="tab">
				<tr>
					<th>NO.</th>
					<th>체험 종류</th>
					<th class="boxx1">체험 날짜</th>
					<th>스케줄 번호</th>
					<th>체험장소</th>
					<th>구역 번호</th>
					<th>회원아이디</th>
					<th>예약 취소</th>
				</tr>
			</thead>
			<tbody class="sub_tab">
				<c:forEach var="item" items="${myTicket }">
					<fmt:formatDate var="runDayandDate" value="${item.bookDate }" pattern="yyyy년 MM월 dd일 (HH시 mm분)"/>
					<tr>
						<td>${item.ticketNo}</td>
						<td class="boxx2">${item.tripName}</td>
						<td>${runDayandDate}</td>
						<td class="box1">${item.schNo}번</td>
						<td class="box2">${item.roomNo}</td>
						<td class="box3">${item.seatNo}</td>
						<td class="box4">${item.id}</td>
						<td>
							<div class="item">
    							<div class="ui blue button" onclick="location.href = '/deleteTicket.do?ticketNo=${item.ticketNo}&user=${myUser}&schNo=${item.schNo}';">예약 취소</div>
  							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>


<%@ include file="../footer.jsp" %>