<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Claim Form</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@600&display=swap');

        body {
            margin: 0;
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(-45deg, #fceabb, #e0c3fc, #c2e9fb, #fcb69f);
            background-size: 400% 400%;
            animation: bgAnim 20s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        @keyframes bgAnim {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 16px;
            width: 420px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
            border: 3px solid transparent;
            animation: borderGlow 10s linear infinite;
        }

        @keyframes borderGlow {
            0% { border-color: #ffb347; }
            50% { border-color: #ff6ec4; }
            100% { border-color: #ffb347; }
        }

        h2 {
            text-align: center;
            color: #ff4500;
            font-size: 28px;
            margin-bottom: 25px;
            text-shadow: 0 0 8px rgba(255, 69, 0, 0.4);
        }

        label {
            display: block;
            color: #333;
            font-weight: bold;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 18px;
            font-size: 14px;
            background: #f9f9f9;
            color: #222;
        }

        textarea {
            resize: vertical;
            height: 80px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #ff4500;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-shadow: 0 0 5px #000;
            box-shadow: 0 0 12px #ff4500;
            transition: background 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #ff6347;
            transform: scale(1.03);
            box-shadow: 0 0 20px #ff6347;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>CLAIM FORM </h2>
    <form action="/customer/submitClaim" method="post" enctype="multipart/form-data">
        <input type="hidden" name="planId" value="${planId}" />

        <label>Patient Name</label>
        <input type="text" name="patientName" required />

        <label>Hospital Name</label>
        <input type="text" name="hospitalName" required />

        <label>Admission Date</label>
        <input type="date" name="admissionDate" required />

        <label>Reason for Claim</label>
        <textarea name="reason" required></textarea>

        <label>Amount Claimed</label>
        <input type="number" step="0.01" name="amount" required />

        <label>Upload Document</label>
        <input type="file" name="document" required />

        <input type="submit" value="Submit Claim" />
    </form>
</div>

</body>
</html>