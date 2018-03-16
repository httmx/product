<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/14
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%@include file="basic.jsp"%>
</head>
<script type="text/javascript">
    $(function () {
        $("#querySaleButton").click(function () {
            var Sale=$("#querySale").val();
          location.href="${pageContext.request.contextPath}/sale/querySale?title="+Sale+"&pageNum=1&pageSize=3";
        })
    })
</script>
<body>
<div class="container">
    <%@include file="top.jsp"%>

    <div class="row">
        <%@include file="left.jsp"%>
        <div class="col-md-10">
            <h2>销售记录</h2>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-8">
                <div class="col-lg-16">
                    <div class="input-group">
                        <input type="text" class="form-control" id="querySale" name="title" >
                            <span class="input-group-btn">
                         <button class="btn btn-default" type="button" id="querySaleButton" >搜索</button>
                            </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
            </div>
        </div>
        <div class="row">
            <div>
                <h2></h2>
            </div>
        </div>
        <div class="col-lg-8 col-lg-offset-2">
            <table class="table table-striped">
                <tr>
                    <td>ID</td>
                    <td>销售记录编号</td>
                    <td>购买用户</td>
                    <td>商品名称</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>总价</td>
                    <td>日期</td>
                </tr>

                <c:forEach items="${pageInfo.list}" var="sale">
                    <tr>
                        <td>${sale.id}</td>
                        <td>${sale.saleCode}</td>
                        <td>${sale.users.userName}</td>
                        <td>${sale.product.productName}</td>
                        <td>${sale.product.price}</td>
                        <td>${sale.quantity}</td>
                        <td>${sale.totalPrice}</td>
                        <td>
                            <fmt:formatDate value="${sale.saleDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%@include file="page.jsp"%>
</div>

</body>
</html>
