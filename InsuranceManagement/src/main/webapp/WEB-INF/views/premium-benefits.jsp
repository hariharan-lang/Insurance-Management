<!DOCTYPE html>
<html>
<head>
    <title>Premium Plan Benefits</title>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Quicksand', sans-serif;
            background: linear-gradient(135deg, #fbc2eb, #a6c1ee, #fbc2eb, #a6c1ee);
            background-size: 400% 400%;
            animation: rainbowBG 12s ease infinite;
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
            background-color: rgba(255, 255, 255, 0.96);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.25);
            text-align: center;
            max-width: 520px;
            width: 90%;
        }

        h2 {
            font-size: 30px;
            color: #2e7d32;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #444;
            margin: 10px 0;
        }

        strong {
            color: #00897b;
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
        <p>You have <strong>5 months</strong> of free doctor consultations, medications, ambulance facilities, and food.</p>
        <p>Enjoy your benefits and stay healthy! 💖</p>
    </div>

</body>
</html>