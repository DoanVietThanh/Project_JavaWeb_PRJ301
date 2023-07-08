<%-- 
    Document   : header
    Created on : Jul 6, 2023, 1:47:13 PM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./linkTailwind.jsp" %>

<div>
    <div
        class="flex place-content-between px-[40px] py-[20px] bg-[#131921] text-white"
        >
        <div class="text-[20px]">
            <a href="shop">
                ThanhDoan Shop
            </a>
        </div>
        <form action="searchProductForm">
            <div class="flex flex-auto rounded-lg overflow-hidden mx-[100px]">
                <div class="bg-white px-2 py-1">
                    <i class="fa-solid fa-magnifying-glass text-[#000]"></i>
                </div>
                <input
                    class="px-3 text-black outline-none w-full"
                    type="text"
                    placeholder="Search Product ...."
                    value="${requestScope.searchValue}"
                    name="txtSearchProduct"
                    />
            </div>
        </form>
        <div class="flex gap-8">
            <div class="flex gap-3 content-center items-center">
                <a href="dashboard">
                    DashBoard
                    <i class="text-[20px] cursor-pointer fa-regular fa-heart"></i>
                </a>
            </div>
            <div class="flex gap-3 content-center items-center">
                <a href="shoppingCart">
                    Shoping Cart
                    <i class="text-[20px] cursor-pointer fa-solid fa-cart-shopping"></i>
                </a>
            </div>
            <div class="flex gap-3 content-center items-center">
                <a href="logout">
                    LogOut
                    <i class="text-[20px] cursor-pointer fa-regular fa-bell"></i>
                </a>
            </div>
            <div class="flex gap-3 content-center items-center">
                <c:if test="${not empty sessionScope.USER.fullname}" >
                    <h1 class="text-[red]">
                        Welcome, ${sessionScope.USER.fullname}
                        <i class="text-[20px] fa-regular fa-user"></i>
                    </h1>
                </c:if>
                <c:if test="${empty sessionScope.USER.fullname}" >
                    <a href="login">
                        Login
                        <i class="text-[20px] cursor-pointer fa-regular fa-user"></i>
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="py-8 px-[40px] flex w-full bg-[#232F3E] text-white gap-[100px] justify-center">
        <c:if test="${sessionScope.USER.isAdmin}">
            <div>
                <a href="adminPage">Control</a>
            </div>
            <div>
                <a href="manageUserForm">Manage User</a>
            </div>
            <div>
                <a href="manageProductForm">Manage Product</a>
            </div>
        </c:if>
        <div>
            <a href="advertisementPage">Advertisement</a>
        </div>
        <div>
            <a href="blogPage">Blog</a>
        </div>
        <div>
            <a href="contactPage">Contact</a>
        </div>
    </div>
</div>