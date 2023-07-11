<%-- 
    Document   : detailProdct
    Created on : Jul 7, 2023, 6:52:51 AM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="components/linkTailwind.jsp" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/detailProduct.css" />
    </head>
    <body>
        <jsp:include page="components/header.jsp" />
        <c:if test="${not empty requestScope.detailProduct}">
            <c:set var="itemProduct" value="${requestScope.detailProduct}"></c:set>
                <div class="text-center my-[20px] font-medium ">
                <c:url var="homePage" value="/"></c:url>
                <a href="${homePage}" class="hover:opacity-70">Home</a>- Detail Product
            </div>

            <div class="flex justify-center gap-[40px] py-[20px] bg-[#F5F5F7]">
                <div class="w-[30%] bg-[#fff] p-2">
                    <img src="${itemProduct.imageProduct}" alt="Ảnh Product chất lượng cao" class="w-[100%]"/>
                </div>

                <div class="w-[40%] border-2 p-8 font-bold bg-[#fff] flex flex-col gap-[20px]">
                    <h1>Name Product: ${itemProduct.nameProduct}</h1>
                    <h1>Price: ${itemProduct.priceProduct}$</h1>
                    <c:if test="${not empty itemProduct.statusProduct}">
                        <h1>Status: Available</h1>
                    </c:if>
                    <c:if test="${empty itemProduct.statusProduct}">
                        <h1>Status: Spending ...</h1>
                    </c:if>
                    <h1>Stars:
                        <i class="fa-solid fa-star text-yellow-300"></i>
                        <i class="fa-solid fa-star text-yellow-300"></i>
                        <i class="fa-solid fa-star text-yellow-300"></i>
                        <i class="fa-solid fa-star text-yellow-300"></i>
                        <i class="fa-regular fa-star"></i>
                    </h1>
                    <h1>Description: ${itemProduct.descriptionProduct}</h1>
                    <div class="flex">
                        Color: 
                        <ul class="ml-2 flex gap-3">
                            <li class="w-[20px] h-[20px] bg-[#EEBCA0] rounded-[50%]"></li>
                            <li class="w-[20px] h-[20px] bg-[#26335A] rounded-[50%]"></li>
                            <li class="w-[20px] h-[20px] bg-[#15447B] rounded-[50%]"></li>
                        </ul>
                    </div>
                    <div class="flex">
                        Size: 
                        <div class="flex gap-3">
                            <p class="ml-[10px] border border-2 px-2">M</p>
                            <p class="border border-2 px-2">X</p>
                            <p class="border border-2 px-2">XL</p>
                        </div>
                    </div>
                    <div>
                        <form action="addProductToCart">
                            Quantity <input type="number" name="quantity" required="required" min="1" placeholder="Enter number ..." class="border-2 p-2 outline-none"/> </br>
                            <h1 class="my-[30px] text-center">---------------------------------------</h1>
                            <input type="hidden" name="skuProduct" value="${itemProduct.skuProduct}"/>
                            <input type="submit" value="Add To Cart" class="cursor-pointer p-4 bg-[#232f3e] text-white mt-[10px] px-10 w-[100%] rounded-lg hover:opacity-90"/>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty requestScope.detailProduct}">
            <h1>Error Show Detail Product</h1>
        </c:if>
        <jsp:include page="review.jsp" />
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
