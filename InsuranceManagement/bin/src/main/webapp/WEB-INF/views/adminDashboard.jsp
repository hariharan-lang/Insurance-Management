<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 20px;
            font-family: 'Nunito', sans-serif;
            /* Removed background-image */
            background-color: #f5f7fa;  /* light grayish blue - change as you want */
            color: #333;
        }

        h1 {
            text-align: center;
            font-size: 36px;
            color: #1e1f26;
            margin-bottom: 40px;
            padding-bottom: 10px;
            border-bottom: 3px solid #ccc;
        }

        h3 {
            font-size: 24px;
            font-weight: 700;
            margin: 40px 0 20px;
            padding-left: 8%;
        }

        .agent-heading { color: #1976d2; }
        .customer-heading { color: #c62828; }

        table {
            width: 85%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff; /* full white background for tables */
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.07);
        }

        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #eee;
            font-size: 15px;
        }

        th { font-weight: 600; }
        .agent-table th { background-color: #e3f2fd; color: #0d47a1; }
        .customer-table th { background-color: #ffebee; color: #b71c1c; }

        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background-color: #f1f1f1; transition: background-color 0.3s ease; }

        a {
            text-decoration: none;
            font-weight: 600;
        }

        a:hover { text-decoration: underline; }

        .action-links a, .action-links button {
            margin: 0 6px;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            color: white;
            border: none;
            transition: background-color 0.3s ease;
        }

        .edit-btn {
            background-color: #42a5f5;
        }

        .edit-btn:hover {
            background-color: #1e88e5;
        }

        .delete-btn {
            background-color: #ef5350;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }

        .approve-btn {
            background-color: #81c784;
        }

        .approve-btn:hover {
            background-color: #66bb6a;
        }

        .reject-btn {
            background-color: #e57373;
        }

        .reject-btn:hover {
            background-color: #ef5350;
        }

        .action-links form { display: inline; }

        .logout-container-top {
            position: absolute;
            top: 20px;
            right: 30px;
        }

        .logout-container-top button {
            padding: 10px 20px;
            background-color: #ef5350;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: background-color 0.3s ease;
        }

        .logout-container-top button:hover {
            background-color: #c62828;
        }

        @media (max-width: 768px) {
            table, th, td { font-size: 13px; }
            .logout-container-top {
                position: static;
                text-align: center;
                margin-bottom: 20px;
            }
            h3 { padding-left: 0; text-align: center; }
        }
    </style>
</head>
<body>
    <!-- Logout Button Top Right -->
    <div class="logout-container-top">
        <form action="logout" method="post">
            <button type="submit">Logout</button>
        </form>
    </div>

    <h1>Welcome to Admin Dashboard</h1>

    <!-- Agent Table -->
    <h3 class="agent-heading"> Agents List</h3>
    <table class="agent-table">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="agent" items="${agents}">
            <tr>
                <td>${agent.id}</td>
                <td><a href="viewAgentCustomers/${agent.id}">${agent.userName}</a></td>
                <td>${agent.password}</td>
                <td class="action-links">
                    <a href="agentupdated/${agent.id}" class="edit-btn">Edit</a>
                    <a href="agentdelete/${agent.id}" class="delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- Customer Table -->
    <h3 class="customer-heading"> Customer List</h3>
    <table class="customer-table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Contact No</th>
            <th>Email</th>
            <th>Policy Type</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.age}</td>
                <td>${customer.contactNo}</td>
                <td>${customer.email}</td>
                <td>${customer.policyType}</td>
                <td class="action-links">
                    <a href="/cusupd/${customer.id}" class="edit-btn">Edit</a>
                    <a href="/cusdelete/${customer.id}" class="delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- Claims Table -->
    <h3 style="color:#2e7d32;">Pending Claims</h3>
    <table class="customer-table">
        <tr>
            <th>ID</th>
            <th>Patient Name</th>
            <th>Hospital</th>
            <th>Admission Date</th>
            <th>Reason</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Document</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="claim" items="${claims}">
            <tr>
                <td>${claim.id}</td>
                <td>${claim.patientName}</td>
                <td>${claim.hospitalName}</td>
                <td>${claim.admissionDate}</td>
                <td>${claim.reason}</td>
                <td>${claim.amount}</td>
                <td>${claim.status}</td>
                <td>
                    <c:if test="${not empty claim.document}">
                        <a href="/admin/view-document/${claim.id}" target="_blank"> View</a>
                    </c:if>
                    <c:if test="${empty claim.document}">
                        ❌ No File
                    </c:if>
                </td>
                <td class="action-links">
                    <form action="/admin/approveClaim" method="post">
                        <input type="hidden" name="claimId" value="${claim.id}" />
                        <button type="submit" class="approve-btn">Approve</button>
                    </form>
                    <form action="/admin/rejectClaim" method="post">
                        <input type="hidden" name="claimId" value="${claim.id}" />
                        <button type="submit" class="reject-btn">Reject</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>