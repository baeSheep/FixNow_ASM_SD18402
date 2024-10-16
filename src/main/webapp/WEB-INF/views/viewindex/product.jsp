<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div>
    <div class="container-xxl py-5">
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">DỊCH VỤ SỬA CHỮA</h1>
            <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
                <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    <li class="nav-item"><a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                            <h6 class="mt-n1 mb-0">GIA DỤNG</h6>
                        </a></li>
                    <li class="nav-item"><a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                            <h6 class="mt-n1 mb-0">ĐIỆN TỬ</h6>
                        </a></li>
                    <li class="nav-item"><a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-3">
                            <h6 class="mt-n1 mb-0">ĐIỆN LẠNH</h6>
                        </a></li>
                    <li class="nav-item"><a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-4">
                            <h6 class="mt-n1 mb-0">VỆ SINH</h6>
                        </a></li>
                </ul>

                <div class="tab-content">
                    <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
                        <div class="container">
                            <form id="searchForm" action="${pageContext.request.contextPath}/home/search" method="GET">
                                <div class="row g-2">
                                    <div class="col-md-10">
                                        <input type="text" name="query" class="form-control border-0" placeholder="Tìm kiếm dịch vụ..." required />
                                        <h4 class="text-danger">${message}</h4>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-dark border-0 w-100">Tìm kiếm</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Hiển thị dịch vụ cho các danh mục khác nhau -->
                    <div id="searchResults" class="tab-content">
                        <c:choose>
                            <c:when test="${not empty giaDungServices}">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <c:forEach var="item" items="${giaDungServices}">
                                        <div class="job-item p-4 mb-4">
                                            <div class="row g-4">
                                                <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid border rounded" src="${pageContext.request.contextPath}/img/${item.image}" alt="" style="width: 80px; height: 80px;">
                                                    <div class="text-start ps-4">
                                                        <h5 class="mb-3">${item.name}</h5>
                                                        <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                                    <form action="${pageContext.request.contextPath}/user/cart/add" method="POST">
                                                        <input type="hidden" name="serviceId" value="${item.serviceID}">
                                                        <button type="submit" class="btn btn-primary">Đặt Dịch Vụ</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <p class="text-center">Không có kết quả nào cho Gia Dụng.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${not empty dienTuServices}">
                                <div id="tab-2" class="tab-pane fade p-0">
                                    <c:forEach var="item" items="${dienTuServices}">
                                        <div class="job-item p-4 mb-4">
                                            <div class="row g-4">
                                                <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid border rounded" src="${pageContext.request.contextPath}/img/${item.image}" alt="" style="width: 80px; height: 80px;">
                                                    <div class="text-start ps-4">
                                                        <h5 class="mb-3">${item.name}</h5>
                                                        <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                                    <form action="${pageContext.request.contextPath}/user/cart/add" method="POST">
                                                        <input type="hidden" name="serviceId" value="${item.serviceID}">
                                                        <button type="submit" class="btn btn-primary">Đặt Dịch Vụ</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div id="tab-2" class="tab-pane fade p-0">
                                    <p class="text-center">Không có kết quả nào cho Điện Tử.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${not empty dienLanhServices}">
                                <div id="tab-3" class="tab-pane fade p-0">
                                    <c:forEach var="item" items="${dienLanhServices}">
                                        <div class="job-item p-4 mb-4">
                                            <div class="row g-4">
                                                <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid border rounded" src="${pageContext.request.contextPath}/img/${item.image}" alt="" style="width: 80px; height: 80px;">
                                                    <div class="text-start ps-4">
                                                        <h5 class="mb-3">${item.name}</h5>
                                                        <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                                    <form action="${pageContext.request.contextPath}/user/cart/add" method="POST">
                                                        <input type="hidden" name="serviceId" value="${item.serviceID}">
                                                        <button type="submit" class="btn btn-primary">Đặt Dịch Vụ</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div id="tab-3" class="tab-pane fade p-0">
                                    <p class="text-center">Không có kết quả nào cho Điện Lạnh.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${not empty veSinhServices}">
                                <div id="tab-4" class="tab-pane fade p-0">
                                    <c:forEach var="item" items="${veSinhServices}">
                                        <div class="job-item p-4 mb-4">
                                            <div class="row g-4">
                                                <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                                    <img class="flex-shrink-0 img-fluid border rounded" src="${pageContext.request.contextPath}/img/${item.image}" alt="" style="width: 80px; height: 80px;">
                                                    <div class="text-start ps-4">
                                                        <h5 class="mb-3">${item.name}</h5>
                                                        <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                                    <form action="${pageContext.request.contextPath}/user/cart/add" method="POST">
                                                        <input type="hidden" name="serviceId" value="${item.serviceID}">
                                                        <button type="submit" class="btn btn-primary">Đặt Dịch Vụ</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div id="tab-4" class="tab-pane fade p-0">
                                    <p class="text-center">Không có kết quả nào cho Vệ Sinh.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
