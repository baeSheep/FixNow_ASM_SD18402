<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.fixnow.model.Services" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng - FixNow</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&subset=vietnamese&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #EFFDF5;
            color: black;
            font-family: 'Heebo', sans-serif;
            font-size: 16px;
        }
        h2 {
            font-size: 24px;
            font-weight: 600;
            color: #00B074;
        }
        .cart-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-custom {
            background-color: #00B074;
            color: white;
            font-family: 'Heebo', sans-serif;
            font-size: 16px;
            padding: 10px 20px;
        }
        .btn-danger {
            background-color: #ff4d4d;
            color: white;
            font-family: 'Heebo', sans-serif;
            font-size: 16px;
        }
        .status-processing {
            color: #ff4d4d;
            font-weight: bold;
        }
        .status-completed {
            color: #28a745;
            font-weight: bold;
        }
        .table th, .table td {
            font-family: 'Heebo', sans-serif;
            font-size: 16px;
        }
        .fade-in {
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }
        .fade-in.active {
            opacity: 1;
        }
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/viewdn/navbar.jsp" />

<div class="container mt-5 cart-container fade-in">
    <h2 class="text-center mb-4">DỊCH VỤ CỦA BẠN</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Dịch Vụ</th>
                <th>Giá Dịch Vụ</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="totalAmount" value="0.0" />
            <c:forEach var="service" items="${services}">
                <tr>
                    <td>${service.name}</td>
                    <td>${service.price} VNĐ</td>
                    <td class="${service.status == 'Processing' ? 'status-processing' : 'status-completed'}">
                        ${service.status}
                    </td>
                    <td>
                        <a href="/cart/remove/${service.id}" class="btn btn-danger">Hủy Đơn</a>
                    </td>
                </tr>
                <c:set var="totalAmount" value="${totalAmount + service.price}" />
            </c:forEach>
        </tbody>
    </table>
    <div class="text-end">
        <h5>Tổng Tiền: <span id="totalPrice">${totalAmount} VNĐ</span></h5>
    </div>
    <div class="text-center">
        <a href="/user/pay?amount=${totalAmount}" class="btn btn-success">Thanh Toán</a>
    </div>
</div>

<jsp:include page="/WEB-INF/views/viewindex/footer.jsp" />

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script>
    $(document).ready(function() {
        $('.cart-container').addClass('fade-in active');
    });
</script>
</body>
</html>
