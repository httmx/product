<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="basic.jsp"%>

<div class="col-md-2">
                <a href="${pageContext.request.contextPath}/product/toProduct?pageNum=1&pageSize=3" class="btn btn-primary btn-lg active" role="button">
                    商品列表
                </a>

        <c:if test="${loginUser.id==1}">
                <a href="${pageContext.request.contextPath}/user/toUserList?pageNum=1&pageSize=3" class="btn btn-primary btn-lg active" role="button">
                    用户管理
                </a>
                <a href="${pageContext.request.contextPath}/sale/toSale?pageNum=1&pageSize=3" class="btn btn-primary btn-lg active" role="button">
                    销售记录
                </a>
        </c:if>
</div>