<header class="header">
  <div class="header-content">
    <div class="left">Hello, Admin</div>
    <div class="right">
      <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Logout</button>
      </form>
    </div>
  </div>
</header>

<style>
  .header {
    background-color: #041538;
    color: white;
    padding: 15px 20px;
  }

  .header-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .logout-btn {
    background-color: #e74c3c;
    border: none;
    padding: 8px 15px;
    color: white;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
  }

  .logout-btn:hover {
    background-color: #c0392b;
  }
</style>
