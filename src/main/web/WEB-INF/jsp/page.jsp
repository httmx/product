<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $("li>a").click(function () {
            var no=$(this).attr("no");
            var url=location.href.split("Num")[0]+"Num="+no+"&pageSize=3";
            location.href =url;
        })
    })
</script>
<div class="row">
    <div class="col-md-4  col-md-offset-2">
        <h5>
            共：${pageInfo.total}条记录 共：${pageInfo.pages}页
        </h5>
    </div>
    <div class="col-md-6 ">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageInfo.isFirstPage}">
                    <li class="disabled"><span>首页</span></li>
                </c:if>
                <c:if test="${pageInfo.isFirstPage==false}">
                    <li ><a href="#" no="1">首页</a></li>
                </c:if>
                <c:if test="${pageInfo.hasPreviousPage==false}">
                    <li class="disabled">
                        <span aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </span>
                    </li>
                </c:if>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li >
                        <a href="#" aria-label="Previous" no="${pageInfo.prePage}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="no">
                <li <c:if test="${pageInfo.pageNum==no}"> class="active" </c:if>>
                    <a href="#" no="${no}">${no}</a>
                </li>
                </c:forEach>

                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="#" aria-label="Next" no="${pageInfo.nextPage}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageInfo.hasNextPage==false}">
                    <li class="disabled">
                        <span>
                            <span aria-hidden="true">&raquo;</span>
                        </span>
                    </li>
                </c:if>




                <c:if test="${pageInfo.isLastPage}">
                    <li class="disabled"><span>末页</span></li>
                </c:if>
                <c:if test="${pageInfo.isLastPage==false}">
                    <li><a href="#" no="${pageInfo.pages}">末页</a></li>
                </c:if>

            </ul>
        </nav>
    </div>
</div>
