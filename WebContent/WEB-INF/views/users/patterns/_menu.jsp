<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
			<div class="row menu">
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link ${active}"
					href="home.htm?start=0"> <i class="fa fa-home"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link ${(producer eq 'OPPO')?'active':'' }" href="product.htm?producer=OPPO">OPPO</a>
				</li>
				<li class="nav-item"><a class="nav-link ${(producer eq 'APPLE')?'active':'' }" href="product.htm?producer=APPLE">IPHONE</a>
				</li>
				<li class="nav-item"><a class="nav-link ${(producer eq 'SAMSUNG')?'active':'' }" href="product.htm?producer=SAMSUNG">SAMSUNG</a>
				</li>
				<li class="nav-item"><a class="nav-link ${(producer eq 'SONY')?'active':'' }" href="product.htm?producer=SONY">SONY</a>
				</li>
				<li class="nav-item"><a class="nav-link ${(producer eq 'XIAOMI')?'active':'' }" href="product.htm?producer=XIAOMI">XIAOMI</a>
				</li>
			</ul>
		</div>
</body>
</html>