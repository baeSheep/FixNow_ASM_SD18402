<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid mt-5">
    <h4 class="card-title">Quản Lý Thanh Toán</h4>

    <!-- Xem giao dịch -->
    <div class="card mb-4">
        <div class="card-header">
            <h5 class="mb-0">Xem Giao Dịch</h5>
        </div>
        <div class="card-body">
            <table class="table table-bordered" id="transactionTable">
                <thead>
                    <tr>
                        <th>Mã Giao Dịch</th>
                        <th>Ngày Giao Dịch</th>
                        <th>Người Nhận</th>
                        <th>Số Tiền (VND)</th>
                        <th>Trạng Thái</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Giả định có biến transactions chứa danh sách giao dịch -->
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td>${transaction.id}</td>
                            <td>${transaction.date}</td>
                            <td>${transaction.receiver}</td>
                            <td>${transaction.amount}</td>
                            <td>${transaction.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button class="btn btn-primary mt-3">Xem Báo Cáo Doanh Thu</button>
        </div>
    </div>

    <!-- Xử lý hoàn tiền -->
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0">Xử Lý Hoàn Tiền</h5>
        </div>
        <div class="card-body">
            <form method="POST" action="${pageContext.request.contextPath}/refunds/process">
                <div class="form-group">
                    <label for="transactionId">Mã Giao Dịch</label>
                    <input type="text" name="transactionId" id="transactionId" class="form-control" placeholder="Nhập mã giao dịch" required />
                </div>
                <div class="form-group">
                    <label for="refundAmount">Số Tiền Hoàn</label>
                    <input type="number" name="refundAmount" id="refundAmount" class="form-control" placeholder="Nhập số tiền hoàn" required />
                </div>
                <div class="form-group">
                    <label for="reason">Lý Do Hoàn Tiền</label>
                    <textarea name="reason" id="reason" class="form-control" rows="3" placeholder="Nhập lý do hoàn tiền" required></textarea>
                </div>
                <hr>
                <button type="submit" class="btn btn-danger">Thực Hiện Hoàn Tiền</button>
            </form>
        </div>
    </div>
</div>
