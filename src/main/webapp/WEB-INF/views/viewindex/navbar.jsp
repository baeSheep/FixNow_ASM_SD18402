<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="index.html" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
        <h1 class="m-0 text-primary">FixNow</h1>
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="/home/index" class="nav-item nav-link active">Trang Chủ</a>
            <a href="about.html" class="nav-item nav-link">Giới Thiệu</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Dịch Vụ</a>
                <div class="dropdown-menu rounded-0 m-0">
                    <a href="category.html" class="dropdown-item">Job Category</a>
                    <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                    <a href="404.html" class="dropdown-item">404</a>
                </div>
            </div>
 <%
            Object user1 = session.getAttribute("user");
            if (user1 != null) {
        %>
			<a href="/home/logout" class="nav-item nav-link">Đăng Xuất</a>        <%
            } else {
        %>
           <a href="/home/login" class="nav-item nav-link">Đăng Nhập</a>     
        <%
            }
        %>        </div>
        
        <!-- Kiểm tra nếu user != null thì hiển thị nút Dịch Vụ Đã Đặt, nếu không thì Đăng Ký Ngay -->
        <%
            Object user = session.getAttribute("user");
            if (user != null) {
        %>
            <a href="/user/cart" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">Dịch Vụ Đã Đặt<i class="fa fa-arrow-right ms-3"></i></a>
        <%
            } else {
        %>
            <a href="/home/register" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">Đăng Ký Ngay!<i class="fa fa-arrow-right ms-3"></i></a>
        <%
            }
        %>
    </div>
</nav>
