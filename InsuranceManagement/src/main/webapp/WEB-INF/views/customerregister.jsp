<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #e0f7fa, #ffffff);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow-x: hidden;
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                linear-gradient(45deg, #a7ffeb 1px, transparent 1px),
                linear-gradient(-45deg, #b2ebf2 1px, transparent 1px);
            background-size: 40px 40px;
            opacity: 0.08;
            z-index: -1;
        }

        .container {
            width: 500px;
            padding: 35px;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 20px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            text-align: center;
            color: #00796b;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }

        label {
            font-weight: 500;
            color: #333;
            margin-bottom: 6px;
            display: block;
        }

        input[type="text"],
        input[type="number"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        input:focus,
        select:focus {
            border-color: #00acc1;
            box-shadow: 0 0 8px rgba(0, 172, 193, 0.2);
            outline: none;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        button, a.cancel-btn {
            flex: 1;
            text-align: center;
            padding: 14px;
            background-color: #009688;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #00796b;
        }

        .cancel-btn {
            background-color: #ccc;
            color: #333;
        }

        .cancel-btn:hover {
            background-color: #999;
        }

        @media (max-width: 540px) {
            .container {
                width: 90%;
                padding: 25px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Customer Registration</h1>
        <form action="/customercreate" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required />

            <label for="contactNo">Contact No:</label>
            <input type="text" id="contactNo" name="contactNo" required />

            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required />

            <label for="policyType">Policy Type:</label>
            <input type="text" id="policyType" name="policyType" required />

            <label for="agentId">Select Agent:</label>
            <select id="agentId" name="agentId" required>
                <option value="">-- Select Agent --</option>
                <c:forEach var="agent" items="${agents}">
                    <option value="${agent.id}">${agent.userName}</option>
                </c:forEach>
            </select>

            <div class="btn-group">
                <button type="submit">Register</button>
                <a href="/" class="cancel-btn">Cancel</a>
            </div>
        </form>
    </div>

</body>
</html>