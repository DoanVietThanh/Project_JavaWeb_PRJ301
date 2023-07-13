<%-- 
    Document   : shop
    Created on : Jul 6, 2023, 12:54:13 PM
    Author     : Oliver Doan
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="components/linkTailwind.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/shop.css" />
        <link rel="stylesheet" href="css/footer.css" />
    </head>
    <body>
        <jsp:include page="./components/header.jsp"></jsp:include>
            <div class="flex my-[20px]">
                <div class="w-[20%]">
                <jsp:include page="components/sidebarLeft.jsp"></jsp:include>
                </div>
                <div class="w-[80%] flex flex-wrap gap-[10px]">
                <c:if test="${not empty requestScope.listProduct}">
                    <c:forEach items="${requestScope.listProduct}" var="itemProduct" varStatus="counter">
                        <div class="w-[30%] text-center border my-2 py-4">
                            <c:url var="showDetail" value="detailProduct">
                                <c:param name="sku" value="${itemProduct.skuProduct}"></c:param>
                            </c:url>
                            <a href="${showDetail}">
                                <img class="w-[100%]" src="${itemProduct.imageProduct}" />
                            </a>
                            <h1 class=" text-[20px] py-2">${itemProduct.nameProduct}</h1>
                            <h1 class="font-medium">Price: ${itemProduct.priceProduct} $</h1>
                        </div>
                    </c:forEach>       
                </c:if>
                <c:if test="${empty requestScope.listProduct}">
                    <div class="text-center w-full h-full text-rose-600 font-bold text-[30px] pt-8">${requestScope.messNotFound}</div>
                </c:if>
            </div>
        </div>
        <jsp:include page="./components/footer.jsp"></jsp:include>
    </body>
</html>
