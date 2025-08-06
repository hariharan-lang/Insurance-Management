<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agent Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            margin: 0;
            padding: 30px;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            color: #333;
            min-height: 100vh;
        }

        h2 {
            font-size: 28px;
            text-align: center;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        h3 {
            font-size: 22px;
            text-align: center;
            color: #34495e;
            margin-bottom: 25px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.05);
            overflow: hidden;
        }

        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #ecf0f1;
            font-size: 15px;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f0f0f0;
        }

        .empty-message {
            text-align: center;
            font-size: 18px;
            color: #888;
            margin-top: 20px;
        }

        .dashboard-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome, ${agent.userName}</h2>
        <h3>Your Assigned Customers</h3>

        <c:if test="${empty customers}">
            <div class="empty-message">No customers assigned yet.</div>
        </c:if>

        <c:if test="${not empty customers}">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Email</th>
                        <th>Plan</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${customers}" var="cust">
                        <tr>
                            <td>${cust.name}</td>
                            <td>${cust.age}</td>
                            <td>${cust.email}</td>
                            <td>${cust.selectedPlan}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
