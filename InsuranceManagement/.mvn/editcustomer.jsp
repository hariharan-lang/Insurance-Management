<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
</head>
<body>
    <h2>Edit Customer</h2>

    <form action="${pageContext.request.contextPath}/customer/update/${customer.id}" method="post">
        <input type="hidden" name="id" value="${customer.id}" />

        <label>Name:</label>
        <input type="text" name="name" value="${customer.name}" required /><br/><br/>

        <label>Contact Details:</label>
        <input type="text" name="contactDetails" value="${customer.contactDetails}" required /><br/><br/>

        <input type="submit" value="Update Customer" />
    </form>

    <br/>
    <a href="${pageContext.request.contextPath}/customer/all">Back to Customer List</a>
</body>
</html