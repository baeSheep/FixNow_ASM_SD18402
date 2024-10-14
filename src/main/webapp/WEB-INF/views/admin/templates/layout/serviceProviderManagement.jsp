<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    .card {
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table {
    border-radius: 5px;
    overflow: hidden;
}
    
    </style>
<div class="container-fluid mt-5">
    <h4 class="card-title">Quản Lý Dịch Vụ</h4>

    <!-- Form quản lý dịch vụ -->
    <div class="form-section card" id="serviceForm">
        <div class="card-body">
            <form method="POST" action="${pageContext.request.contextPath}/services/save">
                <input type="hidden" name="id" value="${service.id}">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">Tên Dịch Vụ</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Nhập tên dịch vụ" required />
                        </div>
                        <div class="form-group">
                            <label for="category">Danh Mục Dịch Vụ</label>
                            <input type="text" name="category" id="category" class="form-control" placeholder="Nhập danh mục dịch vụ" required />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="price">Giá Dịch Vụ</label>
                            <input type="number" name="price" id="price" class="form-control" placeholder="Nhập giá dịch vụ" required />
                        </div>
                        <div class="form-group">
                            <label for="duration">Thời Gian Ước Tính (phút)</label>
                            <input type="number" name="duration" id="duration" class="form-control" placeholder="Nhập thời gian ước tính" required />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="description">Mô Tả</label>
                    <textarea name="description" id="description" class="form-control" rows="3" placeholder="Nhập mô tả dịch vụ"></textarea>
                </div>
                <hr>
                <button type="submit" class="btn btn-primary">Lưu Dịch Vụ</button>
                <a href="${pageContext.request.contextPath}/services" class="btn btn-secondary">Hủy</a>
            </form>
        </div>
    </div>

    <!-- Bảng hiển thị danh sách dịch vụ -->
    <h5 class="mt-4">Danh Sách Dịch Vụ</h5>
    <table class="table table-bordered mt-2" id="serviceTable">
        <thead>
            <tr>
                <th>Tên Dịch Vụ</th>
                <th>Danh Mục</th>
                <th>Giá (VND)</th>
                <th>Thời Gian (phút)</th>
                <th>Mô Tả</th>
                <th>Hành Động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="service" items="${services}">
                <tr>
                    <td>${service.name}</td>
                    <td>${service.category}</td>
                    <td>${service.price}</td>
                    <td>${service.duration}</td>
                    <td>${service.description}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/services/edit/${service.id}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="${pageContext.request.contextPath}/services/delete/${service.id}" class="btn btn-danger btn-sm">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

