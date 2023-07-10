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
                            <div class="w-[30%] text-center border my-2">
                                <c:url var="showDetail" value="detailProduct">
                                    <c:param name="sku" value="${itemProduct.skuProduct}"></c:param>
                                </c:url>
                                <a href="${showDetail}">
                                    <img class="w-[100%]" src="${itemProduct.imageProduct}" />
                                </a>
                                <h1 class=" text-[20px]">${itemProduct.nameProduct}</h1>
                                <h1 class="font-medium">Price: ${itemProduct.priceProduct} $</h1>
                                <form action="addProductToCart">
                                    <input type="hidden" name="skuProduct" value="${itemProduct.skuProduct}" />
                                    <input type="submit" class="cursor-pointer px-6  py-2 border-4" value="Add to Cart" />
                                </form>
                            </div>
                        </c:forEach>       
                </c:if>
            </div>
        </div>
        <jsp:include page="./components/footer.jsp"></jsp:include>
    </body>
</html>
