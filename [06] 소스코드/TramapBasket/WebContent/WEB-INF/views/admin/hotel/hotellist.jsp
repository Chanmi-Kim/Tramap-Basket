<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>TraMap Basket</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- css삽입 -->
<%@ include file="/inc/css.jsp" %>
<!-- 차트 -->
<script src="/project/asset/js/highcharts.js"></script>
<script src="/project/asset/js/series-label.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>

	.container{
		margin-botrtom:30px;
	
	}

	#basketbtn i{
		font-size: 30px;    
	}
	
	#basket { 
		position:fixed; width:15%; display:inline-block; right:1%; /* 창에서 오른쪽 길이 */ top:20%; /* 창에서 위에서 부터의 높이 */ background-color: transparent; margin:0; 
		border: 1px solid black;
		border-radius: 5px;	
		height: 600px;
		/* overflow-y: scroll; */
	}
    
    .picture {
		float: left;
		width: 150px;
		height: 100px;
		border: 0px solid #ddd;
		margin:0px;
		margin-top: 10px;
		margin-left: 25px;
		background-repeat: no-repeat;
		background-size: contain;
		background-position : center center;
		
	}
	
	.pic{
		width: 100px;
		height: 80px;
		margin-left: 15px;
		background-repeat: no-repeat;
		background-size:contain;
		background-position : center center;	
	}
	
	.adminmenu{
		text-align:center;
		font-size: 25px;
		border-top:1px solid #ccc;
		margin: 20px;
		padding-top: 20px;
	}
	
	#profilename , #profilelevel{
		text-align:center;
	}
	
	.label {
      display: block;
      margin: 30px 0 0 0;
    }
    
    .h3{
		display:inline-block;
		border: 1px solid black;
		margin-top: 10px;
		font-weight:bolder;
	}
    .search{
    	
		display:block;
		border: 0px solid black;
		float : right;
		margin-top: 10px;
	}
	
	#search select, #search input { display: inline-block; }
	#search #word { width: 300px; }
	
	.hotelhana{
		border:0px solid #ccc;
		background-color: white;
		width:200px;
		min-height:200px;
		display:inline-block;
		margin:15px;
	}
	
	.mainbox{
		
		min-height:800px;
		min-width:800px;
	}
	
	#headname{
		margin : 10px;
		width: 300px;
		margin-right:0px;
	}
	
	#name{
		display:inline-block;
		font-weight:bold;
	}
	
	p{
		display: inline-block;
	}
	
	#pagebar { text-align: center; }
	
</style>
<Script>
	$(function() {
		
		$("#selPage").change(function() {
			
			location.href = "/project/admin/hotel/list.do?page=" + $(this).val();
			
		});
		
	});
