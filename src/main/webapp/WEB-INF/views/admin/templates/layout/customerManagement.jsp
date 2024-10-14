<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2 class="text-center mb-4" style="color: #00B074;">Quản lý người dùng</h2>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/customerManagement.css">

<!-- CSS chỉnh sửa theo phong cách FixNow -->
<style>
    body {
        background-color: #EFFDF5;
        color: black;
        font-family: 'Heebo', sans-serif;
        font-size: 16px;
    }

    .form-section {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px; /* Bo góc mềm mại */
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Bóng cho chiều sâu */
        margin-bottom: 20px;
    }

    .table-bordered {
        border-radius: 10px; /* Bo góc cho bảng */
        overflow: hidden; /* Đảm bảo bảng không bị tràn */
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Bóng cho bảng */
    }

    .table thead th {
        background-color: #00B074; /* Màu chủ đạo của FixNow */
        color: white; /* Màu chữ trắng */
        border-bottom: 2px solid #dee2e6;
    }

    .table tbody td {
        background-color: white;
    }

    .btn-primary {
        background-color: #00B074; /* Màu nút chính của FixNow */
        border: none;
    }

    .btn-primary:hover {
        background-color: #00865a; /* Màu khi hover */
    }

    .btn-danger {
        background-color: #ff4d4d; /* Màu nút xóa */
        border: none;
    }

    .btn-danger:hover {
        background-color: #e60000;
    }

    .btn-warning {
        background-color: #ffc107; /* Màu nút chỉnh sửa */
        border: none;
    }

    .btn-warning:hover {
        background-color: #e0a800;
    }

    .btn-secondary {
        background-color: #f8f9fa; /* Màu nền cho nút chuyển đổi */
        color: #00B074; /* Màu chữ xanh chủ đạo */
    }

    .btn-secondary:hover {
        background-color: #e2e6ea;
        color: #00865a;
    }

    h4 {
        font-weight: 600;
        color: #00B074;
    }
</style>

<!-- Quản lý khách hàng và nhà cung cấp -->
<div class="container-fluid mt-5">
    <!-- Nút chuyển đổi giữa form và table -->
    <div class="mb-4 text-center">
        <button class="btn btn-secondary mx-2" onclick="showSection('userForm')">Quản Lý Khách Hàng</button>
        <button class="btn btn-secondary mx-2" onclick="showSection('providerForm')">Quản Lý Nhà Cung Cấp</button>
    </div>

   <!-- Quản lý người dùng (User) -->
<div class="form-section card" id="userForm">
    <div class="card-body">
        <h4 class="card-title">Quản Lý Người Dùng</h4>
        <form action="${pageContext.request.contextPath}/users" method="post">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="userFirstName">Tên</label>
                        <input type="text" class="form-control" id="userFirstName" name="firstName" placeholder="Nhập tên" required>
                    </div>
                    <div class="form-group">
                        <label for="userLastName">Họ</label>
                        <input type="text" class="form-control" id="userLastName" name="lastName" placeholder="Nhập họ" required>
                    </div>
                    <div class="form-group">
                        <label for="userEmail">Email</label>
                        <input type="email" class="form-control" id="userEmail" name="email" placeholder="Nhập email" required>
                    </div>
                    <div class="form-group">
                        <label for="userRole">Vai Trò</label>
                        <select class="form-control" id="userRole" name="userType" required>
                            <option value="">Chọn vai trò</option>
                            <option value="admin">Quản trị viên</option>
                            <option value="user">Người dùng</option>
                            <option value="provider">Nhà cung cấp dịch vụ</option> <!-- Thêm vai trò nhà cung cấp nếu cần -->
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="userPhone">Số Điện Thoại</label>
                        <input type="tel" class="form-control" id="userPhone" name="phoneNumber" placeholder="Nhập số điện thoại" required>
                    </div>
                    <div class="form-group">
                        <label for="userPassword">Mật Khẩu</label>
                        <input type="password" class="form-control" id="userPassword" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                </div>
            </div>
            <hr>
            <button type="submit" class="btn btn-primary">Cập Nhật Thông Tin</button>
        </form>

        <!-- Bảng hiển thị dữ liệu người dùng -->
        <h5 class="mt-4">Danh Sách Người Dùng</h5>
        <table class="table table-bordered mt-2" id="userTable">
            <thead>
                <tr>
                    <th>Tên Người Dùng</th>
                    <th>Email</th>
                    <th>Vai Trò</th>
                    <th>Số Điện Thoại</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.firstName} ${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.userType}</td>
                        <td>${user.phoneNumber}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/users/delete" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${user.userID}">
                                <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                            </form>
                            <button class="btn btn-warning btn-sm" 
                                    onclick="editUser('${user.userID}', '${user.firstName}', '${user.lastName}', '${user.email}', '${user.userType}', '${user.phoneNumber}')">Sửa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


    <!-- Quản lý nhà cung cấp dịch vụ (Provider) -->
