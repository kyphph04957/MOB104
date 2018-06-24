<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<title>LVD - HomePage</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/index.css">
</head>

<body>

	<div class="container">
		<jsp:include page="patterns/_head.jsp"></jsp:include>
		<jsp:include page="patterns/_menu.jsp"></jsp:include>
		<div class="row banner">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="images/index-banner1.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="images/index-banner2.png"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="images/index-banner3.png"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="row product-list">
			<c:forEach var="p" items="${lst_AllperPage}" varStatus="status">
				<div class="col-4">
					<a class="product-infomation" href="product-info.htm?pId=${p.id}">
						<div class="product-div">
							<img src="images/${p.product_colors.get(0).img_front}">
							<div class="product-title">${p.name}</div>
							<div class="product-price">
								<fmt:formatNumber value="${p.price}" pattern="###,###"
									type="number" />
								đ
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="row page-navigation">
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="home.htm?start=${(startIndex-9>=0)?startIndex-9:'0'}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a></li>
				<c:forEach var="page" varStatus="stt" begin="0" end="${pageNumber}">
					<li class="page-item"><a class="page-link"
						href="home.htm?start=${stt.index*9}">${stt.index+1}</a></li>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="home.htm?start=${(startIndex+9>=pageNumber*9)?pageNumber*9:startIndex+9}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
			</nav>
		</div>
		<div class="row footer">
			<div class="col-2 logo-footer">
				<img src="images/logo.png" alt="">
			</div>
			<div class="col-7 info-footer">
				Công ty TNHH Công nghệ di động LVD - Tòa nhà FPT Polytechnic (Nhà
				H), Hàm Nghi, Mỹ Đình, Nam Từ Liêm, Hà Nội<br> Email:
				company@LVD.vn<br> Copyrights &copy; 2018 LVD.vn<br>
			</div>
			<div class="col-3 hotline-footer">
				<i class="fa fa-phone-square" aria-hidden="true"></i> <span>Hotline:
					1998 9794</span>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
		type="text/javascript"></script>
	<script src="js/validate.js"></script>	
</body>
</html>