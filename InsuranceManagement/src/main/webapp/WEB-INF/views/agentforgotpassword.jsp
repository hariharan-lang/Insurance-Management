<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Agent Forgot Password</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: 600;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1f6391;
        }

        .message {
            margin-top: 15px;
            color: green;
            text-align: center;
            font-weight: bold;
        }

        .error {
            margin-top: 15px;
            color: red;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <c:if test="${not empty message}">
            <p class="message">${message}</p>
        </c:if>

        <!-- 👇 Show username form ONLY if not verified yet -->
        <c:if test="${not showReset}">
            <form action="/agentforgot" method="post">
                <label for="username">Enter your Username:</label>
                <input type="text" id="username" name="username" required />
                <button type="submit">Verify Username</button>
            </form>
        </c:if>
        <c:if test="${not empty message}">
  <p style="color: green; text-align: center;">${message}</p>
</c:if>

        <!-- 👇 Show password reset form ONLY if username is verified -->
        <c:if test="${showReset}">
            <form action="/agentreset" method="post">
                <input type="hidden" name="username" value="${username}" />
                <label for="newPassword">Enter New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required />
                <button type="submit">Reset Password</button>
            </form>
        </c:if>
    </div>
</body>
</html>