<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Agents</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #eef2f3, #8e9eab);
            margin: 0;
            padding: 40px 0;
            color: #2c3e50;
        }

        h1 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 30px;
            color: #34495e;
        }

        table {
            width: 90%;
            max-width: 1000px;
            margin: auto;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 14px 20px;
            text-align: center;
            font-size: 15px;
        }

        th {
            background-color: #2d98da;
            color: #fff;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #ecf0f1;
        }

        .actions a {
            text-decoration: none;
            color: #fff;
            background-color: #27ae60;
            padding: 6px 12px;
            margin: 0 4px;
            border-radius: 5px;
            font-size: 13px;
            transition: 0.3s ease;
        }

        .actions a.delete {
            background-color: #e74c3c;
        }

        .actions a.view {
            background-color: #2980b9;
        }

        .actions a:hover {
            opacity: 0.85;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #34495e;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            transition: background-color 0.3s ease;
            margin: 30px auto 0 auto;
        }

        .back-btn:hover {
            background-color: #2c3e50;
        }

        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>All Registered Agents</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>Password</th>
              
            </tr>
        </thead>
        <tbody>
            <c:forEach var="agent" items="${agents}">
                <tr>
                    <td>${agent.id}</td>
                    <td>${agent.userName}</td>
                    <td>${agent.password}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="center">
        <a href="${pageContext.request.contextPath}/adminDashboard" class="back-btn"> Back to Admin Dashboard</a>
    </div>
</body>
</html>