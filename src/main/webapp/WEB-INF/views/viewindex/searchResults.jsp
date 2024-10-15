<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="searchResults" class="tab-content">
    <c:if test="${not empty message}">
        <div class="alert alert-warning">${message}</div>
    </c:if>

    <!-- Gia Dung Services -->
    <c:if test="${not empty giaDungServices}">
        <c:forEach var="item" items="${giaDungServices}">
            <div class="job-item p-4 mb-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                        <img class="flex-shrink-0 img-fluid border rounded"
                             src="${pageContext.request.contextPath}/img/${item.image}"
                             alt="${item.name}" style="width: 80px; height: 80px;">
                        <div class="text-start ps-4">
                            <h5 class="mb-3">${item.name}</h5>
                            <span class="text-truncate me-0">
                                <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                            </span>
                            <button class="btn btn-primary mt-3">Đặt dịch vụ</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <!-- Điện Tử Services -->
    <c:if test="${not empty dienTuServices}">
        <c:forEach var="item" items="${dienTuServices}">
            <div class="job-item p-4 mb-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                        <img class="flex-shrink-0 img-fluid border rounded"
                             src="${pageContext.request.contextPath}/img/${item.image}"
                             alt="${item.name}" style="width: 80px; height: 80px;">
                        <div class="text-start ps-4">
                            <h5 class="mb-3">${item.name}</h5>
                            <span class="text-truncate me-0">
                                <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                            </span>
                            <button class="btn btn-primary mt-3">Đặt dịch vụ</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <!-- Điện Lạnh Services -->
    <c:if test="${not empty dienLanhServices}">
        <c:forEach var="item" items="${dienLanhServices}">
            <div class="job-item p-4 mb-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                        <img class="flex-shrink-0 img-fluid border rounded"
                             src="${pageContext.request.contextPath}/img/${item.image}"
                             alt="${item.name}" style="width: 80px; height: 80px;">
                        <div class="text-start ps-4">
                            <h5 class="mb-3">${item.name}</h5>
                            <span class="text-truncate me-0">
                                <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                            </span>
                            <button class="btn btn-primary mt-3">Đặt dịch vụ</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <!-- Vệ Sinh Services -->
    <c:if test="${not empty veSinhServices}">
        <c:forEach var="item" items="${veSinhServices}">
            <div class="job-item p-4 mb-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                        <img class="flex-shrink-0 img-fluid border rounded"
                             src="${pageContext.request.contextPath}/img/${item.image}"
                             alt="${item.name}" style="width: 80px; height: 80px;">
                        <div class="text-start ps-4">
                            <h5 class="mb-3">${item.name}</h5>
                            <span class="text-truncate me-0">
                                <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                            </span>
                            <button class="btn btn-primary mt-3">Đặt dịch vụ</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <!-- No Results Found Message -->
    <c:if test="${empty giaDungServices && empty dienTuServices && empty dienLanhServices && empty veSinhServices}">
        <p class="text-center">Không có kết quả nào cho từ khóa tìm kiếm của bạn.</p>
    </c:if>
</div>
