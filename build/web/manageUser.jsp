<%-- 
    Document   : manageUser
    Created on : Jul 7, 2023, 5:14:00 PM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="components/linkTailwind.jsp" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sidebar Menu</title>
        <link rel="stylesheet" href="css/admin.css" />
        <!-- Fontawesome CDN Link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    </head>
    <body>
        <jsp:include page="components/adminSidebar.jsp" />
        <main class="main">
            <div class="pt-[80px] px-[20px]">
                <div class="flex justify-between items-center border-b-4 py-2">
                    <h1 class="font-bold text-[30px]">Manage User</h1>
                    <form action="adminCreateUser">
                        <input type="submit" value="Create New Account" class="cursor-pointer bg-[#232F3E] px-4 py-2 text-[#fff] hover:opacity-80"/>
                    </form>
                    <form action="manageUserForm">
                        <label>Search User</label>
                        <input type="text" name="txtSearchUser" value="${requestScope.searchUser}" placeholder="Search User ..." class="border border-2 outline-none px-4 py-2"/>
                    </form>
                </div>

                <c:if test="${not empty requestScope.listAccounts}">
                    <c:set var="listAccount" value="${requestScope.listAccounts}" />
                    <table border="1" class="w-full ">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Full name</th>
                                <th>Role</th>        
                                <th>Delete</th>        
                                <th>Update</th>      
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listAccount}" var="itemAccount" begin="1" varStatus="counter" >
                                <tr>
                            <form action="updateUserForm" class="p-8 my-2">
                                <td class="text-center">${counter.count}</td>
                                <td>
                                    ${itemAccount.username}
                                    <input name="txtUsername" type="hidden" value="${itemAccount.username}"/>
                                </td>
                                <td class="flex justify-center">
                                    <input type="text" name="txtPassword" value="${itemAccount.password}" class="w-[80%] px-4 border borer-2"/>
                                </td>
                                <td>
                                    <input type="text" name="txtFullname" value="${itemAccount.fullname}" />
                                </td>
                                <td class="text-center">
                                    <c:set var="admin" value="True"></c:set>
                                        <select name="isAdmin">
                                        <c:if test="${itemAccount.isAdmin == admin}">
                                            <option selected="selected" value="1">Admin</option>
                                            <option value="0">User</option>
                                        </c:if>
                                        <c:if test="${itemAccount.isAdmin != admin}">
                                            <option value="1">Admin</option>
                                            <option selected="selected" value="0">User</option>
                                        </c:if>
                                    </select>
                                </td>

                                <td class="text-center">
                                    <c:url var="delete" value="deleteUser">
                                        <c:param name="name" value="${itemAccount.username}"></c:param>
                                        <c:param name="searchValue" value="${requestScope.searchUser}"></c:param>
                                    </c:url>
                                    <a href="${delete}">Delete</a>
                                </td>
                                <td class="text-center">
                                    <input type="submit" value="Update" class="cursor-pointer"/>
                                </td>
                            </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty requestScope.listAccounts}">
                    <div class="text-center">
                        <h1 class="text-[30px] text-red-700">No Record of User !!</h1>
                    </div>
                </c:if>
            </div>
        </main>
        <script>
            <jsp:include page="./js/admin.js" />
        </script>
    </body>
</html>
