<c:forEach var="claim" items="${claims}">
    <p>${claim.patientName} - ${claim.amount}</p>
    <form action="/admin/approveClaim" method="post">
        <input type="hidden" name="claimId" value="${claim.id}" />
        <input type="submit" value="Approve" />
    </form>
    <form action="/admin/rejectClaim" method="post">
        <input type="hidden" name="claimId" value="${claim.id}" />
        <input type="submit" value="Reject" />
    </form>
</c:forEach>