</Script>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.html"><img src="/project/asset/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="category.html">Shop Category</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
                  <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                  <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Blog</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                </ul>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Pages</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                  <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li>
                </ul>
              </li>
              <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>

            <ul class="nav-shop">
            <c:if test="${!empty loginCheck }">
              <li class="nav-item"><button onclick="location.href='/project/member/ybh/ybhMypage.do';"><i class="ti-search"></i></button></li>
              <li class="nav-item"><button onclick="location.href='/project/admin/hotel/hotellist.do';"><i class="ti-settings"></i></button> </li>
              <li class="nav-item"><a class="button button-header" href="/project/member/ybh/ybhLogout.do">Logout</a></li>
            </c:if>
            <c:if test="${empty loginCheck }">
              <li class="nav-item"><a class="button button-header" href="/project/member/ybh/ybhLogin.do"
              	onclick="window.open(this.href, '_blank', 'width=400,height=300,toolbars=no,scrollbars=no,left=700, top=50'); return false;">Login</a></li>
              	
            </c:if>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->
	
	
  <main class="site-main">
    
 	<!-- 페이지 우측 메뉴 바 -->
    <div id="basket">
    	<!-- 우측 메뉴바 프로필부분 -->
    	<div class="profile" >
    	<div class="container">
	      	<div class="row">
    		<div class="pic" style="background-image: url(/project/asset/img/r9.jpg);"></div>
    		</div>
    		<div id="profilename"  ><label>관일장(guan)</label></div>
    		<div id="profilelevel" ><label>관리자</label></div>
    		<input type="button" value="정보관리" class="btn btn-default" onclick="">
    	</div>
    	</div>
    	<!-- 우측 메뉴바 메뉴부분 -->
    	<div class="adminmenu" >
    		<div><a href="/project/admin/airline/airlinehome.do">항공 관리</a></div>
    		<div><a href="/project/admin/country/countryhome.do">나라 관리</a></div>
    		<div><a href="/project/admin/tourspot/tourspothome.do">관광지 관리</a></div>
    		<div><a href="/project/admin/hotel/hotellist.do">숙박 관리</a></div>
    		<div><a href="/project/admin/theme/themehome.do">테마 관리</a></div>
    		<div><a href="/project/admin/member/memberlist.do">회원 관리</a></div>
    	</div>
    </div>
	
	 <!-- ================ Blog section start ================= -->  
   <section class="blog">
   		
   		<div class="container" style="border-left:1px solid #ccc; border-right:1px solid #ccc; width: 900px;" >
	      <div class="hotellist">
	     	
	      <div class="container" >
	    
			
	      	<div class="row">
	      		<h2 style="margin:10px 10px 0px 0px;">호텔<span class="section-intro__style">목록</span></h2>
	      		 <!-- 검색 창 -->
	      		 <div style="width:500px;"></div>
			<div class="search" id="search" style=" margin-top:30px;">
				<form method="GET" action="/project/admin/hotel/hotellist.do">
					<label for="files"></label>
					<select name="column" id="column" class="form-control short">
						<optgroup label="아시아">
							<option>태국</option>
							<option>북경</option>
							
						</optgroup>
						<optgroup label="동남아">
							<option value="thai">태국</option>
							<option value=""></option>
							
						</optgroup>
						<optgroup label="유럽">
							<option value="france">프랑스</option>
							<option value=""></option>
							
						</optgroup>
						<optgroup label="북미">
							<option value="newyork">뉴욕</option>
							<option value=""></option>
							
						</optgroup>
						<optgroup label="남미">
							<option value="mexico">멕시코</option>
							<option value=""></option>
							
						</optgroup>
						
					</select>
					<input type="submit" value="검색하기" class="btn btn-default" style="height:42px ">
				</form>
			</div>
			<!-- 검색결과화면에서 검색창에 검색한 옵션이랑 검색어 남아있게... -->
			<c:if test="${isSearch}">
					<script>
						$("#column").val("${column}");
	
					</script>
			</c:if>
	      	</div>	  
	      	     
	      </div>	
		    
			
			
			<!--  -->
			
			<div id="tblHotel">
				<div style="border: 0px solid #ccc;  padding-left:65px; margin-top:30px;">
				<c:forEach items="${hotellist}" var="hodto">
				<div class="hotelhana" style="border:0px solid black; background-color: white; margin-top: 60px;">
						<a href="/project/admin/hotel/view.do?hotel_seq=${hodto.hotel_seq}" target="_blank" style="color: #999">
						<div class="picture" style="background-image: url(/project/asset/img/tourspot/${hodto.picture});"></div>
						<div id="name" style="text-align:center; margin-left:30px; color:black;">${hodto.name}</div>
		
		
						<div style="height:25px; text-align:center;"><p>위도 :</p>${hodto.lat}</div>
						<div style="text-align:center;"><p>경도 :</p>${hodto.lng}</div>
						</a>
				</div>
				</c:forEach>
				</div>
			
				
			</div>
		</div>
		
		
			<div id="pagebar">
				${pagebar}
			</div>
			
			<div class="btns long" style="1px solid black;">
				<input type="button" value="추가하기" class="btn btn-default"
					onclick="location.href='/project/admin/hotel/add.do';">
			</div>
			
		</div>
    </section>
    <!-- ================ Blog section end ================= -->  
	
	


  <!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="/project/asset/img/gallery/r1.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r2.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r3.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r5.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r7.jpg" alt=""></li>
								<li><img src="/project/asset/img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->
	<%@ include file="/inc/js.jsp" %>
	<!-- 이곳 -->
		
</body>

</html>