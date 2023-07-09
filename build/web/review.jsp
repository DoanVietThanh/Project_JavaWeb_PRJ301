<%-- 
    Document   : review
    Created on : Jul 7, 2023, 9:37:01 PM
    Author     : Oliver Doan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-full bg-white flex flex-col justify-center items-center">
    <div class="w-[80%] bg-[#f5f5f5] my-4 p-4">
        <div>
            <h1 class="font-bold">Ratings And Reviews</h1>
            <div class="flex w-full justify-between items-center my-4">
                <div>5 Star</div>
                <div class="w-[80%] h-[16px] bg-[#dadada] rounded-lg overflow-hidden">
                    <div class="w-[100%] h-full bg-green-300"></div>
                </div>
                <div>230 ratings</div>
            </div>
            <div class="flex w-full justify-between items-center my-4">
                <div>4 Star</div>
                <div class="w-[80%] h-[16px] bg-[#dadada] rounded-lg overflow-hidden">
                    <div class="w-[80%] h-full bg-blue-600"></div>
                </div>
                <div>80 ratings</div>
            </div>
            <div class="flex w-full justify-between items-center my-4">
                <div>3 Star</div>
                <div class="w-[80%] h-[16px] bg-[#dadada] rounded-lg overflow-hidden">
                    <div class="w-[60%] h-full bg-cyan-300"></div>
                </div>
                <div>5 ratings</div>
            </div>
            <div class="flex w-full justify-between items-center my-4">
                <div>2 Star</div>
                <div class="w-[80%] h-[16px] bg-[#dadada] rounded-lg overflow-hidden">
                    <div class="w-[40%] h-full bg-yellow-300"></div>
                </div>
                <div>4 ratings</div>
            </div>
            <div class="flex w-full justify-between items-center my-4">
                <div>1 Star</div>
                <div class="w-[80%] h-[16px] bg-[#dadada] rounded-lg overflow-hidden">
                    <div class="w-[20%] h-full bg-rose-400"></div>
                </div>
                <div>0 ratings</div>
            </div>
        </div>
        <div class="text-center">----------------------------</div>
        <div class="my-8">
            <div class="flex w-full gap-3">
                <div class="w-[8%] rounded-lg overflow-hidden">
                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Avatar User" class="w-full"/>
                </div>
                <div class="w-[90%]">
                    <h1 class="font-bold">ThanhDoan</h1>
                    <p class="italic my-1">Tuesday, 10/07/2023</p>
                    <p>
                        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections.
                    </p>
                </div>
            </div>
        </div>
        <div class="my-8">
            <div class="flex w-full gap-3">
                <div class="w-[8%] rounded-lg overflow-hidden">
                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="Avatar User" class="w-full"/>
                </div>
                <div class="w-[90%]">
                    <h1 class="font-bold">I love Fullstack</h1>
                    <p class="italic my-1">Monday, 09/07/2023</p>
                    <p>
                        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections.
                    </p>
                </div>
            </div>
        </div>
        <div class="my-8">
            <div class="flex w-full gap-3">
                <div class="w-[8%] rounded-lg overflow-hidden">
                    <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="Avatar User" class="w-full"/>
                </div>
                <div class="w-[90%]">
                    <h1 class="font-bold">Dân Lập Trình Viên</h1>
                    <p class="italic my-1">Sunday, 08/07/2023</p>
                    <p>
                        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections.
                    </p>
                </div>
            </div>
        </div>
        <div class="my-8">
            <div class="flex w-full gap-3">
                <div class="w-[8%] rounded-lg overflow-hidden">
                    <img src="	https://bootdey.com/img/Content/avatar/avatar4.png" alt="Avatar User" class="w-full"/>
                </div>
                <div class="w-[90%]">
                    <h1 class="font-bold">Dân Lập Trình Viên</h1>
                    <p class="italic my-1">Sunday, 08/07/2023</p>
                    <p>
                        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections.
                    </p>
                </div>
            </div>
        </div>
        <c:if test="${not empty requestScope.listComment}">
            <c:forEach items="${requestScope.listComment}" var="itemComment" >
                <div class="my-8">
                    <div class="flex w-full gap-3">
                        <div class="w-[8%] rounded-lg overflow-hidden">
                            <img src="	https://bootdey.com/img/Content/avatar/avatar5.png" alt="Avatar User" class="w-full"/>
                        </div>
                        <div class="w-[90%]">
                            <h1 class="font-bold">${itemComment.username}</h1>
                            <p class="italic my-1">${itemComment.date}</p>
                            <p>
                                ${itemComment.textComment}
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
    <div class="w-full flex justify-center my-3 p-8 ">
        <div class="w-[84%]">
            <h1 class="mb-2 font-bold select-none">Leave Your Comment 
                <c:if test="${empty sessionScope.USER.username}">
                    <a href="login" class="text-rose-600 ml-3 hover:opacity-65"> Login to Comment !</a>
                </c:if>
            </h1>
            <form action="commentDetailProduct">
                <textarea name="textComment" required="required" placeholder="Enter your comment ..." class="px-4 py-2 border border-2 outline-none w-full"></textarea>
                <div class="flex justify-end my-2">
                    <input type="hidden" name="skuProduct" value="${requestScope.skuProduct}" />
                    <button type="submit" class="px-4 py-2 bg-[#232F3E] text-white">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>