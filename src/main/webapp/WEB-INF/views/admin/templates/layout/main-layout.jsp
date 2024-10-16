<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <title>FixNow | Admin</title>

    <style>
        /* Tăng kích thước chữ toàn bộ */
        body {
            font-size: 1.1rem;
            font-family: 'Arial', sans-serif;
        }

        /* Tăng kích thước các tiêu đề */
        h3 {
            font-size: 1.4rem;
            font-weight: bold;
        }

        /* Chỉnh kích thước chữ cho phần input và button */
        input[type="text"], input[type="password"], input[type="email"], button {
            font-size: 1.2rem;
            padding: 10px 15px;
        }

        /* Chỉnh kích thước cho các nhãn (label) */
        label {
            font-size: 1.2rem;
        }

        /* Tăng kích thước button */
        button {
            font-size: 1.2rem;
            padding: 10px 20px;
            background-color: #00B074;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #009e68;
        }

        /* Tăng kích thước chữ cho phần dashboard */
        .sidebar-links a h3 {
            font-size: 1.3rem;
        }

        /* Tăng kích thước chữ cho phần điều hướng bên phải */
        .right-section .info p {
            font-size: 1.1rem;
        }

        .right-section .info small {
            font-size: 1rem;
        }

        /* Hiệu ứng shadow cho mỗi mục trong sidebar */
        .sidebar-links a {
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-radius: 5px;
        }

        .sidebar-links a:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            background-color: #f1f1f1;
        }

        /* Đổi màu cho mục được chọn */
        .sidebar-links a.active {
            background-color: #00B074;
            color: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .sidebar-links a.active h3 {
            color: white;
        }

        .sidebar-links a.active span {
            color: white;
        }
    </style>
</head>

<body>

    <div class="container-fluid d-flex p-0">
        <!-- Sidebar Section -->
        <aside class="sidebar bg-light">
            <div class="toggle d-flex justify-content-between align-items-center p-3">
                <div class="logo d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/images/fixnow.jpg" alt="FixNow Logo" class="logo-img">
                    <h2 class="ms-3">Fix<span style="color:#00B074;">Now</span></h2>
                </div>
                <div class="close" id="close-btn">
                    <span class="material-icons-sharp">close</span>
                </div>
            </div>

            <nav class="sidebar-links mt-4">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="d-flex align-items-center p-3 active">
                    <span class="material-icons-sharp me-2">dashboard</span>
                    <h3 class="m-0">Dashboard</h3>
                </a>
                <a href="${pageContext.request.contextPath}/admin/manageUsers" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">person_outline</span>
                    <h3 class="m-0">Quản lý người dùng</h3>
                </a>
                <a href="${pageContext.request.contextPath}/admin/payment" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">receipt_long</span>
                    <h3 class="m-0">Quản lý thanh toán</h3>
                </a>
                <a href="${pageContext.request.contextPath}/admin/manageServiceProviders" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">insights</span>
                    <h3 class="m-0">Quản lý dịch vụ</h3>
                </a>
                <a href="#" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">mail_outline</span>
                    <h3 class="m-0">Quản lý đơn hàng</h3>
                </a>
                <a href="#" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">inventory</span>
                    <h3 class="m-0">Quản lý đơn hàng</h3>
                </a>
                <a href="#" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">report_gmailerrorred</span>
                    <h3 class="m-0">Báo cáo</h3>
                    <span class="badge bg-danger ms-auto">27</span>
                </a>
                <a href="#" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">settings</span>
                    <h3 class="m-0">Cài đặt</h3>
                </a>
                <a href="#" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">add</span>
                    <h3 class="m-0">Thêm mới</h3>
                </a>
                <a href="/home/logout" class="d-flex align-items-center p-3">
                    <span class="material-icons-sharp me-2">logout</span>
                    <h3 class="m-0">Đăng xuất</h3>
                </a>
            </nav>
        </aside>
        <!-- End of Sidebar Section -->

        <!-- Main Content Section -->
        <main class="p-4" style="flex-grow: 1; background-color: #EFFDF5;">
            <jsp:include page="${content}.jsp" />
        </main>
        <!-- End of Main Content Section -->

       <!-- Right Section -->
		<div class="right-section bg-white p-4" style="width: 250px;"> <!-- Giảm chiều rộng của phần bên phải -->
		    <div class="nav d-flex justify-content-between align-items-center">
		        <button id="menu-btn" class="btn btn-light">
		            <span class="material-icons-sharp">menu</span>
		        </button>
		        <div class="dark-mode-toggle d-flex align-items-center">
		            <span class="material-icons-sharp active me-2">light_mode</span>
		            <span class="material-icons-sharp">dark_mode</span>
		        </div>
		
		        <div class="profile d-flex align-items-center">
		            <div class="info me-3">
		                <p>Hey, <b>${sessionScope.userName}</b></p> <!-- Hiển thị tên người dùng -->
		                <small class="text-muted">${sessionScope.userRole}</small> <!-- Hiển thị vai trò -->
		            </div>
		            <div class="profile-photo">
		                <img src="${pageContext.request.contextPath}/images/profile-1.jpg" alt="Profile Picture" class="rounded-circle" width="50">
		            </div>
		        </div>
		    </div>
		    <!-- End of Nav -->
		</div>
		<!-- End of Right Section -->


    </div>

    <script src="${pageContext.request.contextPath}/script/index.js"></script>

</body>

</html>
