<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<c:if test="${renderContext.editMode}">
    <fmt:message key="twitter.twitterSearch.deprecated"/>
</c:if>
<fmt:message key="twitter.twitterFeed.deprecated"/>