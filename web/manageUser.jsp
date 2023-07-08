<%-- 
    Document   : manageUser
    Created on : Jul 7, 2023, 5:14:00 PM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="./components/header.jsp"></jsp:include>
        <form action="manageUserForm">
            <label>Search User</label>
            <input type="text" name="txtSearchUser" value="${requestScope.searchUser}" placeholder="Search User ..." class="border border-2 outline-none px-4 py-2"/>
        </form>
        
        <c:if test="${not empty requestScope.listAccounts}">
            <c:forEach items="${requestScope.listAccounts}" var="itemAccount" begin="1" varStatus="counter" >
                <h1>${itemAccount.username}</h1>
            </c:forEach>
        </c:if>
                
        <c:if test="${empty requestScope.listAccounts}">
            <div class="text-center">
                <h1 class="text-[30px] text-red-700">No Record of User !!</h1>
            </div>
        </c:if>
        <jsp:include page="./components/footer.jsp"></jsp:include>
    </body>
</html>
