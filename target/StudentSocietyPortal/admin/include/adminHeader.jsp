<header class="header" style="background-color: #041538;  color: white;">
 <div class="admin-header">
     <h3 class="greet">Welcome, Admin!</h3>
     <a href="${pageContext.request.contextPath}/admin/LogoutServlet" class="logout">Logout</a>

 </div>
</header>

<style>

    .logout{
        background-color: #721c24;
        padding: 3px;
        color: white;


    }
    .greet{
        margin-left: 20px;
        margin-right: 800px;
    }
  .admin-header{
      display: flex;
      justify-content: space-between;
  }
</style>
