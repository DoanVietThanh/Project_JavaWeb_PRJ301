<%-- 
    Document   : advertisement
    Created on : Jul 7, 2023, 10:53:31 PM
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
            <div class="my-8 w-full flex justify-center gap-4">
                <div class="shadow-lg shadow-indigo-500/40">
                    <iframe width="600" height="400" src="https://www.youtube.com/embed/qlJiMiOnXkg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
                <div class="shadow-lg shadow-indigo-500/40">
                    <iframe width="600" height="400"  src="https://www.youtube.com/embed/ZO2ckbzJLjw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
            </div>
        <jsp:include page="./components/footer.jsp"></jsp:include>
    </body>
</html>
