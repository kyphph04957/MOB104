<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>LVD - HomePage</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/product-information.css">
</head>

<body>
	<div class="container">
		<jsp:include page="patterns/_head.jsp"></jsp:include>
		<div class="row menu">
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link" href="home.htm"> <i
						class="fa fa-home"></i>
				</a></li>
				<li class="nav-item"><a
					class="nav-link ${(product.producer eq 'OPPO')?'active':'' }"
					href="product.htm?producer=OPPO">OPPO</a></li>
				<li class="nav-item"><a
					class="nav-link ${(product.producer eq 'Apple')?'active':'' }"
					href="product.htm?producer=APPLE">IPHONE</a></li>
				<li class="nav-item"><a
					class="nav-link ${(product.producer eq 'Samsung')?'active':'' }"
					href="product.htm?producer=SAMSUNG">SAMSUNG</a></li>
				<li class="nav-item"><a
					class="nav-link ${(product.producer eq 'Sony')?'active':'' }"
					href="product.htm?producer=SONY">SONY</a></li>
				<li class="nav-item"><a
					class="nav-link ${(product.producer eq 'Xiaomi')?'active':'' }"
					href="v.htm?producer=XIAOMI">Xiaomi</a></li>
			</ul>
		</div>
		<div class="row">
			<div style="padding: 0; padding-right: 5px" class="col-6 banner">
				<div id="banner1" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="images/banner1.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner2.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner3.png"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner4.png"
								alt="Forth slide">
						</div>
						<a class="carousel-control-prev" href="#banner1" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#banner1" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
			<div style="padding: 0; padding-left: 5px" class="col-6 banner">
				<div id="banner2" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="images/banner5.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner6.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner7.png"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner8.png"
								alt="Forth slide">
						</div>
						<a class="carousel-control-prev" href="#banner2" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#banner2" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div style="border-bottom: 1px solid #C4C0C0" class="row">
			<a class="product-name"> ${product.name} </a>
		</div>
		<div style="border-bottom: 1px solid #c4c0c0; padding-bottom: 5%"
			class="row">
			<div class="col-5">
				<div class="tab-content">
					<c:forEach var="p" items="${product.product_colors}"
						varStatus="stt">
						<div id="${p.color}"
							class="container tab-pane ${(stt.index==0)?'active':'fade'}">
							<br>
							<div style="width: 90%; margin: auto" class="col-12">
								<div id="${p.color }-${stt}" class="carousel slide">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block w-100" src="images/${p.img_front}"
												alt="First slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="images/${p.img_behind}"
												alt="Second slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="images/${p.img_thickness}"
												alt="Third slide">
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="row">
									<div class="product-sides">
										<div class="img-sides">
											<li class="sides" data-target="#${p.color }-${stt}"
												data-slide-to="0"><a href=""> <img
													src="images/${p.img_front}" class="img-fluid" alt="">
											</a></li>
										</div>
										<div class="img-sides">
											<li class="sides" data-target="#${p.color }-${stt}"
												data-slide-to="1"><a href=""> <img
													src="images/${p.img_behind}" class="img-fluid" alt="">
											</a></li>
										</div>
										<div class="img-sides">
											<li class="sides" data-target="#${p.color }-${stt}"
												data-slide-to="2"><a href=""> <img
													src="images/${p.img_thickness}" class="img-fluid" alt="">
											</a></li>
										</div>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-3">
				<div style="padding-top: 5%" class="row buy-product">
					<span class="prd-price"> <fmt:formatNumber
							value="${product.price}" pattern="###,###" type="number" /> đ
					</span>
				</div>
				<div class="row buy-product">
					<div
						style="border: 1px solid #176C16; color: #176c16; border-right: none">
						<a style="font-size: 1.5em;"> &nbsp; <i style=""
							class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;
						</a>
					</div>
					<div
						style="border: 1px solid #176C16; color: #176c16; line-height: 40px;">
						<a style="font-size: 20px; font-weight: normal"> &nbsp; Nhận
							hàng trong 1 giờ &nbsp; </a>
					</div>
				</div>
				<div class="row buy-product">
					<div style="padding: 0; line-height: 30px" class="col-4">Chọn
						màu: &nbsp;</div>
					<div style="padding: 0" class="col-8">
						<ul class="nav nav-pills" role="tablist">
							<c:forEach var="p" items="${product.product_colors }"
								varStatus="stt">
								<li class="nav-item pick-color"><a
									class="nav-link pcolor ${((stt.index)==0)?'active':'' }"
									data-toggle="pill" href="#${p.color }"><i
										style="color: ${p.color}" class="fa fa-circle product-color"
										aria-hidden="true"></i></a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="row buy-product d-flex justify-content-center">
					<div class="buy">
						<a id="order" href="add-to-cart.htm?pID=${product.id}">Mua
							hàng</a>
					</div>
				</div>
				<div class="row buy-product">
					Gọi đặt mua ngay &nbsp; <span style="color: blue"> 1998 997
						994</span>
				</div>

			</div>
			<div class="col-4">
				<div
					style="border: 1px solid #000; width: 98%; margin: 20px 0px; padding-top: 20%">
					<div style="margin: 0; padding: 0" class="row">
						<div style="padding: 0px; margin: auto" class="col-2">
							<img src="images/686422-award.png" class="img-fluid" alt="">
						</div>
						<div style="padding-right: 20px" class="col-10">
							<span
								style="font-size: 17px; font-weight: bold; font-size: 17px; font-weight: bold; line-height: 50px">
								Bảo hành chính hãng 12 tháng </span>
						</div>
					</div>
					<div style="margin: 0; padding: 20% 0px" class="row">
						<div style="text-align: center; padding: 15px 0px" class="col-2">
							<img width="50%" src="images/doitra.png" class="img-fluid" alt="">
						</div>
						<div style="padding-right: 20px" class="col-10">
							<span
								style="font-size: 17px; font-weight: bold; line-height: 50px;">
								1 đổi 1 trong 1 tháng nếu lỗi, đổi sản phẩm tại nhà trong 1 ngày
							</span>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div style="margin-bottom: 15%" class="row">
			<div class="col-8">
				<div style="margin: 5% 0px" class="row">
					<a class="introduction"> Đặc điểm nổi bật của IphoneX </a>
				</div>
				<div class="row">
					<div id="highlights" class="carousel slide" data-slide="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100" src="images/-1-thietke.jpg"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="images/a1-990x660.jpg"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="images/vi-vn-3-goc-bo-cong.jpg"
									alt="Third slide">
							</div>
							<a class="carousel-control-prev" role="button" data-slide="prev"
								href="#highlights"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" role="button"
								href="#highlights" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div style="margin: 10% 0 10% 2%;" class="row">
					<a class="introduction"> Thông số kỹ thuật </a>
				</div>
				<div
					style="border-top: 1px solid #000; margin-left: 5%; padding-top: 5%">
					<span class="properties"> Màn hình: ${product.monitor }
						pixels</span> <br> <span class="properties"> Hệ điều hành:
						${product.os }<br>
					</span> <span class="properties"> Camera sau: ${product.camera } MP</span>
					<br> <span class="properties"> Camera trước:
						${product.front_camera } MP</span> <br> <span class="properties">
						CPU: ${product.cpu } </span> <br> <span class="properties">
						RAM: ${product.ram } GB</span> <br> <span class="properties">
						Bộ nhớ trong: ${product.rom } GB</span> <br> <span
						class="properties"> Khe cắm sim: ${product.sim }</span> <br>
					<span class="properties"> Dung lượng pin: ${product.pin} mAh</span>
				</div>
			</div>
		</div>
		<div class="row footer">
			<div class="col-2 logo-footer">
				<img src="images/logo.png" alt="">
			</div>
			<div class="col-7 info-footer">
				Công ty TNHH Công nghệ di động LVD - Tòa nhà FPT Polytechnic (Nhà
				H), Hàm Nghi, Mỹ Đình, Nam Từ Liêm, Hà Nội <br> Email:
				company@LVD.vn <br> Copyrights &copy; 2018 LVD.vn <br>
			</div>
			<div class="col-3 hotline-footer">
				<i class="fa fa-phone-square" aria-hidden="true"></i> <span>Hotline:
					1998 9794</span>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
		type="text/javascript"></script>
	<script src="js/validate.js"></script>
	<script>
		$('#order').click(function() {
			var hr = $(this).attr('href');
			if ($('.pcolor').hasClass('active')) {
				var href = $('.pick-color .active').attr('href');
				var color = href.substr(1);
				$(this).attr('href', hr + '&color=' + color);
			}
		});
	</script>
</body>
</html>