<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Thanh Toán - FixNow</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/img/favicon.ico"
	rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&subset=vietnamese&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #EFFDF5; /* Màu nền chính */
	color: black;
	font-family: 'Heebo', sans-serif;
	font-size: 16px;
}

h2 {
	font-size: 28px; /* Tăng kích thước tiêu đề */
	font-weight: 600;
	color: #00B074;
}

.payment-container {
	background-color: white;
	border-radius: 10px;
	padding: 30px; /* Tăng padding để form rộng hơn */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	max-width: 900px; /* Tăng chiều rộng của form */
	margin: auto;
}

.btn-custom {
	background-color: #00B074;
	color: white;
	font-family: 'Heebo', sans-serif;
	font-size: 16px;
	padding: 10px 20px;
}

.form-control {
	border: 1px solid #00B074;
}

.qr-container img {
	max-width: 250px; /* Tăng kích thước QR code */
}

.fade-in {
	opacity: 0;
	transition: opacity 0.5s ease-in;
}

.fade-in.visible {
	opacity: 1;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/viewdn/navbar.jsp" />

	<div class="container mt-5">
		<div class="payment-container">
			<h2 class="text-center mb-4 fade-in">Thanh Toán</h2>

			<div class="row">
				<!-- Cột bên trái chứa thông tin người dùng -->
				<div class="col-lg-8 fade-in">
					<h5>Thông Tin Người Dùng</h5>
					<p>
						<strong>Tên Khách Hàng:</strong> ${user.firstName}
						${user.lastName}
					</p>
					<p>
						<strong>Email:</strong> ${user.email}
					</p>
					<p>
						<strong>Số Điện Thoại:</strong> ${user.phoneNumber}
					</p>
					<p>
						<strong>Địa Chỉ:</strong> ${user.address}
					</p>
					<div
						class="text-center qr-container fade-in d-flex flex-column align-items-center justify-content-center mt-4">
						<h5>Quét mã QR để thanh toán</h5>
						<img src="${pageContext.request.contextPath}/img/qr.jpg"
							alt="QR Code" class="img-fluid">
						<!-- Thay thế bằng mã QR thực -->
					</div>

				</div>

				<!-- Cột bên phải chứa form thông tin thanh toán -->
				<div class="col-lg-4 fade-in">
					<h5>Thông Tin Thanh Toán</h5>
					<form action="submitPayment" method="post">
						<div class="mb-3">
							<label for="amount" class="form-label">Số Tiền Cần Thanh
								Toán</label> <input type="number" class="form-control" id="amount"
								name="amount" value="${param.amount}" readonly required>
						</div>

						<div class="mb-3">
							<label for="address" class="form-label">Địa Chỉ Giao Hàng</label>
							<textarea class="form-control" id="address" name="address"
								rows="3" placeholder="Nhập địa chỉ của bạn" required></textarea>
						</div>

						<div class="mb-3">
							<label for="note" class="form-label">Ghi Chú</label>
							<textarea class="form-control" id="note" name="note" rows="3"
								placeholder="Ghi chú nếu có"></textarea>
						</div>

						<!-- Phương thức thanh toán -->
						<div class="mb-3">
							<label class="form-label">Phương Thức Thanh Toán</label>
							<div>
								<input type="radio" id="transfer" name="paymentMethod"
									value="chuyenkhoan" checked> <label for="transfer">Chuyển
									Khoản</label>
							</div>
							<div>
								<input type="radio" id="cash" name="paymentMethod"
									value="tienmat"> <label for="cash">Tiền Mặt</label>
							</div>
						</div>

						<div class="text-center mt-4">
							<button type="submit" class="btn btn-custom">Xác Nhận
								Thanh Toán</button>
						</div>
					</form>
				</div>
			</div>

			<!-- Di chuyển mã QR sang bên phải -->

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/viewindex/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/lib/wow/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

	<script>
		$(document).ready(function() {
			const fadeInElements = $('.fade-in');
			fadeInElements.each(function(index) {
				$(this).delay(index * 50).queue(function(next) {
					$(this).addClass('visible');
					next();
				});
			});
		});
	</script>
</body>
</html>
