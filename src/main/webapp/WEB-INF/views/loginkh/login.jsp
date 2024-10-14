<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            background-image: url('${pageContext.request.contextPath}/img/nhabep.webp');
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
    </style>
</head>
<body>
    <div class="banner"></div>
    <div class="background d-flex align-items-center justify-content-center">
        <div class="wave">
            <svg viewBox="0 0 1440 320">
                <path fill="#EFFDF5" fill-opacity="1" d="M0,128L30,144C60,160,120,192,180,213.3C240,235,300,245,360,240C420,235,480,213,540,192C600,171,660,149,720,160C780,171,840,213,900,202.7C960,192,1020,128,1080,117.3C1140,107,1200,149,1260,160C1320,171,1380,149,1410,138.7L1440,128L1440,320L1410,320C1380,320,1320,320,1260,320C1200,320,1140,320,1080,320C1020,320,960,320,900,320C840,320,780,320,720,320C660,320,600,320,540,320C480,320,420,320,360,320C300,320,240,320,180,320C120,320,60,320,30,320L0,320Z"></path>
            </svg>
        </div>
        <div class="form-container p-5 rounded shadow-lg">
            <h1 class="text-center mb-4">ĐĂNG NHẬP</h1>
            <form action="${pageContext.request.contextPath}/home/login" method="post"> <!-- Đảm bảo action đúng -->
                <div class="mb-3">
                    <label class="form-label" for="email">Địa chỉ Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Địa chỉ Email" required />
                </div>
                <div class="mb-3">
                    <label class="form-label" for="password">Mật khẩu</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Mật khẩu" required />
                </div>
                <button type="submit" class="btn btn-primary w-100">ĐĂNG NHẬP</button>
            </form>
            <div class="mt-3 text-center">
                <span>Hoặc</span>
                <div class="d-flex justify-content-center mt-2">
                    <button class="btn btn-secondary mx-1">
                        <i class="fab fa-facebook-f"></i> Facebook
                    </button>
                    <button class="btn btn-secondary mx-1">
                        <i class="fab fa-google"></i> Google
                    </button>
                </div>
            </div>
            <p class="mt-3 text-center">Bạn chưa có tài khoản? <a href="/home/register" class="text-primary">Đăng Ký</a></p>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
