<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agent List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 30px;
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(120deg, #f6f9fc, #e9eff5);
            color: #2c3e50;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #34495e;
            margin-bottom: 40px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
        }

        table {
            width: 90%;
            max-width: 900px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.06);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 16px 20px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #3498db;
            color: #fff;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #e8f4fd;
            transition: background-color 0.3s ease;
        }

        a {
            color: #2980b9;
            font-weight: 600;
            text-decoration: none;
            padding: 8px 14px;
            background-color: #dff1ff;
            border-radius: 6px;
            display: inline-block;
        }

        a:hover {
            background-color: #b3e5fc;
        }

        @media (max-width: 600px) {
            th, td {
                font-size: 14px;
                padding: 12px 14px;
            }

            h2 {
                font-size: 26px;
            }
        }
    </style>
</head>
<body>

    <h2>Agent Directory</h2>

    <table>
        <tr>
            <th>Agent Name</th>
            <th>View Customers</th>
        </tr>

        <c:forEach items="${agents}" var="agent">
            <tr>
                <td>${agent.userName}</td>
                <td><a href="/admin/viewcustomerdetails/${agent.id}">View Customers</a></td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
