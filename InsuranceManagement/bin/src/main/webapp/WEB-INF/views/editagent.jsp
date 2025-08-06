<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Agent</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: #fff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            text-align: center;
            color: #d35400;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #2c3e50;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #e67e22;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #d35400;
        }

        .back-link {
            margin-top: 15px;
            text-align: center;
        }

        .back-link a {
            text-decoration: none;
            color: #2980b9;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Edit Agent</h1>
        <form action="${pageContext.request.contextPath}/updatedagent/${agent.id}" method="post">
            <input type="hidden" name="id" value="${agent.id}" />

            <label for="userName">UserName:</label>
            <input type="text" name="userName" id="userName" value="${agent.userName}" required />

            <label for="password">Password:</label>
            <input type="text" name="password" id="password" value="${agent.password}" required />

            <input type="submit" value="Update Agent" />
        </form>

        <div class="back-link">
            <a href="${pageContext.request.contextPath}/agentall">← Back to Agent List</a>
        </div>
    </div>
</body>
</html>