<%-- 
    Document   : adminCreateProduct
    Created on : Jul 12, 2023, 9:12:10 PM
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
                height: 78vh;
                width: 100vw;
                background: url('https://cdn.tuoitre.vn/2021/4/21/fpt-hinh-1--thumbnail--1618982244543115484692.png') no-repeat;
                background-size: cover;
                background-position: center;
            }
            .loginForm {
                width: 600px;
                background: transparent;
                border: 2px solid rgba(255,255,255,.9);
                border-radius: 20px;
                backdrop-filter: blur(90px);
                padding: 80px 160px;
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
                    <h1 class="font-bold text-[30px]">Manage Product</h1>
                    <form action="adminCreateProductPage">
                        <input type="submit" value="Create New Product" class="cursor-pointer bg-[#232F3E] px-4 py-2 text-[#fff] hover:opacity-80"/>
                    </form>
                    <form action="manageProductForm">
                        <label class="font-bold">Search Product</label>
                        <input type="text" name="txtSearchProduct" value="${requestScope.searchProduct}" placeholder="Search Product ..." class="border border-2 outline-none px-4 py-2"/>
                    </form>
                </div>


                <div class=" backgroundLogin w-full flex justify-center items-center">
                    <div class="loginForm w-[30%] border border-2 p-8">
                        <div>
                            <form action="adminCreateProduct" class="flex flex-col gap-4">
                                <div class="flex justify-between">
                                    <label>SKU</label>
                                    <c:if test="${not empty requestScope.existed_SKU}">
                                        <p class="text-rose-600">Existed</p>
                                    </c:if>
                                    <input name="sku" type="text" placeholder="Enter sku..." required="required" minlength="3"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Name</label>
                                    <input name="name" type="text" placeholder="Enter name..." required="required" minlength="3"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Quantity</label>
                                    <input name="quantity" type="number" min="1" placeholder="Enter quantity..." required="required"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Status</label>
                                    <input name="status" type="number" min="0" max="1" required="required"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Stars</label>
                                    <input name="stars" type="number" min="1" max="5" required="required"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Category ID</label>
                                    <input name="categoryID" type="number" min="1" placeholder="Enter Category ID ..." required="required"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Price</label>
                                    <input name="price" type="number" min="1" placeholder="Enter Price..." required="required"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Description</label>
                                    <input name="description" type="text" placeholder="Enter Description..." required="required"/>
                                </div>
                                <div class="flex justify-between">
                                    <label>Image</label>
                                    <input name="image" type="text" placeholder="Enter link img..." required="required"/>
                                </div>
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