<div class="form-section card" id="providerForm" style="display: none;">
    <div class="card-body">
        <h4 class="card-title">Quản Lý Nhà Cung Cấp Dịch Vụ</h4>
        <form action="${pageContext.request.contextPath}/providers" method="post">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="providerName">Tên Nhà Cung Cấp</label>
                        <input type="text" class="form-control" id="providerName" name="name" placeholder="Nhập tên nhà cung cấp" required>
                    </div>
                    <div class="form-group">
                        <label for="providerEmail">Email</label>
                        <input type="email" class="form-control" id="providerEmail" name="email" placeholder="Nhập email" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="providerPhone">Số Điện Thoại</label>
                        <input type="tel" class="form-control" id="providerPhone" name="phone" placeholder="Nhập số điện thoại" required>
                    </div>
                    <div class="form-group">
                        <label for="providerStatus">Tình Trạng</label>
                        <select class="form-control" id="providerStatus" name="status" required>
                            <option value="">Chọn tình trạng</option>
                            <option value="approved">Được Duyệt</option>
                            <option value="rejected">Bị Từ Chối</option>
                        </select>
                    </div>
                </div>
            </div>
            <hr>
            <button type="submit" class="btn btn-primary">Cập Nhật Thông Tin</button>
        </form>

        <!-- Bảng hiển thị dữ liệu nhà cung cấp -->
        <h5 class="mt-4">Danh Sách Nhà Cung Cấp</h5>
        <table class="table table-bordered mt-2" id="providerTable">
            <thead>
                <tr>
                    <th>Tên Nhà Cung Cấp</th>
                    <th>Email</th>
                    <th>Số Điện Thoại</th>
                    <th>Tình Trạng</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="provider" items="${providers}">
                    <tr>
                        <td>${provider.name}</td>
                        <td>${provider.email}</td>
                        <td>${provider.phone}</td>
                        <td>${provider.status}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/providers/delete" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${provider.id}">
                                <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                            </form>
                            <button class="btn btn-warning btn-sm" 
                                    onclick="editProvider('${provider.id}', '${provider.name}', '${provider.email}', '${provider.phone}', '${provider.status}')">Sửa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</div>

<!-- JavaScript để hiển thị và ẩn các phần -->
<script>
    function showSection(sectionId) {
        document.getElementById('userForm').style.display = 'none';
        document.getElementById('providerForm').style.display = 'none';
        document.getElementById(sectionId).style.display = 'block';
    }

    function editUser(userId, firstName, lastName, email, userType, phoneNumber) {
        document.getElementById('userName').value = firstName + ' ' + lastName;
        document.getElementById('userEmail').value = email;
        document.getElementById('userRole').value = userType;
        document.getElementById('userPhone').value = phoneNumber;
        // Thêm xử lý cập nhật nếu cần
    }

    function editProvider(id, name, email, phone, status) {
        document.getElementById('providerName').value = name;
        document.getElementById('providerEmail').value = email;
        document.getElementById('providerPhone').value = phone;
        document.getElementById('providerStatus').value = status;
        // Thêm xử lý cập nhật nếu cần
    }
</script>
