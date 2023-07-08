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
                <summary >Category:</summary>
                <ul class="ml-3 mt-1">
                    <c:forEach items="${requestScope.listCategory}" var="itemListCate">
                        <li>${itemListCate.nameCategory}</li>
                    </c:forEach>
                </ul>
            </details>
        </c:if>
        <details open="open" class="p-2 my-6">
            <summary>Filter:</summary>
            <ul class="ml-3 mt-1">
                <li>Giá giảm dần</li>
                <li>Giá tăng dần</li>
            </ul>
        </details>
    </div>
</div>