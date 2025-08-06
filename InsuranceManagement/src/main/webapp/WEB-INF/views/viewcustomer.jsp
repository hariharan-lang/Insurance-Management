<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Customers</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap');

        body {
            font-family: 'Quicksand', sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(to right, #ff9a9e, #fad0c4, #fbc2eb, #a1c4fd, #c2e9fb);
            background-size: 200% 200%;
            animation: gradientMove 8s ease infinite;
            min-height: 100vh;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffffcc;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #6a11cb;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0f7fa;
        }

        a {
            padding: 6px 12px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            margin: 0 5px;
        }

        a[href*="upd"] {
            background-color: #27ae60;
            color: white;
        }

        a[href*="delete"] {
            background-color: #e74c3c;
            color: white;
        }

        a:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>
    <h1>All Customers</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Contact No</th>
             <th>email</th>
            <th>Policy Type</th>
            
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.age}</td>
                <td>${customer.contactNo}</td>
                <td>${customer.email}</td>
                <td>${customer.policyType}</td>
                
               
                <td>
                    <a href="/cusupd/${customer.id}">Edit</a>
                    <a href="/cusdelete/${customer.id}" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
      <div class="center">
        <a href="${pageContext.request.contextPath}/adminDashboard" class="back-btn"> Back to Admin Dashboard</a>
    </div>
</body>
</html>