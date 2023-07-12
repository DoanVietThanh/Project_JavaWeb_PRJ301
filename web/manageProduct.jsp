<%-- 
    Document   : manageProduct
    Created on : Jul 7, 2023, 5:14:14 PM
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
                    <h1 class="font-bold text-[30px]">Manage Product</h1>
                    <form action="adminCreateProductPage">
                        <input type="submit" value="Create New Product" class="cursor-pointer bg-[#232F3E] px-4 py-2 text-[#fff] hover:opacity-80"/>
                    </form>
                    <form action="manageProductForm">
                        <label class="font-bold">Search Product</label>
                        <input type="text" name="txtSearchProduct" value="${requestScope.searchProduct}" placeholder="Search Product ..." class="border border-2 outline-none px-4 py-2"/>
                    </form>
                </div>

                <c:if test="${not empty requestScope.listProducts}">
                    <c:set var="listProduct" value="${requestScope.listProducts}" />
                    <table border="1" class="w-full ">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>SKU</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Status</th>        
                                <th>Stars</th>        
                                <th>CategoryID</th>      
                                <th>Price</th>      
                                <th>Description</th>      
                                <th>Image</th>      
                                <th>Delete</th>      
                                <th>Update</th>      
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="itemProduct" items="${listProduct}" varStatus="counter">
                                <tr class="text-center">
                            <form action="updateProductForm" class="text-center">
                                <td class="font-bold">${counter.count}</td>
                                <td>
                                    ${itemProduct.skuProduct}
                                    <input type="hidden" name="skuProduct" value="${itemProduct.skuProduct}" />
                                </td>
                                <td>${itemProduct.nameProduct}</td>
                                <td >
                                    <input  type="number" name="quantity" required="required" value="${itemProduct.quantityProduct}" class="w-[60px] text-center"/>
                                </td>
                                <td>
                                    <input type="number" name="status" required="required" value="${itemProduct.statusProduct}" min="0" max="1" class="w-[40px] text-center"/>
                                </td>
                                <td>
                                    <input type="number" name="stars" required="required" value="${itemProduct.starsProduct}" min="1" max="5" class="w-[40px] text-center"/>
                                </td>
                                <td>
                                    <input type="number" name="cateID" required="required" value="${itemProduct.categoryID}" min="1" class="w-[60px] text-center"/>
                                </td>
                                <td>
                                    <input type="number" name="price" required="required" value="${itemProduct.priceProduct}" min="1" class="w-[100px] text-center"/>
                                </td>
                                <td>
                                    <input type="text" name="desc" required="required" value="${itemProduct.descriptionProduct}" class="text-center"/>
                                </td>
                                <td class="flex justify-center">
                                    <image src="${itemProduct.imageProduct}" alt="img Product" class="w-[30px]"/>
                                </td>
                                <td>
                                    <c:url var="delProduct" value="deleteProduct">
                                        <c:param name="skuProduct" value="${itemProduct.skuProduct}"></c:param>
                                        <c:param name="searchValue" value="${requestScope.searchProduct}" ></c:param>
                                    </c:url>
                                    <a href="${delProduct}">
                                        <i class="fa fa-trash-alt"></i>
                                    </a>
                                </td>
                                <td>
                                    <input type="submit" value="Update" class="cursor-pointer"/>
                                </td>
                            </form>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty requestScope.listProducts}">
                    <div class="text-center">
                        <h1 class="text-[30px] text-red-700">No Record of Product !!</h1>
                    </div>
                </c:if>
            </div>
        </main>
        <script>
            <jsp:include page="./js/admin.js" />
        </script>
    </body>
</html>
