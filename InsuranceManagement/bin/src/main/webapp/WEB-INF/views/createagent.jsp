<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Agent Create</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f6d365, #fda085, #84fab0, #8fd3f4);
            background-size: 400% 400%;
            animation: gradientShift 10s ease infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .form-box {
            background-color: #ffffffdd;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            text-align: center;
            color: #2d3436;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .error {
            color: red;
            font-size: 13px;
            margin-bottom: 15px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #6a89cc;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background-color: #4a69bd;
        }

        .success-message {
            text-align: center;
            color: green;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="form-box">
    <h1>Agent Create</h1>

    <c:if test="${not empty success}">
        <p class="success-message">${success}</p>
    </c:if>

    <form:form action="${pageContext.request.contextPath}/agentreg" method="post" modelAttribute="agentDTO">
        <label for="userName">UserName:</label>
        <form:input path="userName" id="userName"/>
        <form:errors path="userName" cssClass="error"/>

        <label for="password">Password:</label>
        <form:password path="password" id="password"/>
        <form:errors path="password" cssClass="error"/>

        <button type="submit">Create Agent</button>
    </form:form>
</div>
</body>
</html>