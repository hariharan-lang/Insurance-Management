<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Agent - Page Not Found</title>
    <style>
        body {
            background: #d1ecf1;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #0c5460;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            font-size: 4rem;
            margin-bottom: 0.5rem;
        }
        p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
        }
        a {
            background: #0c5460;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease;
        }
        a:hover {
            background: #14535f;
        }
    </style>
</head>
<body>
    <h1>404 - Agent Page Not Found</h1>
    <p>${errorMessage}</p>
    <a href="<c:url value='/agent/agentreg' />">create Agent</a>
</body>
</html>