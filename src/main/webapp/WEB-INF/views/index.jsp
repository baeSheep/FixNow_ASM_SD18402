<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi"> <!-- Đặt ngôn ngữ của trang là tiếng Việt -->

<head>
    <meta charset="UTF-8"> <!-- Đảm bảo mã hóa UTF-8 được áp dụng -->
    <title>FIXNOW</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts với hỗ trợ tiếng Việt -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&subset=vietnamese&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Navbar Start -->
	 <jsp:include page="viewindex/navbar.jsp" />

		<!-- Navbar End -->

  <!-- Carousel Start -->
        <div class="container-fluid p-0">
            <div class="owl-carousel header-carousel position-relative">
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/carousel-1.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(43, 57, 64, .5);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-10 col-lg-8">
                                    <h1 class="display-3 text-white animated slideInDown mb-4">BẠN CÓ THỂ ĐẶT SỬA CHỮA ĐỒ GIA DỤNG |
                                    ĐỒ ĐIỆN TỬ TẠI NHÀ!</h1>
                                    <p class="fs-5 fw-medium text-white mb-4 pb-2">TV - TỦ LẠNH - MÁY GIẶT- MÁY LẠNH CHÚNG TÔI SỬA MỌI THỨ!</p>
                                    <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">DANH SÁCH DỊCH VỤ</a>
                                    <a href="" class="btn btn-secondary py-md-3 px-md-5 animated slideInRight">LIÊN HỆ NGAY!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/carousel-2.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(43, 57, 64, .5);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-10 col-lg-8"> 	
                                    <h1 class="display-3 text-white animated slideInDown mb-4">BẠN LÀ THỢ SỬA CHỮA KĨ THUẬT MÀ KHÔNG CÓ VIỆC LÀM?
                                    </h1>
                                    <p class="fs-5 fw-medium text-white mb-4 pb-2">Ở ĐÂY CHÚNG TÔI TẠO VIỆC LÀM CHO BẠN, SỬA CHỮA ĐỒ ĐIỆN TỬ || DỒ GIA DỤNG</p>
                                    <a href="/home/loginnv" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">ĐĂNG KÝ HỢP TÁC</a>
                                    <a href="" class="btn btn-secondary py-md-3 px-md-5 animated slideInRight">LIÊN HỆ NGAY!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->




		<!-- Category Start -->
		<div class="container-xxl py-5">
    <div class="container">
        <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Danh Mục</h1>
        <div class="row g-3">
            <div class="col-lg-4 col-sm-12 wow fadeInUp" data-wow-delay="0.1s">
                <a class="cat-item rounded p-4" href="home/loginnv">
                    <i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>
                    <h6 class="mb-3">Tuyển Dụng</h6>
                    <p class="mb-0">123 Vacancy</p>
                </a>
            </div>
            <div class="col-lg-4 col-sm-12 wow fadeInUp" data-wow-delay="0.3s">
                <a class="cat-item rounded p-4" href="">
                    <i class="fa fa-3x fa-headset text-primary mb-4"></i>
                    <h6 class="mb-3">Dịch Vụ Hỗ Trợ</h6>
                    <p class="mb-0">123 Vacancy</p>
                </a>
            </div>
            <div class="col-lg-4 col-sm-12 wow fadeInUp" data-wow-delay="0.5s">
                <a class="cat-item rounded p-4" href="">
                    <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
                    <h6 class="mb-3">Human Resource</h6>
                    <p class="mb-0">123 Vacancy</p>
                </a>
            </div>
        </div>
    </div>
</div>

		<!-- Category End -->
	<jsp:include page="viewindex/product.jsp" />
		<!-- Jobs Start -->
	<!-- Testimonial Start -->
	<jsp:include page="viewindex/danhgia.jsp" />
	<!-- Testimonial End -->
 <jsp:include page="viewindex/footer.jsp" />


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<!-- JavaScript Libraries -->
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

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>


</body>

</html>