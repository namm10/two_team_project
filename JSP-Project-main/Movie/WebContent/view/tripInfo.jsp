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
	ArrayList<ScheduleVO> schList = new ArrayList<ScheduleVO>();
	
	if(request.getAttribute("tripInfo") == null) {
		response.sendRedirect("/");
	}else {
		tripInfo = (TripVO) request.getAttribute("tripInfo");
		schList = (ArrayList) request.getAttribute("scheduleAList");
	}
	
	String cat = "";
	String img = "";
%>
<style>
	body{position: relative;}
    .calendar {
        grid-area: a;
        text-align:center; border: 1px solid #eaeaea; 
        position: absolute;
        top:450px; right:20%;
        }
    .calendar td { width:60px;height:50px; line-height: 50px; }
    .calendar td:hover{font-weight: bold;}
    .calendar thead td{font-weight: bold;}
    .calendar .calendar_tit td { }
    .calendar .calendar_days td { }
    .calendar .choiceDay{
        background-color: #af28fe;
        color: #ffffff;
    }
    .tip{text-align: right;, margin-top:100px; }
    .tripImage{width:50%;  margin-bottom:30px;}
    .tab{
    	background-color: #5c8acc;
    	
    }
    .sub_tab{
    	background-color: #3965ae;
    }
    .box1{
    	text-indent: 10px;
    }
    .box2{
    	text-indent: 20px;
    }
    .box3{
    	text-indent: 20px;
    }
</style>
<script>
document.addEventListener("DOMContentLoaded", function () {
    buildCalendar();
});

var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date(); // @param 전역 변수, today의 Date를 세어주는 역할

/* @brief   이전달 버튼 클릭 */
function prevCalendar() {
    this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    buildCalendar(); // @param 전월 캘린더 출력 요청
}

/* @brief   다음달 버튼 클릭 */
function nextCalendar() {
    this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    buildCalendar(); // @param 명월 캘린더 출력 요청
}

/**
 * @brief   캘린더 오픈
 * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
 */
function buildCalendar() {

    let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

    let tbCalendar = document.querySelector(".calendar > tbody");

    document.getElementById("calYear").innerText = today.getFullYear(); // @param YYYY월
    document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2); // @param MM월


    // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
    while (tbCalendar.rows.length > 0) {
        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
    }

    // @param 첫번째 개행
    let row = tbCalendar.insertRow();

    // @param 날짜가 표기될 열의 증가값
    let dom = 1;

    // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
    //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
    let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

    // @param 달력 출력
    // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
    for (let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

        let column = row.insertCell();

        // @param 평일( 전월일과 익월일의 데이터 제외 )
        if (Math.sign(day) == 1 && lastDate.getDate() >= day) {

            // @param 평일 날짜 데이터 삽입
            column.innerText = autoLeftPad(day, 2);

            // @param 일요일인 경우
            if (dom % 7 == 1)
                column.style.color = "#FF4D4D";

            // @param 토요일인 경우
            if (dom % 7 == 0) {
                column.style.color = "#4D4DFF";
                row = tbCalendar.insertRow(); // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
            }
        }

        // @param 평일 전월일과 익월일의 데이터 날짜변경
        else {
            let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
            column.innerText = autoLeftPad(exceptDay.getDate(), 2);
            column.style.color = "#A9A9A9";
        }

        // @brief   전월, 명월 음영처리
        // @details 현재년과 선택 년도가 같은경우
        if (today.getFullYear() == date.getFullYear()) {

            // @details 이번달과 선택월이 같은경우
            if (today.getMonth() == date.getMonth()) {

                // @details 오늘보다 이전인 경우이면서 이번달에 포함되는 일인경우
                if (date.getDate() > day && Math.sign(day) == 1)
                    column.style.backgroundColor = "#c5c5c5";

                // @details 오늘보다 이후이면서 이번달에 포함되는 일인경우
                else if (date.getDate() < day && lastDate.getDate() >= day) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function() {calendarChoiceDay(this);}
                }

                // @details 오늘인 경우
                else if (date.getDate() == day) {
                    column.style.backgroundColor = "#FFFFE6";
                    column.style.cursor = "pointer";
                    column.onclick = function() {calendarChoiceDay(this);}
                }

                // @details 이번달보다 이전인경우
            } else if (today.getMonth() < date.getMonth()) {
                if (Math.sign(day) == 1 && day <= lastDate.getDate())
                    column.style.backgroundColor = "#c5c5c5";
            }

            // @details 이번달보다 이후인경우
            else {
                if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function() {calendarChoiceDay(this);}

                }
            }
        }

        // @details 선택한년도가 현재년도보다 작은경우
        else if (today.getFullYear() < date.getFullYear()) {
            if (Math.sign(day) == 1 && day <= lastDate.getDate())
                column.style.backgroundColor = "#c5c5c5";
        }

        // @details 선택한년도가 현재년도보다 큰경우
        else {
            if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                column.style.backgroundColor = "#FFFFFF";
                column.style.cursor = "pointer";
                column.onclick = function() {calendarChoiceDay(this);}
            }
        }
        dom++;
    }
}

