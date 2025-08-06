<!DOCTYPE html>
<html>
<head>
    <title>Normal Plan Benefits</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Quicksand', sans-serif;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb, #a18cd1, #fbc2eb, #fad0c4, #ff9a9e);
            background-size: 400% 400%;
            animation: rainbowBG 10s ease infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        @keyframes rainbowBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }

        h2 {
            font-size: 28px;
            color: #6a1b9a;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }

        @media (max-width: 500px) {
            .container {
                padding: 25px;
            }
            h2 {
                font-size: 24px;
            }
            p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>🎉 Congratulations!</h2>
        <p>You have <strong>1.5 months</strong> of free doctor consultations and medication.</p>
        <p>Enjoy your benefits and stay healthy! 😊</p>
    </div>

</body>
</html>