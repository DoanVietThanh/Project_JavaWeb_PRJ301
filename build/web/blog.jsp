<%-- 
    Document   : blog
    Created on : Jul 7, 2023, 10:33:17 PM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/blog.css" />
    </head>
    <body>
        <jsp:include page="./components/header.jsp"></jsp:include>
            <div class="text-center">
            <c:url var="homePage" value="/"></c:url>
            <a href="${homePage}" class="hover:opacity-70">Home</a>- Blog Page
        </div>
        <c:forEach begin="1" end="4" >
            <div class="my-[30px] flex flex-col gap-4 justify-center items-center">
                <a href="https://www.wix.com/blog/how-to-start-a-fashion-blog?utm_source=google&utm_medium=cpc&utm_campaign=15541610090^134848741670&experiment_id=^^568798457213^^_DSA&gclid=Cj0KCQjw756lBhDMARIsAEI0AgnDVn1lUDzzmGAadqgHTRoIEI-kDUrxYE0g0zn6zTEi-Eouzh4tgloaAoqNEALw_wcB">
                    <div class="p-4 w-[80vw] flex gap-8 justify-center cursor-pointer shadow-lg shadow-indigo-500/40 my-4">
                        <div class="w-[20%]">
                            <img class="w-full" src="https://static.wixstatic.com/media/6542d9_cb078770acde4b71819ceb3d3d5cb40b~mv2.png" alt="Blog Picture" />
                        </div>
                        <div class="w-[60%]">
                            <h1 class="font-bold">Title: The Upward Trend of Using Fashion Clothes</h1>
                            <h2 class="font-medium italic">Date: 05/06/2023</h2>
                            <p class="">
                                Content: Having a great sense of style and affinity for new trends, it’s no wonder why you’d want to become a fashion blogger. In much the same way as fashion transcends borders, creating a blog lets you bring your ideas and expertise onto the global stage.  
                            </p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
        <jsp:include page="./components/footer.jsp"></jsp:include>
    </body>
</html>
