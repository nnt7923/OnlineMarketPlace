<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        /* Reset m?c ??nh */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }

        /* Header */
        header {
            background-color: #64c14a;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        header .logo h1 {
            font-size: 24px;
            font-weight: bold;
        }

        header .user-info {
            display: flex;
            align-items: center;
        }

        header .user-info span {
            margin-right: 20px;
        }

        header .user-info .logout-btn {
            background-color: #fff;
            color: #64c14a;
            padding: 5px 15px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        header .user-info .logout-btn:hover {
            background-color: #eaeaea;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            position: fixed;
            height: 100vh;
            padding: 20px 0;
        }

        .sidebar ul {
            list-style: none;
            padding-left: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            display: block;
            padding: 10px;
            transition: background-color 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #575757;
        }

        /* Main content */
        .content {
            margin-left: 250px;
            padding: 40px;
        }

        .content section {
            display: none; /* ?n m?c ??nh */
            margin-bottom: 40px;
        }

        .content h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 15px;
        }

        .content p {
            font-size: 16px;
            color: #666;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <h1>Fruitables Dashboard</h1>
        </div>
        <div class="user-info">
            <span>Admin</span>
            <a href="#logout" class="logout-btn">Logout</a>
        </div>
    </header>

    <!-- Sidebar -->
    <nav class="sidebar">
        <ul>
            <li><a href="#manageCategories" data-section="manageCategories">Manage Categories</a></li>
            <li><a href="account?service=listAll" data-section="manageAccounts">Manage Accounts</a></li>
            <li><a href="#reports" data-section="reports">Reports</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="content">
        <section id="manageCategories">
            <h2>Manage Categories</h2>
            <p>Here you can manage product categories.</p>
        </section>

        <section id="accounts">
            <h2>Manage Accounts</h2>

            <form action="account?service=listAll" method="get">
                <input type="text" name="keyword" placeholder="Search by username">
                <input type="hidden" name="service" value="searchAccount">
                <button type="submit">Search</button>
            </form>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Role ID</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Account> accounts = (List<Account>) request.getAttribute("accounts");
                        if (accounts != null && !accounts.isEmpty()) {
                            for (Account account : accounts) {
                    %>
                    <tr>
                        <td><%= account.getAccountId()%></td>
                        <td><%= account.getUsername()%></td>
                        <td><%= account.getPassword() %></td>
                        <td><%= account.getEmail()%></td>
                        <td><%= account.getPhone()%></td>
                        <td><%= account.getAddress()%></td>
                        <td><%= account.getRoleId()%></td>
                        <td><%= account.getStatus()%></td>
                        <td>
                            <a href="account?service=updateAccountForm&accountId=<%= account.getAccountId()%>">Edit</a>
                            <a href="account?service=deleteAccount&accountId=<%= account.getAccountId()%>" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8">No accounts found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <a href="account?service=addAccountForm">Add New Account</a>
        </section>

        <section id="reports">
            <h2>Reports</h2>
            <p>View all the reports here.</p>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const sections = document.querySelectorAll('section');
            const links = document.querySelectorAll('.sidebar ul li a');


            // ?n t?t c? c?c section
            sections.forEach(section => section.style.display = 'none');

            // Hi?n th? section ??u ti?n
            document.querySelector('#manageCategories').style.display = 'block';

            // X? l? s? ki?n khi nh?n v?o li?n k?t trong sidebar

            links.forEach(link => {
                link.addEventListener('click', function(e) {
                    const sectionID = link.getAttribute('data-section');
                    if (sectionID !== "manageAccounts") {
                        e.preventDefault();
                        sections.forEach(section => section.style.display = 'none');
                        // Hi?n th? section ???c ch?n
                        const targetSection = document.getElementById(sectionID);
                        targetSection.style.display = 'block';
                    } else {
                        window.location.href = "account?service=listAll"; // ?i?u h??ng ??n servlet Manage Accounts
                    }
                });
            });
        });
    </script>
</body>
</html>