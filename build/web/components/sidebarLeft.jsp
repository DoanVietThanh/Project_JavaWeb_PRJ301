<%-- 
    Document   : sidebarLeft
    Created on : Jul 6, 2023, 9:31:33 PM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="p-4">
    <div class="border border-2">
        <h1 class="font-bold text-center text-[20px]">Filter</h1>
        <c:if test="${not empty requestScope.listCategory}">
            <details open="open" class="p-2">
                <summary class="font-bold cursor-pointer ml-4">Category:</summary>
                <ul class="ml-3 mt-1 flex flex-col">
                    <c:forEach items="${requestScope.listCategory}" var="itemListCate">
                        <c:url var="sortCate" value="sortCategory">
                            <c:param name="sortBy" value="${itemListCate.nameCategory}"></c:param>
                        </c:url>
                        <li class="py-2 hover:bg-[#dadada] hover:opacity-100 w-full text-center">
                            <a href="${sortCate}" class="w-full px-[36%]">${itemListCate.nameCategory}</a>
                        </li>
                    </c:forEach>
                    <li class="py-4 hover:bg-[#dadada] hover:opacity-100 w-full text-center">
                        <a href="shop" class="w-full px-[36%]">All</a>
                    </li>
                </ul>
            </details>
        </c:if>
        <details open="open" class="p-2 my-6">
            <summary class="font-bold cursor-pointer ml-4">Price: </summary>
            <ul class="ml-3 mt-1 flex flex-col">
                <c:url var="upPrice" value="sortPrice">
                    <c:param name="sortBy" value="increasePrice"></c:param>
                </c:url>
                <c:url var="downPrice" value="sortPrice">
                    <c:param name="sortBy" value="decreasePrice"></c:param>
                </c:url>
                <li class="py-4 hover:bg-[#dadada] hover:opacity-100 w-full text-center">
                    <a href="${upPrice}" class="w-full px-[10%]">Downward Price</a>
                </li>
                <li class="py-4 hover:bg-[#dadada] hover:opacity-100 w-full text-center">
                    <a href="${downPrice}" class="w-full px-[10%]">Upward Price</a>
                </li>
            </ul>
        </details>
    </div>
</div>