<%-- 
    Document   : register
    Created on : Jul 8, 2023, 9:58:02 PM
    Author     : Oliver Doan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="components/linkTailwind.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .backgroundLogin {
                height: 100vh;
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
        <div class=" backgroundLogin h-full w-full flex justify-center items-center">
            <div class="loginForm w-[30%] border border-2 p-8">
                <div class="select-none text-center font-bold mb-[20px] text-[30px] bg-[#F36F21] text-white">Sign Up</div>
                <div>
                    <form action="registerForm" class="flex flex-col gap-4">
                        <div>
                            <input type="text" name="txtUsername" placeholder="Enter Your Username (6-20 chars)" required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                        </div>
                        <div class="text-red-600">${requestScope.ERROR_SIGNUP.usernameLengthError}</div>
                        <div class="text-red-600">${requestScope.ERROR_SIGNUP.usernameIsExisted}</div>
                        <div>
                            <input type="text" name="txtFullname" placeholder="Enter Your Fullname (5-30 chars)" required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                        </div>
                        <div class="text-red-600">${requestScope.ERROR_SIGNUP.fullnameLengthError}</div>
                        <div>
                            <input type="password" name="txtPassword" placeholder="Enter Your Password (8-30 chars)" required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
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
                <div class="select-none text-center">You have an account? <a href="login" class="text-purple-950 font-bold hover:text-blue-700">Login</a></div>
            </div>
        </div>
    </body>
</html>