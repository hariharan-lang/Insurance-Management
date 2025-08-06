<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agent Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #333;
        }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .login-box h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .login-box h2 {
            text-align: center;
            color: #2980b9;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #1f6391;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Welcome to Insurance Management</h1>
        <h2>Agent Login</h2>

        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

        <form action="/agentlogincheck" method="post">
            <label for="userName">UserName:</label>
            <input type="text" id="userName" name="userName" required />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />

            <button type="submit">Login</button>
        </form>
         <div class="forgot-link">
            <a href="/forgotagent">Forgot Password?</a>
        </div>
    </div>
</body>
</html>