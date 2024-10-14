<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="searchResults" class="tab-content">
    <!-- Display search results for Gia Dụng -->
    <c:if test="${not empty giaDungServices}">
        <div id="tab-1" class="tab-pane fade show p-0 active">
            <c:forEach var="item" items="${giaDungServices}">
                <div class="job-item p-4 mb-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-md-8 d-flex align-items-center">
                            <img class="flex-shrink-0 img-fluid border rounded"
                                 src="${pageContext.request.contextPath}/img/${item.image}"
                                 alt="" style="width: 80px; height: 80px;">
                            <div class="text-start ps-4">
                                <h5 class="mb-3">${item.name}</h5>
                                <span class="text-truncate me-0">
                                    <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty giaDungServices}">
        <div id="tab-1" class="tab-pane fade show p-0 active">
            <p class="text-center">Không có kết quả nào cho Gia Dụng.</p>
        </div>
    </c:if>

    <!-- Repeat for other categories -->
    <c:if test="${not empty dienTuServices}">
        <div id="tab-2" class="tab-pane fade p-0">
            <c:forEach var="item" items="${dienTuServices}">
                <div class="job-item p-4 mb-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-md-8 d-flex align-items-center">
                            <img class="flex-shrink-0 img-fluid border rounded"
                                 src="${pageContext.request.contextPath}/img/${item.image}"
                                 alt="" style="width: 80px; height: 80px;">
                            <div class="text-start ps-4">
                                <h5 class="mb-3">${item.name}</h5>
                                <span class="text-truncate me-0">
                                    <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty dienTuServices}">
        <div id="tab-2" class="tab-pane fade p-0">
            <p class="text-center">Không có kết quả nào cho Điện Tử.</p>
        </div>
    </c:if>

    <c:if test="${not empty dienLanhServices}">
        <div id="tab-3" class="tab-pane fade p-0">
            <c:forEach var="item" items="${dienLanhServices}">
                <div class="job-item p-4 mb-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-md-8 d-flex align-items-center">
                            <img class="flex-shrink-0 img-fluid border rounded"
                                 src="${pageContext.request.contextPath}/img/${item.image}"
                                 alt="" style="width: 80px; height: 80px;">
                            <div class="text-start ps-4">
                                <h5 class="mb-3">${item.name}</h5>
                                <span class="text-truncate me-0">
                                    <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty dienLanhServices}">
        <div id="tab-3" class="tab-pane fade p-0">
            <p class="text-center">Không có kết quả nào cho Điện Lạnh.</p>
        </div>
    </c:if>

    <c:if test="${not empty veSinhServices}">
        <div id="tab-4" class="tab-pane fade p-0">
            <c:forEach var="item" items="${veSinhServices}">
                <div class="job-item p-4 mb-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-md-8 d-flex align-items-center">
                            <img class="flex-shrink-0 img-fluid border rounded"
                                 src="${pageContext.request.contextPath}/img/${item.image}"
                                 alt="" style="width: 80px; height: 80px;">
                            <div class="text-start ps-4">
                                <h5 class="mb-3">${item.name}</h5>
                                <span class="text-truncate me-0">
                                    <i class="far fa-money-bill-alt text-primary me-2"></i>${item.price} VND
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty veSinhServices}">
        <div id="tab-4" class="tab-pane fade p-0">
            <p class="text-center">Không có kết quả nào cho Vệ Sinh.</p>
        </div>
    </c:if>
</div>
