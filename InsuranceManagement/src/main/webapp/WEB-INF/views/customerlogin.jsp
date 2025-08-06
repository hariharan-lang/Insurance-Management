<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Quicksand', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb, #a18cd1, #fbc2eb, #fad0c4, #ff9a9e);
            background-size: 400% 400%;
            animation: rainbowBG 10s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes rainbowBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            width: 400px;
            max-width: 90%;
        }

        h2 {
            text-align: center;
            color: #6a1b9a;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #333;
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #ab47bc;
            outline: none;
            box-shadow: 0 0 8px rgba(171, 71, 188, 0.3);
        }

        button {
            width: 100%;
            padding: 14px;
            background-color: #8e24aa;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #6a1b9a;
        }

        .error-msg {
            text-align: center;
            color: red;
            margin-top: 15px;
            font-weight: 600;
        }

    </style>
</head>
<body>

    <div class="login-container">
        <h2>Login to View / Claim Plan</h2>
        <form action="/log" method="post">
            <label>Email:</label>
            <input type="text" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <p class="error-msg">${error}</p>
    </div>

</body>
</html>