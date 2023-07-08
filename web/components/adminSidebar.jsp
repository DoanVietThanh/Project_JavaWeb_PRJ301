<%-- 
    Document   : adminSidebar
    Created on : Jul 8, 2023, 9:09:37 AM
    Author     : Oliver Doan
--%>


<nav class="sidebar">
    <div class="text-center" >
        <a href="shop" class="logo w-full">ThanhShop</a>
    </div>
    <div class="menu-content">
        <ul class="menu-items">
            <li class="item">
                <a href="#">Dashboard</a>
            </li>
            <li class="item">
                <a href="#">User</a>
            </li>
            <li class="item">
                <a href="#">Product</a>
            </li>
            <li class="item">
                <a href="#">Category</a>
            </li>
            <li class="item">
                <a href="#">Order</a>
            </li>
            <li class="item">
                <div class="submenu-item">
                    <span>Setting</span>
                    <i class="fa-solid fa-chevron-right"></i>
                </div>

                <ul class="menu-items submenu">
                    <div class="menu-title">
                        <i class="fa-solid fa-chevron-left"></i>
                        Back
                    </div>
                    <li class="item">
                        <a href="#">Light-Dark Mode</a>
                    </li>
                    <li class="item">
                        <a href="#">Logout</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<nav class="navbar">
    <div class="flex justify-between items-center">
        <i class="fa-solid fa-bars" id="sidebar-close"></i>
        <div>
            <div>Welcome, ${sessionScope.USER.fullname}</div>
        </div>
    </div>
</nav>
