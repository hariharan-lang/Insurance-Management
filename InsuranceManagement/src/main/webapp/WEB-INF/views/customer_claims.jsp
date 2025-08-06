<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Claims</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@600&display=swap');

        body {
            margin: 0;
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(270deg, #d7c1f9, #a9d6e5, #fcd5ce, #d7c1f9);
            background-size: 800% 800%;
            animation: rainbowBG 60s ease infinite;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px;
            min-height: 100vh;
            color: #222;
        }

        @keyframes rainbowBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h2 {
            font-size: 36px;
            color: #4a2c91;
            text-shadow: 1px 1px 4px rgba(74,44,145,0.6);
            margin-bottom: 30px;
        }

        table {
            border-collapse: collapse;
            width: 95%;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }

        th, td {
            padding: 16px 22px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        th {
            background-color: #7a52f8;
            color: white;
            font-size: 18px;
            text-shadow: none;
        }

        tr:hover {
            background-color: #f0f0ff;
        }

        td {
            font-size: 15px;
        }
    </style>
</head>
<body>

<h2> My Claims </h2>

<table>
    <thead>
        <tr>
            <th>Claim ID</th>
            <th>Patient Name</th>
            <th>Hospital Name</th>
            <th>Admission Date</th>
            <th>Reason</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="claim" items="${claims}">
            <tr>
                <td>${claim.id}</td>
                <td>${claim.patientName}</td>
                <td>${claim.hospitalName}</td>
                <td>${claim.admissionDate}</td>
                <td>${claim.reason}</td>
                <td>${claim.amount}</td>
                <td>${claim.status}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>