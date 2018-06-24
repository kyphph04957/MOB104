<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/product-information.css">
<link rel="stylesheet" href="css/cart.css">
<title>Giỏ hàng</title>
</head>
<body>
	<div class="container">
		<jsp:include page="patterns/_head.jsp"></jsp:include>
		<jsp:include page="patterns/_menu.jsp"></jsp:include>
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
		<div style="margin-left: 0" class="row">
			<div style="margin-top: 20px; width: 100%" class="row">
				<a class="product-name">Giỏ hàng</a>
			</div>
			<div class="row th">
				<c:choose>
					<c:when test="${shop.size() ==0 }">
					<div  style="width: 100%;text-align: center;">
						<img alt="" src="images/cart-empty-0x260.png">
						<h3><a href="home.htm"><i class="fa fa-arrow-left" aria-hidden="true"></i> Giỏ hàng trống, quay lại mua hàng</a></h3>
					</div>
					</c:when>
					<c:otherwise>
						<table align="center" class="table table-striped">
							<thead>
								<tr align="center">
									<th scope="col">STT</th>
									<th scope="col">Hình ảnh</th>
									<th>Màu</th>
									<th scope="col">Tên sản phẩm</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Đơn giá</th>
									<th scope="col">Thành tiền</th>
									<th></th>
								</tr>
							</thead>
							<tbody align="center">
								<c:forEach var="p" items="${shop}" varStatus="stt">
									<tr>

										<th scope="row">${stt.index+1 }</th>
										<td class="cart-img-product"><img
											src="images/${p.value.productColor.img_front}" alt=""
											class="img-fluid"></td>
										<td><i style="color: ${p.value.productColor.color}"
											class="fa fa-circle product-color" aria-hidden="true"></i></td>
										<td>${p.value.productColor.product.name }</td>
										<td>${p.value.quantity }</td>
										<td><fmt:formatNumber type="number" pattern="###,###"
												value="${p.value.productColor.product.price}" /> đ</td>
										<td><fmt:formatNumber type="number" pattern="###,###"
												value="${p.value.productColor.product.price*p.value.quantity}" />
											đ</td>
										<td><a
											href="remove-to-cart.htm?pID=${p.value.product_id }&color=${p.value.productColor.color}"><i
												class="fa fa-trash-o" aria-hidden="true"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div style="width: 100%;margin-bottom: 15px;" class="d-flex justify-content-right">
						<h3>Tổng cộng: ${total} &nbsp; &nbsp;</h3>
						<form action="order.htm">
						<button type="submit" class="btn btn-warning">Tiến hành thanh toán</button>
						</form>
						</div>
						
					</c:otherwise>
				</c:choose>
			</div>
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
	<script src="js/validate.js"></script>
</body>
</html>