<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thông tin đơn hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/add-new-product.css">
    <link rel="stylesheet" href="css/cart.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-2">
                <div class="row d-flex justify-content-center"
					style="margin:10px 0px">
					<a href="home.htm"> <img src="images/logo.png" alt="">
					</a>
				</div>
				<div class="row" style="width: 100%">
					<div class="nav flex-column nav-pills" style="width: 100%">
						<a class="nav-link" href="admin/dashboard/product-management.htm">Quản
							lý sản phẩm</a> <a class="nav-link"
							href="admin/dashboard/order-management.htm">Quản lý đơn hàng</a>
						<a data-toggle="modal" data-target="#logoutModal" class="nav-link"
							href=""><i class="fa fa-power-off" aria-hidden="true"></i>
							Đăng xuất</a>
					</div>
				</div>
            </div>
            <div class="col-10">
                <div class="row d-flex justify-content-center" style="font-size: 50px;">
                    Thông tin đơn hàng
                </div>
                <form action="admin/update-status.htm?purID=${purID }" method="post">
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
                            </tr>
                        </thead>
                        <tbody align="center">
                        	<c:forEach var="purchaseItem" items="${purItemList}" varStatus="stt">
	                        	<tr>
	                                <th scope="row">${stt.index+1 }</th>
	                                <td class="cart-img-product">
	                                    <img src="images/${purchaseItem.productColors.img_front}" alt="" class="img-fluid">
	                                </td>
	                                <td>
	                                    <i style="color: ${purchaseItem.productColors.color}" class="fa fa-circle product-color" aria-hidden="true"></i>
	                                </td>
	                                <td>${purchaseItem.productColors.product.name }</td>
	                                <td>${purchaseItem.amount }</td>
	                                <td><fmt:formatNumber type="number" pattern="###,###"
												value="${purchaseItem.price }" /> đ</td>
	                                <td><fmt:formatNumber type="number" pattern="###,###"
												value="${purchaseItem.price*purchaseItem.amount}" /> đ</td>
	                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                    <h2></h2>
                    <div class="form-group form-inline row">
                        <label for="status-order" class="col-1">Trạng thái:</label>
                        <select class="form-control col-2" id="status-order" name="statusList" onchange="this.form.submit()">
                            <option value="1" ${(status eq 'Đang xử lý')?'selected':'' }>Đang xử lý</option>
                            <option value="2" ${(status eq 'Đang vận chuyển')?'selected':'' }>Đang vận chuyển</option>
                            <option value="3" ${(status eq 'Đã giao hàng')?'selected':'' }>Đã giao hàng</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>