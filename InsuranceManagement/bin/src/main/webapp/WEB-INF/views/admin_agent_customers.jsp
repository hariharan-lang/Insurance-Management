<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>${agentName} - Customers</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            margin: 0;
            padding: 30px;
            color: #333;
        }

        h2 {
            text-align: center;
            font-weight: 600;
            font-size: 28px;
            color: #222;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            font-size: 16px;
            margin-bottom: 30px;
            font-weight: bold;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 16px;
            text-align: center;
        }

        th {
            background-color: #3949ab;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f4f6ff;
        }

        tr:hover {
            background-color: #e8eaf6;
        }

        .no-data {
            text-align: center;
            font-size: 18px;
            margin-top: 30px;
            color: #d32f2f;
        }
    </style>
</head>
<body>

    <h2>Customers assigned to Agent: ${agentName}</h2>
    
    <p>Total customers: ${fn:length(customers)}</p>

    <c:if test="${empty customers}">
        <div class="no-data">No customers assigned yet.</div>
    </c:if>

    <c:if test="${not empty customers}">
        <table>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Email</th>
                <th>Selected Plan</th>
            </tr>
            <c:forEach items="${customers}" var="cust">
                <tr>
                    <td>${cust.name}</td>
                    <td>${cust.age}</td>
                    <td>${cust.email}</td>
                    <td>${cust.selectedPlan}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

</body>
</html>