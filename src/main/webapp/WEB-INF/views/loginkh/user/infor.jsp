<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cập Nhật Thông Tin Người Dùng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #EFFDF5;
	font-family: 'Arial', sans-serif;
}

.form-container {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 8px 16px rgba(0, 176, 116, 0.2), 0px 4px 6px
		rgba(0, 176, 116, 0.15);
	max-width: 900px;
	margin: 50px auto;
	display: flex; /* Sử dụng flexbox để chia làm 2 cột */
	gap: 30px; /* Khoảng cách giữa các phần */
}

.form-title {
	text-align: center;
	color: #00B074;
	margin-bottom: 30px;
	font-size: 24px;
	font-weight: bold;
	width: 100%; /* Đảm bảo tiêu đề chiếm toàn bộ chiều rộng */
}

.form-label {
	color: #333333;
	font-weight: normal;
}

input[type="text"], input[type="number"], input[type="email"], input[type="password"],
	textarea, select {
	border: 2px solid #EFFDF5;
	border-radius: 0px; /* Vuông viền */
	padding: 10px;
	width: 100%;
	transition: border-color 0.3s ease;
}

input[type="text"]:focus, input[type="number"]:focus, input[type="email"]:focus,
	input[type="password"]:focus, textarea:focus, select:focus {
	border-color: #00B074;
	outline: none;
}

