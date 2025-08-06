<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - View Claims</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #00796b;
            margin-bottom: 30px;
        }

        table {
            width: 95%;
            margin: auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background: #ffffff;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background-color: #004d40;
            color: white;
            padding: 15px;
        }

        td {
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f8e9;
        }

        a {
            color: #0288d1;
            text-decoration: none;
            font-weight: bold;
        }

        button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            margin: 2px;
            font-weight: bold;
            cursor: pointer;
        }

        button[name="status"][value="APPROVED"] {
            background-color: #2e7d32;
            color: white;
        }

        button[name="status"][value="REJECTED"] {
            background-color: #c62828;
            color: white;
        }

        .disabled-status {
            font-weight: bold;
            color: #555;
        }
    </style>
</head>
<body>

<h2>All Customer Claims</h2>

<table>
    <thead>
        <tr>
            <th>Claim ID</th>
            <th>Customer Name</th>
            <th>Patient Name</th>
            <th>Hospital</th>
            <th>Reason</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Report</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="claim" items="${claims}">
            <tr>
                <td>${claim.id}</td>
                <td>${claim.customer.name}</td>
                <td>${claim.patientName}</td>
                <td>${claim.hospitalName}</td>
                <td>${claim.reason}</td>
                <td>${claim.amount}</td>
                <td>${claim.status}</td>
                <td>
                    <c:if test="${not empty claim.document}">
                        <a href="/admin/view-document/${claim.id}" target="_blank">View Report</a>
                    </c:if>
                    <c:if test="${empty claim.document}">
                        <span style="color: #d32f2f;">No report uploaded</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${claim.status eq 'PENDING' and not empty claim.document}">
                        <form action="/admin/updateClaimStatus" method="post" style="display:inline;">
                            <input type="hidden" name="claimId" value="${claim.id}" />
                            <button type="submit" name="status" value="APPROVED">Approve</button>
                        </form>
                        <form action="/admin/updateClaimStatus" method="post" style="display:inline;">
                            <input type="hidden" name="claimId" value="${claim.id}" />
                            <button type="submit" name="status" value="REJECTED">Reject</button>
                        </form>
                    </c:if>
                    <c:if test="${claim.status ne 'PENDING'}">
                        <span class="disabled-status">${claim.status}</span>
                    </c:if>
                    <c:if test="${empty claim.document}">
                        <span style="color: #999;">Awaiting Report</span>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>