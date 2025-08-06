<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Forgot Password</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        .error {
            color: red;
            text-align: center;
        }
        .success {
            color: green;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="box">
    <h2>Forgot Password</h2>

    <c:choose>
        <c:when test="${empty showReset}">
            <form action="/adminforgot" method="post">
                <label>Username:</label>
                <input type="text" name="username" required />
                <button type="submit">Verify User</button>
            </form>
        </c:when>

        <c:otherwise>
            <form action="/adminreset" method="post">
                <input type="hidden" name="username" value="${username}" />
                <label>New Password:</label>
                <input type="password" name="newPassword" required />
                <button type="submit">Reset Password</button>
            </form>
        </c:otherwise>
    </c:choose>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <c:if test="${not empty message}">
        <p class="success">${message}</p>
    </c:if>
</div>

</body>
</html>
