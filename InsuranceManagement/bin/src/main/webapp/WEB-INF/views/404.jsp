<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Page Not Found</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap');

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            font-family: 'Poppins', sans-serif;
            color: #f0f0f0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        h1 {
            font-size: 6rem;
            margin: 0;
            font-weight: 600;
            letter-spacing: 2px;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
        }

        p {
            font-size: 1.8rem;
            margin: 20px 0 40px;
            font-weight: 300;
            max-width: 600px;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
        }

        a {
            display: inline-block;
            background-color: #ff6b6b;
            color: white;
            padding: 15px 40px;
            font-size: 1.5rem;
            font-weight: 600;
            border-radius: 50px;
            text-decoration: none;
            box-shadow: 0 8px 15px rgba(255, 107, 107, 0.4);
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #ff4757;
            box-shadow: 0 15px 20px rgba(255, 71, 87, 0.6);
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <h1>404 Page Not Found!</h1>
    <p>${errorMessage}</p>
    <a href="<c:url value='/admin/adminreg' />">Create Admin</a>
</body>
</html>