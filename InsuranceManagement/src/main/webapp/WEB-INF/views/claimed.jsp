<!DOCTYPE html>
<html>
<head>
    <title>Plan Already Claimed</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #fff0f0;
            font-family: 'Roboto Slab', serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #b71c1c;
        }

        .container {
            background: #ffebee;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(183, 28, 28, 0.3);
            text-align: center;
            max-width: 480px;
            width: 90%;
        }

        h2 {
            font-size: 36px;
            margin-bottom: 20px;
            font-weight: 700;
            letter-spacing: 2px;
            text-shadow: 1px 1px 3px #d32f2f;
        }

        p {
            font-size: 20px;
            font-weight: 500;
            margin: 0;
            color: #d32f2f;
        }

        @media (max-width: 500px) {
            .container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 28px;
            }

            p {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Sorry!</h2>
        <p>${message}</p>
    </div>

</body>
</html>