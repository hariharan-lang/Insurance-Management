<html>
<head>
    <title>Claim Submitted</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            height: 100vh;
            background: linear-gradient(270deg, #ff6ec4, #7873f5, #57e3ff, #5ee7df, #f8ffae);
            background-size: 1000% 1000%;
            animation: rainbowBG 10s ease infinite;
            font-family: 'Orbitron', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        @keyframes rainbowBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .popup {
            background-color: #ffffff;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0,0,0,0.3);
            text-align: center;
            animation: zoomIn 0.7s ease;
            max-width: 500px;
        }

        @keyframes zoomIn {
            from { transform: scale(0); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .popup h2 {
            font-size: 36px;
            color: #4caf50;
            margin-bottom: 10px;
        }

        .popup p {
            font-size: 20px;
            color: #333;
        }

        .checkmark {
            font-size: 80px;
            color: #4caf50;
            animation: pop 0.4s ease-in-out forwards;
        }

        @keyframes pop {
            0% { transform: scale(0.5); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>

    <div class="popup" id="successPopup">
        <div class="checkmark"></div>
        <h2>Thank you!</h2>
        <p>Your claim has been submitted successfully<br>and is pending for approval.</p>
    </div>

    <script>
        // Optional: Add sound or alert later if needed 
        setTimeout(() => {
            document.getElementById("successPopup").style.boxShadow = "0 0 50px #4caf50";
        }, 1000);
    </script>

</body>
</html>