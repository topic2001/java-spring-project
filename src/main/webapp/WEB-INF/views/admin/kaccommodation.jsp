<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/kstyle.css">
<link rel="stylesheet" href="resources/css/kstyle2.css" /> <!-- table용 -->

<script src="https://kit.fontawesome.com/d730d6aca1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>Insert title here</title>
</head>
<body>
    <div class="wrapper">
        <div class="header_wrapper">
            <div class="header_title">
               <div class="click" onclick="location.href='${pageContext.request.contextPath}/main';">
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
	                    <a class="here" href="kaccommodation">업체 등록</a>
                    	<a href="kmember">회원 관리</a>
	                    <a href="kinquiry">1:1 문의 관리</a>
                    </c:if>
                    <a href="kreservation">예약 관리</a>
                    <a href="kreview">리뷰 관리</a>
                    
                </div>
                <div class="sidebar_footer">
                    <p>Logged in as:</p>
                    <p>Start Bootstrap</p>
                </div>
            </div>
            <div class="sidebar_right">
                    <div class="three col" onclick="content_size()">
                    <div class="hamburger" id="hamburger-1">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                </div>
            </div>
			<div class="content" id="contentid">
				<div class="content_title">업체 등록</div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> 업체 정보
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>업체번호</th>
                                    <th>업체이름</th>
                                    <th>업종</th>
                                    <th>도시</th>
                                    <th>지역코드</th>
                                    <th>등급</th>
                                    <th>수영장</th>
                                    <th>조식</th>
                                    <th>평점</th>
                                    <th>사우나</th>
                                    <th>피트니스시설</th>
                                    <th>와이파이</th>
                                    <th>주소</th>
                                    <th>위도</th>
                                    <th>경도</th>
                                    <th>골프장</th>
                                    <th>스파</th>
                                    <th>미니바</th>
                                    <th>냉방시설</th>
                                    <th>반려동물</th>
                                    <th>흡연구역</th>
                                    <th>발렛파킹</th>
                                    <th>위치정보</th>
                                    <th>이벤트&공지</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ACC_CODE</th>
                                    <th>ACC_NAME</th>
                                    <th>ACC_TYPE</th>
                                    <th>ACC_CITY</th>
                                    <th>ACC_DIST</th>
                                    <th>ACC_GRADE</th>
                                    <th>ACC_POOL</th>
                                    <th>ACC_BRE</th>
                                    <th>ACC_RATING</th>
                                    <th>ACC_SAUNA</th>
                                    <th>ACC_PUFIT</th>
                                    <th>ACC_WIFI</th>
                                    <th>ACC_ADDR</th>
                                    <th>ACC_LATITUDE</th>
                                    <th>ACC_LONGITUDE</th>
                                    <th>ACC_GOLF</th>
                                    <th>ACC_SPA</th>
                                    <th>ACC_MINIBAR</th>
                                    <th>ACC_AIRCON</th>
                                    <th>ACC_PET</th>
                                    <th>ACC_SMOKING</th>
                                    <th>ACC_VALET</th>
                                    <th>ACC_ADDRINFO</th>
                                    <th>ACC_EVENT</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            	<c:forEach items="${acc }" var="acc">
	                                <tr>
	                                    <td>${acc.ACC_CODE }</td>
	                                    <td>${acc.ACC_NAME }</td>
	                                    <td>${acc.ACC_TYPE }</td>
	                                    <td>${acc.ACC_CITY }</td>
	                                    <td>${acc.ACC_DIST }</td>
	                                    <td>${acc.ACC_GRADE }</td>
	                                    <td>${acc.ACC_POOL }</td>
	                                    <td>${acc.ACC_BRE }</td>
	                                    <td>${acc.ACC_RATING }</td>
	                                    <td>${acc.ACC_SAUNA }</td>
	                                    <td>${acc.ACC_PUFIT }</td>
	                                    <td>${acc.ACC_WIFI }</td>
	                                    <td>${acc.ACC_ADDR }</td>
	                                    <td>${acc.ACC_LATITUDE }</td>
	                                    <td>${acc.ACC_LONGITUDE }</td>
	                                    <td>${acc.ACC_GOLF }</td>
	                                    <td>${acc.ACC_SPA }</td>
	                                    <td>${acc.ACC_MINIBAR }</td>
	                                    <td>${acc.ACC_AIRCON }</td>
	                                    <td>${acc.ACC_PET }</td>
	                                    <td>${acc.ACC_SMOKING }</td>
	                                    <td>${acc.ACC_VALET }</td>
	                                    <td>${acc.ACC_ADDRINFO }</td>
	                                    <td>${acc.ACC_EVENT }</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="write_form"> 
	               <form action="acc_write" method="post" >
                       <div class="input_title">
                           <i class="fas fa-table me-1"></i> 업체 등록
                       </div>
                        <table>
	                        <tr>
                                <th>업체이름</th>
                                <th>업종</th>
                                <th>도시</th>
                                <th>지역코드</th>
                                <th>등급</th>
                                <th>수영장</th>
                                <th>조식</th>
                                <th>평점</th>
                                <th>사우나</th>
                                <th>피트니스시설</th>
                                <th>와이파이</th>
                                <th>주소</th>
                                <th>위도</th>
                                <th>경도</th>
                                <th>골프장</th>
                                <th>스파</th>
                                <th>미니바</th>
                                <th>냉방시설</th>
                                <th>반려동물</th>
                                <th>흡연구역</th>
                                <th>발렛파킹</th>
                                <th>위치정보</th>
                                <th>이벤트&공지</th>
	                        </tr>
	                        <tr>
	                            <td><input type="text" name="acc_name" /></td>
	                            <td><input type="text" name="acc_type" /></td>
	                            <td><input type="text" name="acc_city" /></td>
	                            <td><input type="text" name="acc_dist" /></td>
	                            <td><input type="text" name="acc_grade" /></td>
	                            <td><input type="text" name="acc_pool" /></td>
	                            <td><input type="text" name="acc_bre" /></td>
	                            <td><input type="text" name="acc_rating" /></td>
	                            <td><input type="text" name="acc_sauna" /></td>
	                            <td><input type="text" name="acc_pufit" /></td>
	                            <td><input type="text" name="acc_wifi" /></td>
	                            <td><input type="text" name="acc_addr" /></td>
	                            <td><input type="text" name="acc_latitude" /></td>
	                            <td><input type="text" name="acc_longitude" /></td>
	                            <td><input type="text" name="acc_golf" /></td>
	                            <td><input type="text" name="acc_spa" /></td>
	                            <td><input type="text" name="acc_minibar" /></td>
	                            <td><input type="text" name="acc_aircon" /></td>
	                            <td><input type="text" name="acc_pet" /></td>
	                            <td><input type="text" name="acc_smoking" /></td>
	                            <td><input type="text" name="acc_valet" /></td>
	                            <td><input type="text" name="acc_addrinfo" /></td>
	                            <td><input type="text" name="acc_event" /></td>
	                        </tr>
	                   </table>
	                   <input type="submit" value="입력" />
	               </form> 
                </div>
                 <div class="write_form"> 
	               <form action="main_photo" method="post" enctype="multipart/form-data">
                       <div class="input_title">
                           <i class="fas fa-table me-1"></i> 업체 메인사진 등록
                       </div>
                        <table>
	                        <tr>
	                        	<th>업체번호</th>
                                <th>메인사진1</th>
                                <th>메인사진2</th>
	                        </tr>
	                        <tr>
	                        	<td><input type="text" name="acc_code" /></td>
	                            <td><label><input type="file" name="upload" /></label></td>
	                            <td><label><input type="file" name="upload" /></label></td>
	                   </table>
	                   <input type="submit" value="입력" />
	               </form> 
                </div>
                <div class="write_form"> 
	               <form action="room_write" method="post" enctype="multipart/form-data">
                       <div class="input_title">
                           <i class="fas fa-table me-1"></i> 방 & 사진 등록
                       </div>
                        <table>
	                        <tr>
                                <th>업체번호</th>
                                <th>방 타입</th>
                                <th>방 가격</th>
                                <th>방사진1</th>
	                        </tr>
	                        <tr>
	                            <td><input type="text" name="acc_code" /></td>
	                            <td><input type="text" name="room_type" /></td>
	                            <td><input type="text" name="room_price" /></td>
	                            <td><label><input type="file" name="upload" /></label></td>
	                   </table>
	                   <input type="submit" value="입력" />
	               </form> 
                </div>
			</div>
		</div>
        <div class="footer_wrapper">
        	
        </div>
	</div>
	<script src="resources/script/kscript.js" defer></script>
	
	<!-- table용  2개-->
	<script src="resources/script/kscript2.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
</body>
</html>