/**
 * @brief   날짜 선택
 * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
 */
function calendarChoiceDay(column) {
    let selYear = document.getElementById("calYear").innerText;
    let selMonth = document.getElementById("calMonth").innerText;
    let selDay = column.innerText;

    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
    if (document.getElementsByClassName("choiceDay")[0]) {
        document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
        document.getElementsByClassName("choiceDay")[0].style.color = "#000000";
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
    }


    // @param 선택일 체크 표시
    column.style.backgroundColor = "#af28fe";
    column.style.color = "#ffffff";
    column.location,href="tripList.do";
    // @param 선택일 클래스명 변경
    column.classList.add("choiceDay");

    document.getElementById("cal_getYear").value =
        selYear;
    document.getElementById("cal_getMonth").value =
        selMonth;
    document.getElementById("cal_getDay").value =
        selDay;
}

/**
 * @brief   숫자 두자릿수( 00 ) 변경
 * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
 * @param   num     앞에 0을 붙일 숫자 값
 * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
 */
function autoLeftPad(num, digit) {
    if (String(num).length < digit) {
        num = new Array(digit - String(num).length + 1).join("0") + num;
    }
    return num;
}
</script>

<div class="ui container">
    <div class="main">
        <h2>체험 정보</h2>

		<table class="ui inverted violet table tripInfoTable">
			<thead class="tab">
				<tr >
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

		<h2>시간 선택</h2>
		<p class="tip">Tip: 원하는 시간대에 클릭하면 좌석 선택 페이지로 이동됩니다.</p>

		<div class="tripInfoBox">
			<div>
				<img class="tripImage" src="/images/<%=img%>" alt="<%=img%>">
			</div>

			<div class="calendar_wrap">
			<table class="calendar">
				<thead>
					  <tr class="calendar_tit">
					      <td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
					      <td colspan="5">
					            <span id="calYear">YYYY</span>년
					        	<span id="calMonth">MM</span>월
					      </td>
					      <td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
					  </tr>
					  <tr class="calendar_days">
					      <td>일</td>
					      <td>월</td>
					      <td>화</td>
					      <td>수</td>
					      <td>목</td>
					      <td>금</td>
					      <td>토</td>			        
					  </tr>
				</thead>
				<tbody></tbody>
				</table>
			</div>
			<div class="rightBox">
				<table class="ui inverted blue table">
					<thead class="tab">
						<tr>
							<th>스케줄 번호</th>
							<th>체험 날짜</th>
							<th>체험 시간</th>
							<th>체험 장소</th>
							<th>잔여 인원</th>
						</tr>
					</thead>
					<tbody  class="sub_tab">
						<%
						for (ScheduleVO item : schList) {
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (HH시 mm분)");
							String datetime = sdf.format(item.getRunDay());
						%>
						<tr onclick="location.href = '/chooseSeat.do?schNo=<%=item.getSchNo()%>&roomNo=<%=item.getRoomNo() %>';">
							<td>No.<%=item.getSchNo() %></td>
							<td><%=datetime %></td>
							<td class="box1"><%=item.getRuntime() %>분</td>				
							<td class="box2"><%=item.getRoomNo() %></td>
							<td class="box3"><%=25 - item.getSeatCnt() %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		</div>
    </div>
</div>

<%@ include file="../footer.jsp" %>