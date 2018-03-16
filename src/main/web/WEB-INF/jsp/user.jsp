<%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 2-5-2018-005
  Time: 10:32 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%@include file="basic.jsp"%>
    <script type="text/javascript">
        $(function () {

            //展示修改用户模态框
            $("button[name=updateUserButton]").click(function () {
                var id=$(this).attr("no");
                $.get("${pageContext.request.contextPath}/user/queryUserById",
                    {"id":id},function (data) {
                        $("#updateUserName").val(data.userName);
                        $("input[name='status']").prop("checked",false);
                        $("input[name='status'][value='"+data.status+"']").prop("checked",true)
                        var status = $('input[name="status"]:checked').val();
                        $("#status").val(status);
                        $("#updateUserId").val(data.id);
                        $("#updateUserModal").modal("show");
                    })
            })
            //修改用户保存按钮
            $("#updateUserSaveButton").click(function () {
                var user=$("#updateUserForm").serialize();
                var url="${pageContext.request.contextPath}/user/updateUser";
                $.post(url,user,function (data) {
                    alert(data.msg);
                    location.href=location.href;
                })
            })

            //显示添加用户模态框
            $("#addUserButton").click(function () {
                $("#addUserModal").modal("show");
            })
            //添加用户保存
            $("#addUserSaveButton").click(function () {
                //序列化表单数据
                var user=$("#addUserForm").serialize();
                var url="${pageContext.request.contextPath}/user/addUser";
                $.post(url,user,function (result) {
                    alert(result.msg);
                    //关闭模态框
                    $("#addUserModal").modal("hide");
                    location.href = location.href;
                });
            })
        })
    </script>
</head>
<body>
<div class="container">
    <%@include file="top.jsp"%>

    <div class="row">
        <%@include file="left.jsp"%>
        <div class="col-md-10">
            <h2>用户管理</h2>
        </div>

        <div class="row">
            <div>
                <h2> </h2>
            </div>
        </div>
        <div class="col-lg-8 col-lg-offset-2">
            <table class="table table-striped">
                <tr>
                    <td>ID</td>
                    <td>用户名称</td>
                    <td>用户角色</td>
                    <td>用户状态</td>
                    <td>操作</td>
                </tr>

                <c:forEach items="${pageInfo.list}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.userName}</td>
                        <td>${user.userroles}</td>
                        <td><c:if test="${user.status=='1'}">正常</c:if>
                            <c:if test="${user.status=='0'}">冻结</c:if>
                        </td>
                        <td>
                            <button class="btn btn-warning" no="${user.id}" name="updateUserButton">修改</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%@include file="page.jsp"%>
</div>

<!--添加用户模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="addUserModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加用户</h4>
            </div>
            <div class="modal-body">
                <form id="addUserForm">
                    <div class="form-group">
                        <label >用户名称：</label>
                        <input type="text" class="form-control"  placeholder="用户名称" name="userName">
                    </div>
                    <div class="form-group">
                        <label >用户密码：</label>
                        <input type="password" class="form-control"  placeholder="用户密码" name="password">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="addUserSaveButton">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--修改用户模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="updateUserModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">修改状态</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateUserForm">
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">用户名称：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="updateUserName" name="userName" readonly/>
                            <input type="hidden" id="updateUserId" name="id"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">变更状态：</label>
                        <div class="radio col-sm-8">
                            <label style="color: red">
                                <input type="radio" name="status" value="0">冻结
                            </label>
                            <label style="color:green">
                                <input type="radio" name="status" value="1">正常
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeUpdate">关闭</button>
                <button type="button" class="btn btn-primary" id="updateUserSaveButton">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</body>
</html>

