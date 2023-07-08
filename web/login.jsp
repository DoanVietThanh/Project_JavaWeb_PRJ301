<%-- 
    Document   : login
    Created on : Jul 7, 2023, 9:40:58 AM
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
                <div class="select-none text-center font-bold mb-[20px] text-[30px] bg-[#F36F21] text-white">Login</div>
                <div>
                    <form action="loginForm" class="flex flex-col gap-4" method="POST">
                        <div>
                            <input type="text" name="txtUsername" placeholder="Enter Your Username..." required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                        </div>
                        <div>
                            <input type="password" name="txtPassword" placeholder="Enter Your Password..." required="required" class="inputLogin bg-transparent w-full p-4 border border-2 outline-none"/>
                        </div>
                        <div class="text-center font-bold text-red-600">${requestScope.InvalidInput}</div>
                        <div class="text-center ">
                            <input type="submit" class="cursor-pointer py-2 w-[40%] rounded-lg font-bold bg-[#F36F21] text-white hover:opacity-80" value="SUBMIT"/>
                        </div>
                    </form>
                </div>
                <div class="select-none text-center">Don't have an account? <a href="registerPage" class="text-purple-950 font-bold hover:text-blue-700">Register</a></div>
            </div>
        </div>
    </body>
</html>