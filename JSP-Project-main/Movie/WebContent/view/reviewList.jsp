<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="vo.TripVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>

<%
TripVO tripInfo = new TripVO();
	
	if(request.getAttribute("tripInfo") == null) {
		response.sendRedirect("/");
	}else {
		tripInfo = (TripVO) request.getAttribute("tripInfo");
	}
	
	String cat = "";
	String img = "";
%>
<style>
	.dang{
		margin-left: 170px;
	}
	.tab{
    	background-color: #5c8acc;
    	
    }
    .sub_tab{
    	background-color: #3965ae;
    }

</style>

<script>
 		function counter(){
  		document.getElementById("counting").innerHTML = document.getElementById("txt").value.length; 
  		if(document.getElementById("txt").value.length>50){
  			alert('50자 이내로 입력해 주세요');
  			}
 		}
 	
 		function btn_reg(){
 		    alert('로그인 후 이용 바랍니다.');
 		   location.href="/view/login.jsp"
 		}
 		
 		
 		
</script>

<div class="ui container">
    <div class="main">
        <h2>체험 정보</h2>

		<table class="ui inverted violet table tripInfoTable">
			<thead class="tab">
				<tr>
					<th>체험 번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>체험 정보</th>
				</tr>
			</thead>
			<tbody>
				<%
					img = tripInfo.getImg();
					
					switch (tripInfo.getCategory()) {
					case 1:
						cat = "자연 체험";
						break;
					case 2:
						cat = "동물 체험";
						break;
					case 3:
						cat = "공예 체험";
						break;
					
					
					}
				%>
				<tr class="sub_tab">
					<td>No.<%=tripInfo.getTripNo()%></td>
					<td><%=cat%></td>
					<td><%=tripInfo.getTripName()%></td>
					<td><%=tripInfo.getInfo()%></td>
				</tr>
			</tbody>
		</table>

		<h2>체험 후기</h2>
		

		<div class="tripInfoBox">
			<div class="leftBox">
				<img class="dang" src="/images/<%=img%>" alt="<%=img%>">
			</div>

			<div class="rightBox">
			<p >${num}개의 후기</p>
				<hr style="border: solid 1px black;">
				<c:set var="userId" value="${user.getId()}" />
					
					<c:if test="${userId == null }">
						<form name="review" action="#">
						<div style="font-size:15px; padding:5px;"> --- 님</div>
							<textarea style="resize: none;width:100%;" name="txt" id="txt" placeholder="로그인 후 이용해주세요" disabled ></textarea>
			
 							<div class="item" >
 								<div style="float:left;">
 									<span style="color:#aaa;" id="counting">0</span>/50자
 								</div>
								<div style="float:right; display:inline-block; hegiht:50px">
									<button  type="button" class="" id="registerBtn" onclick="javascript:btn_reg()">등록</button>
								</div>
							</div>
							<br>
							
						</form>
					</c:if>
					
					<c:if test="${userId != null }">
					<form name="review" action="/reviewInsert.do?userId=${user.getId()}&tripNo=${mn}" method="post">
					<div style="font-size:15px; padding:5px;"> ${user.getId()}님</div>
						<textarea style="resize: none;width:100%;" name="txt" id="txt" placeholder="후기를 입력하세요" onkeyup="counter()" ></textarea>
 						<div class="item" >
 								<div style="float:left;">
 									<span style="color:#aaa;" id="counting">0</span>/50자
 								</div>
								<div style="float:right; display:inline-block; hegiht:50px">
									<button  type="submit" class="" id="registerBtn">등록</button>
								</div>
							</div>
							<br>
					</form>
					</c:if>
			
					<table class="ui inverted blue table">
						<tr>
							<th>No.</th>
							<th>작성자</th>
							<th>리뷰내용</th>
							<th>작성일</th>
							<th>삭제</th>
						</tr>
						
						<c:forEach var="reviewList" items="${list }">
						<tr>
							<td>${reviewList.num} </td>				
							<td>${reviewList.id} </td>
							<td style="text-align : left ;table-layout:fixed ;max-width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
								${reviewList.content}
							</td>
							<td>${reviewList.writedate }</td>
							<c:choose>
								<c:when test="${ reviewList.id == user.getId()}">
									<td><button style="color:blue; background:white; font-size:0.5em; border-radius:1em; padding:5px 20px;" onclick="location.href = '/deleteReview.do?num=${reviewList.num}&tripNo=${reviewList.tripNo}';">삭제</button>
									</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						
						</c:forEach> 
						
					</table>
					
				<c:forEach var="pageNo" begin="1" end="${num/5+1 }" step="1">
						<a href="/view/reviewList.do?pageNo=${pageNo }"> ${pageNo}</a>
				</c:forEach>
			</div>
		</div>
    </div>
</div>



<%@ include file="../footer.jsp" %>