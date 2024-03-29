<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>hotel</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="resources/script/myplace.js?ver=28"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3402980874dd067df556619596251323&libraries=services,clusterer,drawing"></script>

<link rel="stylesheet" href="resources/css/myplace.css?ver=139" />
<link href="resources/dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
<script src="resources/dist/js/datepicker.js"></script>
<script src="resources/dist/js/i18n/datepicker.ko.js"></script>
</head>

<body id="bodyclass" class="aa">
	<div class="header_margin"></div>
	<form onsubmit="changedate3();" class="all">
		<div class="" id="map-modal-container">


			<div class="modar-container" id="map-container"></div>
			<div class="addr-container" id="addrmodal-container">
				<div class="addr-search-input">
					<input
						onkeypress="if(event.keyCode=='13'){event.preventDefault(); addr_search();}"
						type="text" id="addr-search-form" class="addr-searchform" />
					<button class="addr-search2" type="button" onclick="addr_search();">검색</button>
				</div>
				<div class="addr-search-btn">
					<button class="addr-search" type="submit" onclick="addr_change();">적용하기</button>
				</div>

			</div>
			<div class="order-container" id="order-container">
				<ul class="order-mdal">
					<li>
						<button type="submit" onclick="distance_();" type="button">거리
							순</button>
					</li>
					<li>
						<button type="submit" onclick="lowprice_();" type="button">낮은
							가격 순</button>
					</li>
					<li>
						<button type="submit" onclick="highprice_();" type="button">높은
							가격 순</button>
					</li>
				</ul>
				<button class="order-modar-close" onclick="closeMap()" type="button">취소</button>
			</div>

			<div class="" id="map-modal-bg" onclick="closeMap()"></div>
		</div>



		<input type="hidden" id="user_latitude" value="${latitude }"
			name="user_latitude"> <input type="hidden"
			id="user_longitude" value="${longitude }" name="user_longitude">

		<nav id="bodyclass3" class="navbar bg-dark">
			<div id="bodyclass4" class="container">
				<div>
					<h1 class="title">내주변</h1>
					<div class="dropdown">
						<button onclick="openaddr();" type="button" id="dist_text"
							value="${dist }" class="dropbtn2">내 위치 설정하기</button>
						<input type="hidden" id="dist_send" name="dist" value="${dist }" />

					</div>
				</div>
				<div class="datepick">
					<div class="date-font">날짜</div>
					<div>
						<input readonly id="date_text2" type="text" data-range="true"
							data-multiple-dates-separator=" - " data-language="ko"
							class="datepicker-here" />

					</div>
					<div>
						<input class="serch-button" type="submit" value="검색" />
					</div>
				</div>
			</div>

		</nav>
		<div class="swipe_menu_wrap">
			<!--  <div class="swipe_menu">
     	<a href="myplace?type='hotel'">호텔</a>  <a href="myplace?type='motel'">모텔 </a>	<a href="myplace?type='pension'">펜션 </a>
      </div> -->
		</div>
		<div id="bodyclass10" class="container" style="margin-top: 30px">
			<div id="bodyclass5" class="row">
				<div id="bodyclass7" class="button_wrap">
					<button type="button" class="button_item" id="show_detail"
						onclick="class_change()">상세조건</button>
					<button id="ordertext" type="button" onclick="openOrder();"
						class="button_item">추천 순</button>
					<button type="button" onclick="openMap();" class="button_item">지도</button>

				</div>
				<div class="col-sm-4" id="bodyclass9">

					<div class="sm-4_form">
						<div class="sel_checkbox1">


							<p class="form_main_title">날짜</p>
							<div class="checkin">
								<input readonly id="date_text1" name="date" type="text"
									data-range="true" onchange="date_change(this.value)"
									data-multiple-dates-separator=" - " data-language="ko"
									class="datepicker-here" />


							</div>
							<hr />
							<p class="form_main_title">상세조건</p>
						</div>
						<div class="sel_checkbox2">
							<div id="detail_form">
								<button type="button" class="out_detail"
									onclick="removeFooClass();">X</button>
								<div class="btn_group">
									<button class="btn clear" type="reset" onclick="reset_all()">초기화</button>
									<button type="submit" class="btn apply" onclick="map_apply">적용</button>
								</div>
							</div>


							<div class="sub_col">
								<p>
									<input type="checkbox" />예약가능
								</p>
								<p>
									<input type="checkbox" />프로모션
								</p>
							</div>
							<div class="sub_check">
								<div class="sub_col">
									<p class="form_title">호텔유형</p>
									<div class="sub_col">
										<p>
											<input id="${fivestar}" name="grade" value="fivestar"
												type="checkbox" />5성급
										</p>
										<p>
											<input id="${fspecial}" name="grade" value="fspecial"
												type="checkbox" />특1급
										</p>
										<p>
											<input id="${special}" name="grade" value="special"
												type="checkbox" />특급
										</p>
									</div>
								</div>
								<div class="sub_col">
									<p class="form_title">펜션유형</p>
									<div class="sub_col">
										<p>
											<input id="${pension}" name="grade" value="pension"
												type="checkbox" />펜션
										</p>
										<p>
											<input id="${poolvilla}" name="grade" value="poolvilla"
												type="checkbox" />풀빌라
										</p>
										<p>
											<input id="${luxury}" name="grade" value="luxury"
												type="checkbox" />럭셔리
										</p>
									</div>
								</div>
							</div>
							<p class="form_title">
								인원<input id="minus" type="button" value="-"
									onclick="calc_go('-')" /><span id="res">2</span><input
									id="plus" type="button" value="+" onclick="calc_go('+')" /> <input
									type="hidden" value="2" id="person" name="person">

							</p>
							<p class="form_title">베드 타입</p>
							<div class="bed">
								<div class="singleroom" onclick="singleroom()">
									<input value="SINGLEROOM" name="bedtype" type="checkbox"
										id="box1"> <img id="img1"
										src="resources/img/single-black.png" alt="">
									<p id="text1">싱글</p>
								</div>
								<div class="doubleroom" onclick="doubleroom()">
									<input value="DOUBLEROOM" name="bedtype" type="checkbox"
										id="box2"> <img id="img2"
										src="resources/img/double-black.png" alt="">
									<p id="text2">더블</p>
								</div>
								<div class="twinroom" onclick="twinroom()">
									<input value="TWINROOM" name="bedtype" type="checkbox"
										id="box3"> <img id="img3"
										src="resources/img/twin-black.png" alt="">
									<p id="text3">트윈</p>
								</div>
								<div class="ondolroom" onclick="ondolroom()">
									<input value="ONDOLROOM" name="bedtype" type="checkbox"
										id="box4"> <img id="img4"
										src="resources/img/ondol-black.png" alt="">
									<p id="text4">온돌</p>
								</div>
							</div>
							<p class="form_title">공용시설</p>
							<div class="sub_check">
								<div class="sub_col">


									<p>
										<input id="${acc_pufit}" name="checklist" value="acc_pufit"
											type="checkbox" /> 피트니스
									</p>
									<p>
										<input id="${acc_sauna}" name="checklist" value="acc_sauna"
											type="checkbox" /> 사우나
									</p>
								</div>
								<div class="sub_col">
									<p>
										<input id="${acc_pool}" name="checklist" value="acc_pool"
											type="checkbox" /> 수영장
									</p>
									<p>
										<input id="${acc_golf}" name="checklist" value="acc_golf"
											type="checkbox" /> 골프장
									</p>
								</div>
							</div>
							<p class="form_title">객실 내 시설</p>
							<div class="sub_check">
								<div class="sub_col">
									<p>
										<input id="${acc_spa}" name="checklist" value="acc_spa"
											type="checkbox" /> 객실스파
									</p>
									<p>
										<input id="${acc_wifi}" name="checklist" value="acc_wifi"
											type="checkbox" /> 와이파이
									</p>
								</div>
								<div class="sub_col">
									<p>
										<input id="${acc_minibar}" name="checklist"
											value="acc_minibar" type="checkbox" /> 미니바
									</p>
									<p>
										<input id="${acc_aircon}" name="checklist" value="acc_aircon"
											type="checkbox" /> 에어컨
									</p>
								</div>
							</div>
							<p class="form_title">기타</p>
							<div class="sub_check">
								<div class="sub_col">
									<p>
										<input id="${acc_pet}" name="checklist" value="acc_pet"
											type="checkbox" />반려견동반
									</p>
									<p>
										<input id="${acc_smoking}" name="checklist"
											value="acc_smoking" type="checkbox" /> 객실내흡연
									</p>
								</div>
								<div class="sub_col">
									<p>
										<input id="${acc_bre}" name="checklist" value="acc_bre"
											type="checkbox" /> 조식포함
									</p>
									<p>
										<input id="${acc_valet}" name="checklist" value="acc_valet"
											type="checkbox" /> 발렛파킹
									</p>

								</div>
							</div>

						</div>
					</div>

				</div>

				<div id="bodyclass6" class="col-sm-8">
					<div class="icon-bar">
						<button type="submit" id="distance" value="distance"
							onclick="distance_();">거리 순</button>
						<button type="submit" id="lowprice" value="lowprice"
							onclick="lowprice_();">낮은 가격 순</button>
						<button type="submit" id="highprice" value="highprice"
							onclick="highprice_();">높은 가격 순</button>
						<button type="button" class="map" onclick="openMap();">
							<i class="fa fa-globe"></i> 지도
						</button>
						<input id="order_" type="hidden" name="order" value="" />
					</div>
	</form>
	<c:forEach items="${hotel }" var="hotel">
		<form action="kdetail_page" id="${hotel.acc_code }">
			<div class="content_wrap"
				onclick="document.getElementById('${hotel.acc_code }').submit();"
				style="background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(${pageContext.request.contextPath}/resources/img/acc_img/${hotel.photo_name})">
				<div class="content_text_left">
					<input type="hidden" id="acccode" name="acc_code"
						value="${hotel.acc_code }"> <input type="hidden"
						class="accdate" name="date" value="${date }" />
					<p class="acc_grade">${hotel.acc_grade }</p>
					<p class="acc_name">${hotel.acc_name }</p>
					<p class="acc_rating">${hotel.acc_rating }(278)</p>
					<p class="acc_dist">${hotel.acc_dist }|${hotel.acc_addr }</p>
				</div>
				<div class="content_text_right">
					<p class="acc_ava">2박가능</p>
					<p class="acc_price">${hotel.room_price }원/1박</p>
				</div>

			</div>
		</form>
	</c:forEach>


	</div>
	</div>
	</div>
	<script>
		//체크했던 값 유지
		if ('${fivestar}' == "fivestar")
			$("input:checkbox[id='fivestar']").prop("checked", true);
		if ('${fspecial}' == "fspecial")
			$("input:checkbox[id='fspecial']").prop("checked", true);
		if ('${special}' == "special")
			$("input:checkbox[id='special']").prop("checked", true);
		if ('${pension}' == "pension")
			$("input:checkbox[id='pension']").prop("checked", true);
		if ('${poolvilla}' == "poolvilla")
			$("input:checkbox[id='poolvilla']").prop("checked", true);
		if ('${luxury}' == "luxury")
			$("input:checkbox[id='luxury']").prop("checked", true);
		if ('${acc_pufit}' == "acc_pufit")
			$("input:checkbox[id='acc_pufit']").prop("checked", true);
		if ('${acc_sauna}' == "acc_sauna")
			$("input:checkbox[id='acc_sauna']").prop("checked", true);
		if ('${acc_pool}' == "acc_pool")
			$("input:checkbox[id='acc_pool']").prop("checked", true);
		if ('${acc_golf}' == "acc_golf")
			$("input:checkbox[id='acc_golf']").prop("checked", true);
		if ('${acc_spa}' == "acc_spa")
			$("input:checkbox[id='acc_spa']").prop("checked", true);
		if ('${acc_wifi}' == "acc_wifi")
			$("input:checkbox[id='acc_wifi']").prop("checked", true);
		if ('${acc_minibar}' == "acc_minibar")
			$("input:checkbox[id='acc_minibar']").prop("checked", true);
		if ('${acc_aircon}' == "acc_aircon")
			$("input:checkbox[id='acc_aircon']").prop("checked", true);
		if ('${acc_pet}' == "acc_pet")
			$("input:checkbox[id='acc_pet']").prop("checked", true);
		if ('${acc_smoking}' == "acc_smoking")
			$("input:checkbox[id='acc_smoking']").prop("checked", true);
		if ('${acc_bre}' == "acc_bre")
			$("input:checkbox[id='acc_bre']").prop("checked", true);
		if ('${acc_valet}' == "acc_valet")
			$("input:checkbox[id='acc_valet']").prop("checked", true);
		if ('${SINGLEROOM}' == "SINGLEROOM") {
			document.getElementById("box1").checked = false;
			singleroom();
		}
		if ('${DOUBLEROOM}' == "DOUBLEROOM") {
			document.getElementById("box2").checked = false;
			doubleroom();
		}
		if ('${TWINROOM}' == "TWINROOM") {
			document.getElementById("box3").checked = false;
			twinroom();
		}
		if ('${ONDOLROOM}' == "ONDOLROOM") {
			document.getElementById("box4").checked = false;
			ondolroom();
		}
		if ('${person}' != "") {
			document.getElementById('res').innerHTML = "${person}";
			document.getElementById('person').value = "${person}";
		}
		if ('${date}' != "") {
			document.getElementById('date_text1').value = "${date}";
			document.getElementById('date_text2').value = "${date}";
		}

		if ('${order}' == "recommend") {
			document.getElementById('order_').value = "${order}";
			classremove();
			document.getElementById('recommend').classList.add('order-active');
		}
		if ('${order}' == "distance") {
			document.getElementById('order_').value = "${order}";
			classremove();
			document.getElementById('distance').classList.add('order-active');
		}
		if ('${order}' == "lowprice") {
			document.getElementById('order_').value = "${order}";
			classremove();
			document.getElementById('lowprice').classList.add('order-active');
		}
		if ('${order}' == "highprice") {
			document.getElementById('order_').value = "${order}";
			classremove();
			document.getElementById('highprice').classList.add('order-active');
		}
		if (document.getElementById('order_').value == "recommend")
			document.getElementById('ordertext').innerText = "추천 순";
		if (document.getElementById('order_').value == "distance")
			document.getElementById('ordertext').innerText = "거리 순";
		if (document.getElementById('order_').value == "lowprice")
			document.getElementById('ordertext').innerText = "낮은 가격 순";
		if (document.getElementById('order_').value == "highprice")
			document.getElementById('ordertext').innerText = "높은 가격 순";

		//윈도우창 모바일창 날짜입력값 유지
		var changedate;
		var date_text1 = document.getElementById('date_text1');
		var date_text2 = document.getElementById('date_text2');
		function changedate() {
			var abbb = date_text2.value;
			date_text1.value = abbb;
		}
		var changedate2;
		function changedate2() {
			var abbb = date_text1.value;
			date_text2.value = abbb;
		}
		var windowWidth = $(window).width();
		function changedate3() {
			if (windowWidth < 992) {
				changedate();
			} else {
				changedate2();
			}
		}

		if (document.getElementById('dist_text').value == 1) {
			document.getElementById('dist_text').innerHTML = "서울 > 강남/역삼/삼성/신사/청담";
		}
		if (document.getElementById('dist_text').value == 2) {
			document.getElementById('dist_text').innerHTML = "서울 > 서초/교대";
		}
		if (document.getElementById('dist_text').value == 3) {
			document.getElementById('dist_text').innerHTML = "서울 > 잠실/송파/왕십리/강동";
		}
		if (document.getElementById('dist_text').value == 4) {
			document.getElementById('dist_text').innerHTML = "서울 > 을지로/시청/명동";
		}
		if (document.getElementById('dist_text').value == 5) {
			document.getElementById('dist_text').innerHTML = "서울 > 종로/인사동/동대문/강북";
		}
		if (document.getElementById('dist_text').value == 6) {
			document.getElementById('dist_text').innerHTML = "서울 > 서울역/이태원/용산";
		}
		if (document.getElementById('dist_text').value == 7) {
			document.getElementById('dist_text').innerHTML = "서울 > 마포/홍대/신촌/서대문";
		}
		if (document.getElementById('dist_text').value == 8) {
			document.getElementById('dist_text').innerHTML = "서울 > 영등포/여의도/김포공항";
		}
		if (document.getElementById('dist_text').value == 9) {
			document.getElementById('dist_text').innerHTML = "서울 > 구로/금천/관악/동작";
		}
		if (document.getElementById('dist_text').value == 10) {
			document.getElementById('dist_text').innerHTML = "부산 > 해운대(센텀,송정)";
		}
		if (document.getElementById('dist_text').value == 11) {
			document.getElementById('dist_text').innerHTML = "부산 > 광안리/기장";
		}
		if (document.getElementById('dist_text').value == 12) {
			document.getElementById('dist_text').innerHTML = "부산 > 부산역/남포/자갈치/영도";
		}
		if (document.getElementById('dist_text').value == 13) {
			document.getElementById('dist_text').innerHTML = "부산 > 서면/동래/연제/남구";
		}
		if (document.getElementById('dist_text').value == 14) {
			document.getElementById('dist_text').innerHTML = "부산 > 김해공항/기타 (그외 지역)";
		}
		if (document.getElementById('dist_text').value == 15) {
			document.getElementById('dist_text').innerHTML = "제주 > 제주공항/애월/함덕";
		}
		if (document.getElementById('dist_text').value == 16) {
			document.getElementById('dist_text').innerHTML = "제주 > 귀포시/중문/표선/성산";
		}
	</script>



</body>

</html>