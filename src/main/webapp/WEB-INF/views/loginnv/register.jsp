<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <style>
        body {
            background-color: #EFFDF5;
            margin: 0;
            display: flex;
            height: 100vh;
        }
        h1, label, p {
            color: #00B074;
        }
        .form-container {
            max-width: 700px; /* Tăng độ rộng của form */
            background-color: #EFFDF5; /* Nền cho form */
            position: relative;
            z-index: 1; /* Đưa form lên trên sóng */
        }
        .banner {
            background-image: url('${pageContext.request.contextPath}/img/carousel-2.jpg');
            background-size: cover;
            background-position: center;
            width: 50%; /* Chiều rộng của hình ảnh */
            position: relative;
            z-index: 0; /* Đưa hình ảnh xuống dưới sóng */
        }
        .background {
            background-color: #00B074; /* Màu nền bên phải */
            width: 50%; /* Chiều rộng của background */
            position: relative;
            z-index: 0; /* Đưa background xuống dưới sóng */
            overflow: hidden;
        }
        .wave {
            position: absolute;
            top: 0; /* Đưa sóng lên trên cùng */
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .wave svg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            fill: #EFFDF5; /* Màu nền cho sóng */
        }
        .wow {
            visibility: hidden; /* Ẩn phần tử ban đầu */
        }
        .wow.animated {
            visibility: visible; /* Hiện phần tử khi hiệu ứng diễn ra */
        }
    </style>
</head>
<body onload="new WOW().init();">
    <div class="banner"></div>
    <div class="background d-flex align-items-center justify-content-center">
        <div class="wave">
            <svg viewBox="0 0 1440 320">
                <path fill="#EFFDF5" fill-opacity="1" d="M0,128L30,144C60,160,120,192,180,213.3C240,235,300,245,360,240C420,235,480,213,540,192C600,171,660,149,720,160C780,171,840,213,900,202.7C960,192,1020,128,1080,117.3C1140,107,1200,149,1260,160C1320,171,1380,149,1410,138.7L1440,128L1440,320L1410,320C1380,320,1320,320,1260,320C1200,320,1140,320,1080,320C1020,320,960,320,900,320C840,320,780,320,720,320C660,320,600,320,540,320C480,320,420,320,360,320C300,320,240,320,180,320C120,320,60,320,30,320L0,320Z"></path>
            </svg>
        </div>
        <div class="form-container p-5 rounded shadow-lg">
            <h1 class="text-center mb-4 wow fadeIn" data-wow-delay="0.5s">ĐĂNG KÝ NHÂN VIÊN</h1>
            <form>
                <div class="mb-3 wow fadeIn" data-wow-delay="0.6s">
                    <label class="form-label" for="name">Họ và tên</label>
                    <input type="text" id="name" class="form-control" placeholder="Họ và tên" required />
                </div>
                <div class="mb-3 wow fadeIn" data-wow-delay="0.7s">
                    <label class="form-label" for="email">Địa chỉ Email</label>
                    <input type="email" id="email" class="form-control" placeholder="Địa chỉ Email" required />
                </div>
                <div class="mb-3 wow fadeIn" data-wow-delay="0.8s">
                    <label class="form-label" for="password">Mật khẩu</label>
                    <input type="password" id="password" class="form-control" placeholder="Mật khẩu" required />
                </div>
                <div class="mb-3 wow fadeIn" data-wow-delay="0.9s">
                    <label class="form-label" for="expertise">Chuyên môn</label>
                    <input type="text" id="expertise" class="form-control" placeholder="Chuyên môn" required />
                </div>
                <div class="mb-3 wow fadeIn" data-wow-delay="1.0s">
                    <label class="form-label" for="address">Địa chỉ (Nơi ở)</label>
                    <input type="text" id="address" class="form-control" placeholder="Địa chỉ" required />
                </div>
                <button type="submit" class="btn btn-primary w-100 wow fadeIn" data-wow-delay="1.1s">ĐĂNG KÝ</button>
            </form>
            <p class="mt-3 text-center wow fadeIn" data-wow-delay="1.2s">Bạn đã có tài khoản? <a href="/home/login" class="text-primary">Đăng Nhập</a></p>
        </div>
    </div>
</body>
</html>
