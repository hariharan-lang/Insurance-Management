<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head><title>Available Plans</title></head>
<body>
<h2>Your Insurance Plans</h2>

<table border="1">
    <tr>
        <th>Plan ID</th>
        <th>Plan Name</th>
        <th>Coverage Amount</th>
        <th>Action</th>
    </tr>

    <c:forEach var="plan" items="${plans}">
        <tr>
            <td>${plan.id}</td>
            <td>${plan.name}</td>
            <td>${plan.coverageAmount}</td>
            <td>
                <form action="/customer/claim-form" method="get">
                    <input type="hidden" name="planId" value="${plan.id}" />
                    <input type="submit" value="Claim" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>