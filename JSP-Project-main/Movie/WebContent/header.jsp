<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 예매</title>
<link rel="stylesheet" href="/lib/style.css">
<link rel="stylesheet" type="text/css" href="/lib/semantic.min.css">
<style type="text/css">
	#top{
		width: 1920px;
		margin:0 auto;
		background-color: red;
	}
	.menu{
		width: 1100px;
		margin: auto;
	}
	.fon:hover{
		font-weight: bold;
	}
	.item{
		border: none;
	}
</style>
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="/lib/semantic.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head class="top">
<%
	MemberVO user = (MemberVO) session.getAttribute("user");
	int userStatus = 0;
	
	if(user != null) {
		if(user.getId() != null) {
			userStatus = 1;
		}
	}
%>



<body>

<div class="ui container">
	<header>		
		<div class="ui menu">
			<div class="item ">
    			<div class="ui blue button" onclick="location.href = '/';">HOME</div>
  			</div>
  			
  			<div class="item box">
  				<a class="fon" href="/tripList.do?cat_no=1">자연 체험</a>
  			</div>
  			
  			<div class="item">
  				<a class="fon" href="/tripList.do?cat_no=2">동물 체험</a>
  			</div>
  			
  			<div class="item">
  				<a class="fon" href="/tripList.do?cat_no=3">공예 체험</a>
  			</div>
  			
  			<div class="item">
  				<a class="fon" href="/board/listArticles.do">Q &amp; A</a>
  			</div>
  			<div class="item">
  				<a class="fon" href="/review.do">후기</a>
  			</div>
			
<%			
			if(userStatus == 1) {
				if(user.getId().equals("admin")){
%>

			<div class="right item">
				<p style="margin: 0 15px;"><%=user.getId() %>님</p>
				<div class="ui primary button" onclick="location.href = '/view/register.jsp';">영화 추가</div>
			</div>
					  			
			<div class="item">
				<div class="ui button" onclick="location.href = '/view/myTickets.jsp';">전체 예메목록</div>
			</div>
					  			
			<div class="item">
				<div class="ui button" onclick="swal('Success', '로그아웃 성공', 'success').then((val) => {location.href = '/view/logout.jsp';});">로그아웃</div>
			</div>
<%			
				} else {
%>

			<div class="right item">
				<p style="margin: 0 15px;"><%=user.getId() %>님</p>
    			<div class="ui primary button" onclick="location.href = '/view/myTickets.jsp';">내 예메목록</div>
  			</div>
  			
 			<div class="item">
   				<div class="ui button" onclick="swal('Success', '로그아웃 성공', 'success').then((val) => {location.href = '/view/logout.jsp';});">로그아웃</div>
 			</div>

<%
				}
			} else {
%>
			<div class="right item">
    			<div class="ui primary button" onclick="location.href = '/view/register.jsp';">회원가입</div>
  			</div>
  			
 			<div class="item">
   				<div class="ui button" onclick="location.href = '/view/login.jsp';">로그인</div>
 			</div>
<%
			}
%>
		</div>
	</header>
</div>