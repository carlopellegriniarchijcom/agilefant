<%@ include file="/WEB-INF/jsp/inc/_taglibs.jsp"%>
<%@ tag description="Constructs a single field in the story tree"%>

<%@ attribute type="fi.hut.soberit.agilefant.model.Story" name="story"%>

<%@ attribute type="java.lang.String" name="type" %>
<%@ attribute type="java.lang.Boolean" name="displayLinksToStories" %>

<c:choose>
<c:when test="${type == 'state'}">
  <span class="inlineStoryState storyState${story.state}" title="<aef:text name="story.state.${story.state}" />"><aef:text name="story.stateAbbr.${story.state}" /></span>
</c:when>
<c:when test="${type == 'storyPoints'}">
  <span class="treeStoryPoints" title="Story points">
  <c:choose>
  <c:when test="${story.storyPoints != null}">
    ${story.storyPoints}
  </c:when>
  <c:otherwise>
    &ndash;
  </c:otherwise>
  </c:choose>
  </span>
</c:when>
<c:when test="${type == 'labels'}">
  <c:choose>
  <c:when test="${fn:length(story.labels) == 0}">
    <span class="labelIcon labelIconNoLabel">&nbsp;</span>
  </c:when>
  <c:when test="${fn:length(story.labels) == 1}">
    <%--  REFACTOR: This hack is here because java.util.Set does not support the bracket notation ( story.labels[0] )--%>
    <span class="labelIcon"><c:forEach items="${story.labels}" var="label"><c:out value="${fn:substring(label.name, 0, 4)}" /></c:forEach></span> 
  </c:when>
  <c:otherwise>
    <span class="labelIcon labelIconMultiple" title="${aef:joinNamedObjects(story.labels)}">&nbsp;</span>
  </c:otherwise>
  </c:choose>
</c:when>
<c:when test="${type == 'name'}">
  <c:choose>
  <c:when test="${displayLinksToStories == true}">
    <a href="qrq.action?q=story:${story.id}">
      <span class="storyTreeName"><c:out value="${story.name}" /></span>
    </a>
  </c:when>
  <c:otherwise>
    <span class="storyTreeName"><c:out value="${story.name}" /></span>
   </c:otherwise>
  </c:choose>
</c:when>
<c:when test="${type == 'backlog'}">
  <span style="font-size:80%; color: #666;" title="Story's backlog">
    (<c:out value="${story.backlog.name}"/>)
  </span>
</c:when>
<c:when test="${type == 'breadcrumb'}">
  <c:choose>
    <c:when test="${story.iteration != null}">
      <span style="font-size:80%; color: #666;" title="Story's iteration">[<c:if test="${story.iteration.parent == null}">&#321; </c:if><c:out value="${story.iteration.name}"/>]
      </span>
    </c:when>
  </c:choose>
</c:when>
</c:choose>