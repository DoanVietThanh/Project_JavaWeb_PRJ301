<%-- 
    Document   : shoppingCart
    Created on : Jul 10, 2023, 3:26:20 PM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="components/linkTailwind.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="./components/header.jsp"></jsp:include>
            <div class="flex justify-center">
                <div class="w-[90%] flex my-2 border border-2 border-black">
                    <div class="w-[70%] h-[70vh] overflow-y-auto font-bold">
                        <div class="p-8 pb-0">
                            <div class="text-center font-bold text-[24px]">Shoping Cart</div>
                            <form action="updateQuantityProduct" class="w-full">
                                <table border="1" class="w-full">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Price ($)</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <stop offset="0"/>
                                    <c:if test="${not empty sessionScope.CART_PRODUCT}">
                                        <c:set var="cart" value="${sessionScope.CART_PRODUCT}" />
                                        <c:forEach var="product" items="${sessionScope.CART_PRODUCT.products}" varStatus="counter">
                                            <c:set var="nameItemProduct" value="${product.value.nameProduct}" ></c:set>
                                            <c:set var="imgItemProduct" value="${product.value.imageProduct}" ></c:set>
                                            <c:set var="priceItemProduct" value="${product.value.priceProduct}" ></c:set>
                                            <c:set var="quantityItemProduct" value="${cart.itemCart[product.key]}" ></c:set>
                                            <c:set var="totalItemProduct" value="${priceItemProduct * quantityItemProduct}" ></c:set>
                                                <tr>
                                                    <td class="text-center font-bold">${counter.count}</td>
                                                <td class="text-center">${nameItemProduct}</td>
                                                <td class="w-[10%]">
                                                    <image src="${imgItemProduct}" alt="Picture Product" class="w-full"/>
                                                </td>
                                                <td class="text-center">${priceItemProduct}</td>
                                                <td class="text-center">
                                                    <form action="updateQuantityProduct"> 
                                                        <input type="hidden" name="skuProduct" value="${product.key}" />
                                                        <input type="number" name="updatedQuantity" value="${quantityItemProduct}" class="w-[80px] text-center py-2 border border-2 outline-none"/>
                                                        <input type="submit" name="updateQuantity" value="Submit"/>
                                                    </form>
                                                </td>
                                                <td class="text-center font-bold">${totalItemProduct}</td>
                                                <td class="text-center">
                                                    <c:url var="deleteItem" value="deleteItemCart">
                                                        <c:param name="skuProduct" value="${product.key}" ></c:param>
                                                    </c:url>
                                                    <a href="${deleteItem}">
                                                        Delete
                                                        <i class="fa fa-trash-alt"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="flex justify-end pr-[70px]">
                        <div class="mr-8 mb-8">Sum = $ ${cart.totalPriceCheckout}</div>
                        <a href="deleteAllProduct">Delete All <i class="fa fa-trash-alt"></i></a>
                    </div>
                </div>

                <div class="w-[30%] bg-gray-300 h-[70vh]">
                    <div class="p-8 font-bold flex flex-col gap-8">
                        <div class="text-center font-bold text-[24px] ">Summary</div>
                        <div class="my-4 pt-8 text-center border-t-4 border-black">You have <span class="text-rose-600">${cart.numberItem} item</span> in your cart</div>
                        <div>Price Ship: $5</div>
                        <div>Discount: -10%</div>
                        <c:if test="${cart.numberItem > 0}">
                            <div >Total price: $ ${(cart.totalPriceCheckout + 5)*90/100}</div>
                        </c:if>
                        <c:if test="${cart.numberItem < 1}">
                            <div >Total price: $ 0</div>
                            <div class="text-rose-600 text-center">Empty Cart</div>
                        </c:if>
                        <c:if test="${empty sessionScope.USER}" >
                            <a href="login" class="text-center text-rose-600">Please Login Here to Checkout</a>
                        </c:if>
                        <form action="#">
                            <input type="submit" value="CheckOut" class="cursor-pointer hover:opacity-80 text-center w-full p-2 bg-[#232F3E] text-white"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="./components/footer.jsp"></jsp:include>
    </body>
</html>
