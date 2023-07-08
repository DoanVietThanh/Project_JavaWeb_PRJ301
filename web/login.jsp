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
    </head>
    <body>
        <div class="flex justify-center items-center bg-[#ffff]">
            <div class="bg-[#fff]">
                <form action="loginForm" method="POST" class="p-[80px] border border-2 rounded-lg" >
                    <h1 class="font-bold p-2 text-center">Login Form</h1>
                    <div class="py-2">
                        <i class="fa-regular fa-user size-[20px]"></i>
                        <input name="txtUsername" type="text" placeholder="Enter your username ..." required="required" class="p-2 border border-2 outline-none"/>
                    </div>
                    <div class="py-2">
                        <i class="fa-solid fa-lock"></i>
                        <input name="txtPassword" type="password" placeholder="Enter your password ..." required="required" class="p-2 border border-2 outline-none"/>
                    </div>
                    <div>
                        <input type="reset" value="Reset" class="p-2 border border-2 cursor-pointer"/> </br>
                        <input type="submit" value="Login" class="p-2 border border-2 cursor-pointer w-full my-4"/>
                    </div>
                    <label></label>
                </form>
            </div>
        </div>
    </body>
</html>