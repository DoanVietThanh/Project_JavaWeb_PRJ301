<%-- 
    Document   : adminCreateUser
    Created on : Jul 8, 2023, 4:11:11 PM
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
        <style>
            .backgroundLogin {
                height: 80vh;
                width: 100vw;
                background: url('https://cdn.tuoitre.vn/2021/4/21/fpt-hinh-1--thumbnail--1618982244543115484692.png') no-repeat;
                background-size: cover;
                background-position: center;
            }
            .loginForm {
                background: transparent;
                border: 2px solid rgba(255,255,255,.9);
                border-radius: 20px;
                backdrop-filter: blur(30px);
                padding: 80px;
            }
            .inputLogin::placeholder {
                color: black;
            }
        </style>
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


                <div class=" backgroundLogin w-full flex justify-center items-center">
                    <div class="loginForm w-[30%] border border-2 p-8">
                        <div>
                            <form action="adminCreateUser" class="flex flex-col gap-4">
                                <div>
                                    <input type="text" name="txtUsername" placeholder="Your Username (6-20 chars)" required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                                </div>
                                <div class="text-red-600">${requestScope.ERROR_SIGNUP.usernameLengthError}</div>
                                <div class="text-red-600">${requestScope.ERROR_SIGNUP.usernameIsExisted}</div>
                                <div>
                                    <input type="text" name="txtFullname" placeholder="Your Fullname (5-30 chars)" required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                                </div>
                                <div class="text-red-600">${requestScope.ERROR_SIGNUP.fullnameLengthError}</div>
                                <div>
                                    <input type="password" name="txtPassword" placeholder="Your Password (8-30 chars)" required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                                </div>
                                <div class="text-red-600">${requestScope.ERROR_SIGNUP.passwordLengthError}</div>
                                <div>
                                    <input type="password" name="txtConfirmPassword" placeholder="Retype Password..." required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                                </div>
                                <div class="text-red-600">${requestScope.ERROR_SIGNUP.confirmNotMatchError}</div>
                                <div class="text-center ">
                                    <input type="submit" class="cursor-pointer py-2 w-[40%] rounded-lg font-bold bg-[#F36F21] text-white hover:opacity-80" value="SUBMIT"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <script>
            <jsp:include page="./js/admin.js" />
        </script>
    </body>
</html>
