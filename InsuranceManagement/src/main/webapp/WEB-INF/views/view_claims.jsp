<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Claims Status</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #fceabb, #f8b500, #fceabb, #f8b500);
            background-size: 400% 400%;
            animation: rainbowShift 10s ease infinite;
            margin: 0;
            padding: 30px;
        }

        @keyframes rainbowShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h2 {
            text-align: center;
            color: #8b0000;
            font-size: 32px;
            margin-bottom: 30px;
            text-shadow: 1px 1px #fff;
        }

        table {
            border-collapse: collapse;
            width: 95%;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            border-radius: 15px;
            overflow: hidden;
        }

        thead {
            background-color: #8b0000;
            color: #ffffff;
        }

        th, td {
            padding: 16px 22px;
            text-align: center;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
        }

        tbody tr:hover {
            background-color: #ffeaea;
        }

        td.status {
            font-weight: bold;
            border-left: 5px solid #8b0000;
        }

        .approved {
            color: green;
        }

        .rejected {
            color: red;
        }

        .pending {
            color: #ff8c00;
        }

        th:first-child, td:first-child {
            border-left: 5px solid #8b0000;
        }
    </style>
</head>
<body>

    <h2>Claims Status</h2>

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
                    <td class="status 
                        ${claim.status eq 'APPROVED' ? 'approved' : 
                          claim.status eq 'REJECTED' ? 'rejected' : 'pending'}">
                        ${claim.status}
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
