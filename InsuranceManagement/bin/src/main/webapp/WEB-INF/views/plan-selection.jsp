<!DOCTYPE html>
<html>
<head>
    <title>Choose Your Plan</title>
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

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            width: 400px;
            max-width: 90%;
            text-align: center;
        }

        h2 {
            color: #6a1b9a;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
            margin-bottom: 30px;
        }

        button {
            padding: 14px 20px;
            margin: 10px;
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

        @media (max-width: 500px) {
            .container {
                padding: 25px;
            }
            button {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome ${customer.name}</h2>
        <p>Please select your insurance plan:</p>
        
        <form action="/select-plan" method="post">
            <input type="hidden" name="id" value="${customer.id}" />
            <button type="submit" name="planType" value="normal">Normal Plan - Rs.49999</button>
            <button type="submit" name="planType" value="premium">Premium Plan - Rs.89999</button>
        </form>
         <br/>
    <a href="/customer/view-claims" style="display:inline-block; margin-top:20px; text-decoration:none; color:#6a1b9a; font-weight:bold;">
        View My Claims
    </a>
    </div>

</body>
</html>