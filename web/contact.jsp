<%-- 
    Document   : contact
    Created on : Jul 8, 2023, 6:58:35 AM
    Author     : Oliver Doan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="./components/header.jsp"></jsp:include>

            <div class="flex justify-center gap-4 my-8 ">
                <div class="h-200px w-[60vw] shadow-lg shadow-indigo-500/40">
                    <div class="mapouter h-[100%]">
                        <div class="gmap_canvas h-[100%]">
                            <iframe class="h-full" width="100%" height="100%" id="gmap_canvas" src="https://maps.google.com/maps?q=đại học FPT - THủ Đức&t=&z=10&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                            <style>.mapouter{position:relative;text-align:right;height:100%;width:100%;}</style>
                            <style>.gmap_canvas {overflow:hidden;background:none!important;height:100%;width:100%;}</style>
                        </div>
                    </div>
                </div>
                <div>
                    <h1 class="font-bold">Contact Us</h1>
                    <form>
                        <div class="flex flex-col gap-4">
                            <div>
                                <label>Your Name</label>
                                <input type="text" class="border border-2 outline-none p-3 w-full" required="required"/>
                            </div>
                            <div>
                                <label>Your Email Address</label>
                                <input type="email" class="border border-2 outline-none p-3 w-full" required="required"/>
                            </div>
                            <div>
                                <label>Your message</label>
                                <textarea class="border border-2 outline-none p-3 w-full" required="required"/></textarea>
                            </div>
                            <div class="flex justify-end">
                                <input type="submit" class="px-8 py-2 bg-[#232F3E] text-white cursor-pointer rounded-lg hover:opacity-90"/>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        <jsp:include page="./components/footer.jsp"></jsp:include>

    </body>
</html>
