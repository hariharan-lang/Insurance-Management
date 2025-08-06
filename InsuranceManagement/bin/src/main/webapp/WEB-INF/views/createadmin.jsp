<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Register</title>
    <style>
       
        @import url('https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap');

      
        body {
            margin: 0;
            padding: 0;
            font-family: 'Rubik', sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

      
        .register-container {
            background-color: white;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 360px;
        }

       
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #3f51b5;
            font-size: 28px;
            font-weight: 700;
        }

      
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 15px;
        }

        
        form input[type="text"],
        form input[type="password"],
        form input[type="email"] {
            width: 100%;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1.8px solid #ddd;
            font-size: 15px;
            margin-bottom: 20px;
            transition: border-color 0.3s ease;
        }
        form input[type="text"]:focus,
        form input[type="password"]:focus,
        form input[type="email"]:focus {
            border-color: #3f51b5;
            outline: none;
        }

       
        button {
            width: 100%;
            padding: 14px;
            background-color: #3f51b5;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #303f9f;
        }

        /* Error messages */
        .error {
            color: #d32f2f;
            font-size: 13px;
            margin-top: -15px;
            margin-bottom: 15px;
            font-weight: 600;
            display: block;
        }

       
        .success-message {
            text-align: center;
            color: #388e3c;
            margin-bottom: 25px;
            font-weight: 700;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2>Admin Register</h2>

    <c:if test="${not empty success}">
        <p class="success-message">${success}</p>
    </c:if>

    <form:form action="${pageContext.request.contextPath}/adminregister" method="post" modelAttribute="admindto">
        <label for="username">Username:</label>
        <form:input path="username" id="username" />
        <form:errors path="username" cssClass="error" />

        <label for="password">Password:</label>
        <form:password path="password" id="password" />
        <form:errors path="password" cssClass="error" />

        <button type="submit">Register</button>
    </form:form>
</div>

</body>
</html>