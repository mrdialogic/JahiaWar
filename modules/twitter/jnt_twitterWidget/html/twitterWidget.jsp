<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="inline" key="twitterJS">
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</template:addResources>
<%--

List of properties

- widgetId (string) mandatory indexed=no
- width (long) indexed=no
- height (long) indexed=no
- linkcolor (color) indexed=no
- theme (string, choicelist) = light indexed=no < dark,light
- noheader (boolean)  indexed=no
- nofooter (boolean)  indexed=no
- noborders (boolean)  indexed=no
- noscrollbar (boolean) indexed=no
- transparant (boolean)  indexed=no
- bordercolor (color)  indexed=no
- language (string)  indexed=no
- tweetlimit (long) indexed=no < '[0-20]*'
- related (string)  indexed=no
- ariapolite (string, choicelist) = "assertive" < "polite", "assertive"

--%>
<c:set var="properties" value="${currentNode.properties}"/>
<div id="preview" class="preview" data-url="/settings/widgets/preview">
    <c:choose>
        <c:when test="${!renderContext.editMode}">
            <a class="twitter-timeline"
               data-widget-id="${currentNode.properties.widgetId.string}"
               href="https://twitter.com/twitterapi"
                    <c:if test="${not empty properties.width}">
                        width="${properties.width.long}"
                    </c:if>
                    <c:if test="${not empty properties.height}">
                        height="${properties.height.long}"
                    </c:if>
                    <c:if test="${not empty properties.linkcolor}">
                        data-link-color="${properties.linkcolor.string}"
                    </c:if>
               data-chrome="<c:if test="${properties.noheader.boolean}">noheader </c:if> <c:if test="${properties.nofooter.boolean}">nofooter </c:if><c:if test="${properties.noborders.boolean}">noborders </c:if><c:if test="${properties.noscrollbar.boolean}">noscrollbar </c:if><c:if test="${properties.transparent.boolean}">transparent </c:if>"
                    <c:if test="${not empty properties.bordercolor}">
                        border-color="${properties.bordercolor.string}"
                    </c:if>
                    <c:if test="${not empty properties.language}">
                        lang="${properties.language.string}"
                    </c:if>
                    <c:if test="${not empty properties.tweetlimit}">
                        data-tweet-limit="${properties.tweetlimit.long}"
                    </c:if>
                    <c:if test="${not empty properties.theme}">
                        data-theme="${properties.theme.string}"
                    </c:if>
                    <c:if test="${not empty properties.related}">
                        data-related="${properties.related.string}"
                    </c:if>
                    <c:if test="${not empty properties.ariapolite}">
                        data-aria-polite="${properties.ariapolite.string}"
                    </c:if>

                    >${currentNode.displayableName}</a>
        </c:when>
        <c:otherwise>
            <div style="(border solid 1 px black)">
                <img src="<c:url value='${url.currentModule}/icons/jnt_twitterWidget_large.png'/>"> <strong>Twitter Widget</strong>
                </br><fmt:message key="twitter.editMessage"/>
                </br><a href="https://twitter.com/settings/widgets/${currentNode.properties.widgetId.string}/edit" target="_blank"><fmt:message key="twitter.editConfig"/></a>
            </div>
        </c:otherwise>
    </c:choose>
</div>