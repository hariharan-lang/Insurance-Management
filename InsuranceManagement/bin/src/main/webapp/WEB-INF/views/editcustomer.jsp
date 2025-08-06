<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap');

        body {
            font-family: 'Quicksand', sans-serif;
            background-image: url('https://www.transparenttextures.com/patterns/diagmonds-light.png'), 
                              url('https://cdn.pixabay.com/photo/2017/06/07/05/23/stethoscope-2388497_1280.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            padding: 40px;
            margin: 0;
            color: #2c3e50;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            background: rgba(255, 255, 255, 0.92);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2980b9;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #219150;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #2980b9;
            text-decoration: none;
            font-weight: 600;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Customer</h2>

        <form action="${pageContext.request.contextPath}/updcus/${customer.id}" method="post">
            <input type="hidden" name="id" value="${customer.id}" />

            <label>Name:</label>
            <input type="text" name="name" value="${customer.name}" required />

            <label>Age:</label>
            <input type="number" name="age" value="${customer.age}" required />

            <label>Contact No:</label>
          <input type="text" name="contactNo" value="${customer.contactNo}" required />
            
            <label>Email:</label>
           <input type="text" name="email" value="${customer.email}" required />

            <label>Policy Type:</label>
            <input type="text" name="policyType" value="${customer.policyType}" required />

           

            <input type="submit" value="Update Customer" />
        </form>

       <a href="${pageContext.request.contextPath}/adminDashboard" class="back-btn"> Back to Admin Dashboard</a>
    </div>
</body>
</html>