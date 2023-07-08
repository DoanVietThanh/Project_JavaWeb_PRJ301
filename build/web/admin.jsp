<%-- 
    Document   : admin
    Created on : Jul 8, 2023, 8:43:15 AM
    Author     : Oliver Doan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="components/linkTailwind.jsp" />
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sidebar Menu for Admin Dashboard | CodingNepal</title>
        <link rel="stylesheet" href="css/admin.css" />
        <!-- Fontawesome CDN Link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    </head>
    <body>
        <jsp:include page="components/adminSidebar.jsp" />
        <main class="main">
            <div class="pt-[80px] px-[20px]">
                <h1>Admin Dashboard Content</h1>
                <h1>Admin Dashboard Content</h1>
                <h1>Admin Dashboard Content</h1>
            </div>
        </main>

        <script>
            const sidebar = document.querySelector(".sidebar");
            const sidebarClose = document.querySelector("#sidebar-close");
            const menu = document.querySelector(".menu-content");
            const menuItems = document.querySelectorAll(".submenu-item");
            const subMenuTitles = document.querySelectorAll(".submenu .menu-title");
            sidebarClose.addEventListener("click", () => sidebar.classList.toggle("close"));
            menuItems.forEach((item, index) => {
                item.addEventListener("click", () => {
                    menu.classList.add("submenu-active");
                    item.classList.add("show-submenu");
                    menuItems.forEach((item2, index2) => {
                        if (index !== index2) {
                            item2.classList.remove("show-submenu");
                        }
                    });
                });
            });
            subMenuTitles.forEach((title) => {
                title.addEventListener("click", () => {
                    menu.classList.remove("submenu-active");
                });
            });
        </script>
    </body>
</html>