<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/kstyle.css">
<link rel="stylesheet" href="resources/css/kstyle2.css" />
<!-- table용 -->

<script src="https://kit.fontawesome.com/d730d6aca1.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="header_wrapper">
			<div class="header_title">
				<div class="click"
					onclick="location.href='${pageContext.request.contextPath}/main';">
					<i class="fas fa-concierge-bell"></i>
					<h3>저기어때</h3>
				</div>
			</div>
			<div class="header_logout">
				<div class="dropdown">
					<i class="fas fa-user-circle dropbtn"></i>
					<div class="dropdown-content">
						<a href="logout">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<div class="body_wrapper">
			<div class="sidebar">
				<div class="sidebar_menu">
					<c:if test="${loginUser.mem_access == 0 }">
						<a href="kadmin_page">Dashboard</a>
						<a href="kaccommodation">업체 등록</a>
						<a href="kmember">회원 관리</a>
						<a class="here" href="kinquiry">1:1 문의 관리</a>
					</c:if>
					<a href="kreservation">예약 관리</a> <a href="kreview">리뷰 관리</a>
				</div>
				<div class="sidebar_footer">
					<p>Logged in as:</p>
					<p>Start Bootstrap</p>
				</div>
			</div>
			<div class="sidebar_right">
				<div class="three col" onclick="content_size()">
					<div class="hamburger" id="hamburger-1">
						<span class="line"></span> <span class="line"></span> <span
							class="line"></span>
					</div>
				</div>
			</div>
			<div class="content" id="contentid">
				<div class="content_title">1:1 문의 관리</div>
				<div class="write_form">
					<form action="inre_write?seq=${inq_re.SEQ }" method="post">
						<div class="input_title">
							<i class="fas fa-table me-1"></i> INQUIRY REPLY input
						</div>
						<input type="hidden" id="user" value="${inq_re.UEMAIL }" /> <input
							type="hidden" id="email_" value="${inq_re.EMAIL }" />
						<table>
							<tr>
								<th>SEQ</th>
								<th>UEMAIL</th>
								<th>EMAIL</th>
								<th>PHONE</th>
								<th>ROOM_TYPE</th>
								<th>INQUIRY_TYPE</th>
								<th>INQUIRY_CONTENT</th>
								<th>WRITE_DAY</th>
								<th>REIN_INQUIRY</th>
								<th>REIN_REGDATE</th>
							</tr>
							<tr>
								<td>${inq_re.SEQ }</td>
								<td>${inq_re.UEMAIL }</td>
								<td>${inq_re.EMAIL }</td>
								<td>${inq_re.PHONE }</td>
								<td>${inq_re.ROOM_TYPE }</td>
								<td>${inq_re.INQUIRY_TYPE }</td>
								<td>${inq_re.INQUIRY_CONTENT }</td>
								<td>${inq_re.WRITE_DAY }</td>
								<td>${inq.REIN_INQUIRY }</td>
								<td>${inq.REIN_REGDATE }</td>
							</tr>
							<tr>
								<td colspan="10">제휴점 답변 작성 or 수정: <input id="content"
									type="text" name="inre_content" style="width: 60rem" /> <input
									type="button" onclick="send_reply()" value="입력" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="footer_wrapper"></div>
	</div>
	<script src="resources/script/kscript.js" defer></script>

	<!-- table용  2개-->
	<script src="resources/script/kscript2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script>
		function send_reply() {
			user = document.getElementById('user').value;

			var a = {
				"email" : $("#email_").val(),
				"content" : $("#content").val()
			};
			$.ajax({
				url : "reply_send",
				type : "post",
				data : a,
				success : function(result) {
					$('form').submit();
				},
				error : function(request, error) {
					alert("답변 전송 실패");
				}
			})

		}
	</script>
</body>
</html>