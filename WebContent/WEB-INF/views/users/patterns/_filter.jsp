<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-3 product-option">
		<form action="sort-by-price.htm">
			<div class="row product-sort">
				<!-- <form action="sort-by-price.htm"> -->
				<div class="form-group">
					<label for="sel">Sắp xếp theo:</label> <select class="form-control"
						id="sel" name="sort" onchange="this.form.submit()">
						<option value="1" ${(sort eq '1')?'selected':'' }>Giá tăng dần</option>
						<option value="2" ${(sort eq '2')?'selected':'' }>Giá giảm dần</option>
					</select>
				</div>
				<!-- </form> -->
			</div>
			<div class="row product-filter">
				Chọn mức giá:
				<!-- <form class="mt-2" action="filter.htm"> -->
				<div class="mt-2">
				<div class="form-check-inline">
					<label class="form-check-label" for="radio1"> <input
						type="radio" class="form-check-input" id="radio1"
						name="filterPrice" value="all" checked>Tất cả
					</label>
				</div>
				<br>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio2"> <input
						type="radio" class="form-check-input" id="radio2"
						name="filterPrice" value="op1"
						${(filterPrice eq 'op1')?'checked':'' }>Dưới 1.000.000 đ
					</label>
				</div>
				<br>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio3"> <input
						type="radio" class="form-check-input" id="radio3"
						name="filterPrice" value="op2"
						${(filterPrice eq 'op2')?'checked':'' }>Từ 1.000.000 đ đến
						2.000.000 đ
					</label>
				</div>
				<br>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio4"> <input
						type="radio" class="form-check-input" id="radio4"
						name="filterPrice" value="op3"
						${(filterPrice eq 'op3')?'checked':'' }>Từ 2.000.000 đ đến
						5.000.000 đ
					</label>
				</div>
				<br>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio5"> <input
						type="radio" class="form-check-input" id="radio5"
						name="filterPrice" value="op4"
						${(filterPrice eq 'op4')?'checked':'' }>Từ 5.000.000 đ đến
						10.000.000 đ
					</label>
				</div>
				<br>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio6"> <input
						type="radio" class="form-check-input" id="radio6"
						name="filterPrice" value="op5"
						${(filterPrice eq 'op5')?'checked':'' }>Trên 10.000.000 đ
					</label>
				</div>
				<div class="form-check-inline" style="display: none">
					<label class="form-check-label" for="inputHidden"> <input
						type="radio" class="form-check-input" id="inputHidden"
						name="inputHidden" value="${producer}" checked="checked">
					</label>
				</div>
				</div>
				<!-- </form> -->
			</div>
		</form>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>