.btn-submit {
	background: linear-gradient(to right, #f9f9a7, #00b074);
	/* Gradient từ màu vàng nhạt sang xanh lá cây */
	color: white;
	font-size: 16px;
	padding: 15px 165px; /* Tăng padding để nút dài hơn */
	border: none;
	border-radius: 50px; /* Làm tròn góc */
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-weight: bold;
}

.btn-submit:hover {
	background: linear-gradient(to right, #ffdd00, #00ff55);
	/* Hiệu ứng khi hover */
}

.d-grid {
	display: flex;
	justify-content: center; /* Căn giữa nút */
	margin-top: 20px; /* Khoảng cách trên nút */
}

/* Phần cập nhật hình ảnh */
.image-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.image-preview {
	width: 250px; /* Giới hạn chiều rộng khung ảnh */
	height: 250px;
	background-color: #f0f0f0;
	border: 2px solid #EFFDF5;
	border-radius: 0px; /* Vuông viền */
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
}

.image-preview img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
}

.btn-upload {
	background-color: #00B074;
	color: white;
	padding: 10px;
	border: none;
	cursor: pointer;
	border-radius: 0px; /* Vuông viền */
}

.btn-upload:hover {
	background-color: #38d376;
}

.form-fields {
	flex: 1; /* Chia đều không gian cho form */
}

.image-container {
	flex: 1; /* Chia đều không gian cho ảnh */
}

.btn-primary {
	--bs-btn-color: #fff;
	--bs-btn-bg: #00B074;
	--bs-btn-border-color: #00B074;
	--bs-btn-hover-color: #fff;
	--bs-btn-hover-bg: #38d376; /* Màu xanh nhạt hơn khi hover */
	--bs-btn-hover-border-color: #38d376;
	/* Viền cũng nhạt hơn khi hover */
	--bs-btn-focus-shadow-rgb: 49, 132, 253;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: #0a58ca;
	--bs-btn-active-border-color: #0a53be;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #fff;
	--bs-btn-disabled-bg: #00B074;
	--bs-btn-disabled-border-color: #00B074;
}

.text-primary {
	--bs-text-opacity: 1;
	color: rgba(0, 176, 116, var(--bs-text-opacity)) !important;
	/* Sử dụng giá trị RGB của #00B074 */
}

.border-bottom {
	--bs-border-color: #00B074; /* Thay đổi màu border thành #00B074 */
	border-bottom: var(--bs-border-width) var(--bs-border-style)
		var(--bs-border-color) !important;
}

.image-preview {
	width: 150px; /* Giảm chiều rộng khung ảnh */
	height: 150px; /* Giảm chiều cao khung ảnh */
	background-color: #f0f0f0;
	border: 2px solid #EFFDF5;
	border-radius: 50%; /* Làm tròn khung ảnh */
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
	overflow: hidden; /* Đảm bảo ảnh không bị tràn ra ngoài */
}

.image-preview img {
	width: 100%;
	height: auto; /* Để chiều cao tự động căn chỉnh theo tỷ lệ của ảnh */
	object-fit: cover;
	/* Đảm bảo ảnh phủ đầy khung mà không bị biến dạng */
	border-radius: 50%; /* Làm tròn ảnh */
}
</style>

</head>
<body>
<<<<<<< HEAD
    <jsp:include page="/WEB-INF/views/viewdn/navbar.jsp" />
    <div class="form-container">
        <div class="form-fields">
            <h1 class="form-title">Cập Nhật Thông Tin Người Dùng</h1>
            <form action="${pageContext.request.contextPath}/user/updateUserInfo" method="POST" enctype="multipart/form-data">
                <div class="image-container">
                    <div class="image-preview" id="imagePreview" onclick="document.getElementById('imageUpload').click();">
                        <c:choose>
                            <c:when test="${user.image != null}">
                                <img src="${pageContext.request.contextPath}/static/img/${user.image}" alt="User Image" style="max-width: 200px; max-height: 200px;">
                            </c:when>
                            <c:otherwise>
                                <span>No Image</span> <!-- Hiển thị thông báo nếu không có ảnh -->
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- Ẩn input file và kích hoạt nó khi nhấp vào khung ảnh -->
                    <input type="file" id="imageUpload" name="imageUpload" accept="image/*" onchange="previewImage(event)" style="display: none;">
                </div>

                <div class="mb-3">
                    <label for="first_name" class="form-label">Tên</label>
                    <input type="text" class="form-control" id="first_name" name="first_name" value="${user.firstName}" placeholder="Nhập tên" required>
                </div>
                <div class="mb-3">
                    <label for="last_name" class="form-label">Họ</label>
                    <input type="text" class="form-control" id="last_name" name="last_name" value="${user.lastName}" placeholder="Nhập họ" required>
                </div>
                <div class="mb-3">
                    <label for="gender" class="form-label">Giới tính</label><br>
                    <input type="radio" id="male" name="gender" value="male" ${user.gender == 'male' ? 'checked' : ''}> <label for="male">Nam</label>
                    <input type="radio" id="female" name="gender" value="female" ${user.gender == 'female' ? 'checked' : ''} style="margin-left: 20px;"> <label for="female">Nữ</label>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="address" value="${user.address}" placeholder="Nhập địa chỉ" required>
                </div>
                <div class="mb-3">
                    <label for="phone_number" class="form-label">Số điện thoại</label>
                    <input type="number" class="form-control" id="phone_number" name="phone_number" value="${user.phoneNumber}" placeholder="Nhập số điện thoại" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Địa chỉ email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" placeholder="Nhập địa chỉ email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn-submit">Cập Nhật</button>
                </div>
                <div class="d-grid">
                    <button type="button" class="btn" onclick="window.history.back();">Quay Lại</button>
                </div>
                <!-- Phần cập nhật hình ảnh -->
            </form>
        </div>
    </div>

    <script>
        // Hàm hiển thị hình ảnh khi người dùng chọn file
        function previewImage(event) {
            const imagePreview = document.getElementById('imagePreview');
            const file = event.target.files[0];
            const reader = new FileReader();
            reader.onload = function(e) {
                imagePreview.innerHTML = '<img src="' + e.target.result + '" alt="Preview" style="max-width: 200px; max-height: 200px;">';
            };
            reader.readAsDataURL(file);
        }
    </script>
</body>


    <jsp:include page="/WEB-INF/views/viewindex/footer.jsp" />
    <script>
        // Hàm để xem trước hình ảnh khi tải lên
        function previewImage(event) {
            const imagePreview = document.getElementById('imagePreview');
            imagePreview.innerHTML = ''; // Xóa nội dung hiện tại
            const file = event.target.files[0];
            const imgElement = document.createElement('img');
            imgElement.src = URL.createObjectURL(file);
            imagePreview.appendChild(imgElement);
        }
    </script>
</body>

=======
	<jsp:include page="/WEB-INF/views/viewdn/navbar.jsp" />
	<div class="form-container">
		<!-- Phần thông tin người dùng -->
		<div class="form-fields">
			<h1 class="form-title">Cập Nhật Thông Tin Người Dùng</h1>
			<form action="${pageContext.request.contextPath}/updateUserInfo"
				method="POST">
				<div class="image-container">
					<div class="image-preview" id="imagePreview"
						onclick="document.getElementById('imageUpload').click();">
						<c:choose>
							<c:when test="${user.image != null}">
								<img
									src="${pageContext.request.contextPath}/uploads/${user.image}"
									alt="No Image">
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</div>
					<!-- Ẩn input file và kích hoạt nó khi nhấp vào khung ảnh -->
					<input type="file" id="imageUpload" accept="image/*"
						onchange="previewImage(event)" style="display: none;">
				</div>

				<div class="mb-3">
					<label for="first_name" class="form-label">Tên</label> <input
						type="text" class="form-control" id="first_name" name="first_name"
						value="${user.firstName}" placeholder="Nhập tên">
				</div>
				<div class="mb-3">
					<label for="last_name" class="form-label">Họ</label> <input
						type="text" class="form-control" id="last_name" name="last_name"
						value="${user.lastName}" placeholder="Nhập họ">
				</div>
				<div class="mb-3">
					<label for="gender" class="form-label">Giới tính</label><br> <input
						type="radio" id="male" name="gender" value="male"
						${user.gender == 'male' ? 'checked' : ''}> <label
						for="male">Nam</label> <input type="radio" id="female"
						name="gender" value="female"
						${user.gender == 'female' ? 'checked' : ''}
						style="margin-left: 20px;"> <label for="female">Nữ</label>
				</div>
				<div class="mb-3">
					<label for="address" class="form-label">Địa chỉ</label> <input
						type="text" class="form-control" id="address" name="address"
						value="${user.address}" placeholder="Nhập địa chỉ">
				</div>
				<div class="mb-3">
					<label for="phone_number" class="form-label">Số điện thoại</label>
					<input type="number" class="form-control" id="phone_number"
						name="phone_number" value="${user.phoneNumber}"
						placeholder="Nhập số điện thoại">
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Địa chỉ email</label> <input
						type="email" class="form-control" id="email" name="email"
						value="${user.email}" placeholder="Nhập địa chỉ email">
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Mật khẩu</label> <input
						type="password" class="form-control" id="password" name="password"
						placeholder="Nhập mật khẩu">
				</div>
				<div class="d-grid">
					<button type="submit" class="btn-submit">Cập Nhật</button>
				</div>
				<div class="d-grid">
					<button type="button" class="btn" onclick="window.history.back();">Quay
						Lại</button>
				</div>
				<!-- Phần cập nhật hình ảnh -->

			</form>
		</div>
>>>>>>> c9e849bca84ac2aac8dcb2fcdc04ff5cd7322be3



	</div>
	<jsp:include page="/WEB-INF/views/viewindex/footer.jsp" />
	<script>
		// Hàm để xem trước hình ảnh khi tải lên
		function previewImage(event) {
			const imagePreview = document.getElementById('imagePreview');
			imagePreview.innerHTML = ''; // Xóa nội dung hiện tại
			const file = event.target.files[0];
			const imgElement = document.createElement('img');
			imgElement.src = URL.createObjectURL(file);
			imagePreview.appendChild(imgElement);
		}
	</script>

</body>
</html>
