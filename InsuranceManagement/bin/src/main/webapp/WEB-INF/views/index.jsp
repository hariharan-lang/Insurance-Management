<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>MedCare Insurance Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: url(https://wallpapers.com/images/high/mbbs-normal-heartbeat-chart-03moceytirakrcpt.webp) no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            text-align: center;
        }

        .glass-container {
            background: rgba(255, 255, 255, 0.12);
            border-radius: 25px;
            padding: 50px 60px;
            max-width: 650px;
            width: 90%;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border: 1px solid rgba(255, 255, 255, 0.25);
            animation: zoomIn 0.6s ease;
        }

        h1 {
            font-weight: 700;
            font-size: 2.6rem;
            margin-bottom: 40px;
            color: #e4faff;
            text-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
        }

        .btn-group {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .btn {
            padding: 14px 32px;
            font-size: 16px;
            font-weight: 600;
            color: #d00000; /* red text */
            background: #fffaf0; /* milk white background */
            border: none;
            border-radius: 14px;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.2);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #ffe6e6;
            box-shadow: 0 6px 20px rgba(255, 100, 100, 0.5);
            transform: translateY(-3px);
        }

        .login-options {
            margin-top: 30px;
            display: none;
            animation: fadeIn 0.4s ease forwards;
        }

        .login-options .btn {
            background: rgba(255, 100, 100, 0.85);
            color: white;
            box-shadow: 0 4px 15px rgba(255, 100, 100, 0.4);
        }

        .login-options .btn:hover {
            background: rgba(255, 100, 100, 1);
            box-shadow: 0 6px 20px rgba(255, 100, 100, 0.6);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes zoomIn {
            from { transform: scale(0.9); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        @media (prefers-color-scheme: dark) {
            body {
                background-color: #121212;
                color: #f1f1f1;
            }
            .glass-container {
                background: rgba(18, 18, 18, 0.4);
                border: 1px solid rgba(255, 255, 255, 0.12);
            }
        }

        @media (max-width: 600px) {
            .glass-container {
                padding: 30px 25px;
            }

            h1 {
                font-size: 2rem;
                margin-bottom: 25px;
            }

            .btn-group {
                flex-direction: column;
                gap: 15px;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
    <script>
        function toggleLoginOptions() {
            document.getElementById("login-options").style.display = "block";
            document.getElementById("signup-options").style.display = "none";
        }

        function toggleSignupOptions() {
            document.getElementById("signup-options").style.display = "block";
            document.getElementById("login-options").style.display = "none";
        }
    </script>
</head>
<body>
    <div class="glass-container">
        <!-- Logo removed -->

        <h1>Welcome to MedCare Insurance Portal</h1>

        <div class="btn-group">
            <button class="btn" onclick="toggleSignupOptions()">Signup</button>
            <button class="btn" onclick="toggleLoginOptions()">Login</button>
        </div>

        <div class="btn-group login-options" id="signup-options">
            <button class="btn" onclick="location.href='createagent'">Create Agent</button>
            <button class="btn" onclick="location.href='createcustomer'">Create Customer</button>
            <button class="btn" onclick="location.href='createadmin'">Create Admin</button>
        </div>

        <div class="btn-group login-options" id="login-options">
            <button class="btn" onclick="location.href='agentlogin'">Agent Login</button>
            <button class="btn" onclick="location.href='customerlogin'">Customer Login</button>
            <button class="btn" onclick="location.href='adminlogin'">Admin Login</button>
        </div>
    </div>
</body>
</html>
