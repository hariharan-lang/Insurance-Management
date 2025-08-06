<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&family=Orbitron:wght@500&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: white;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            width: 360px;
            transition: all 0.3s ease-in-out;
        }

        .login-container h1 {
            font-family: 'Orbitron', sans-serif;
            text-align: center;
            font-size: 24px;
            color: #e74c3c;
            margin-bottom: 10px;
        }

        .login-container h2 {
            text-align: center;
            font-size: 20px;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 500;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border-radius: 10px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            outline: none;
            border-color: #5c6bc0;
            box-shadow: 0 0 5px rgba(92, 107, 192, 0.5);
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: linear-gradient(to right, #5a60ea, #5e35b1);
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .forgot-link {
            text-align: right;
            margin-top: -15px;
            margin-bottom: 20px;
        }

        .forgot-link a {
            color: #5e35b1;
            font-size: 14px;
            text-decoration: none;
            font-weight: 500;
        }

        .forgot-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h1>Welcome To Insurance Management</h1>
    <h2>Admin Login</h2>

    <c:if test="${not empty error}">
        <p class="error-message">${error}</p>
    </c:if>

    <!-- Hidden dummy fields to suppress autofill -->
    <form action="/save" method="post" autocomplete="off">
        <input type="text" name="fakeuser" style="display:none">
        <input type="password" name="fakepass" style="display:none">

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required autocomplete="username" />

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required autocomplete="current-password" />

        <div class="forgot-link">
            <a href="/forgetadmin">Forgot Password?</a>
        </div>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>