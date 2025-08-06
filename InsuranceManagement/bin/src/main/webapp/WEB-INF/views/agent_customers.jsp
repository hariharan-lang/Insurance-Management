<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #fce4ec);
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #2e3c62;
            margin-bottom: 30px;
            text-shadow: 1px 1px #ccc;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        thead {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
        }

        th, td {
            padding: 15px 18px;
            text-align: center;
            font-size: 15px;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
            transition: background-color 0.3s ease;
        }

        th {
            font-weight: 600;
            font-size: 16px;
            letter-spacing: 0.5px;
        }

        td {
            color: #555;
        }
    </style>
</head>
<body>

    <h2>Customer List</h2>

    <table>
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Contact No</th>
                <th>Email</th>
                <th>Policy Type</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.age}</td>
                    <td>${customer.contactNo}</td>
                    <td>${customer.email}</td>
                    <td>${customer.policyType}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>