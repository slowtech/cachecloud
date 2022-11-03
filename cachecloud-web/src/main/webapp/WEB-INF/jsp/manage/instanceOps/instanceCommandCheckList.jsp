<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/manage/commons/taglibs.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/select/bootstrap-select.css"/>
<script src="/resources/manage/plugins/jquery-1.10.2.min.js"></script>
<script type="text/javascript">var jQuery_1_10_2 = $;</script>
<script src="/resources/manage/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/select/bootstrap-select.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>CacheCloud实例运维</title>
    <jsp:include page="/WEB-INF/include/head.jsp"/>
    <script type="text/javascript" src="/resources/js/jquery-console.js"></script>

</head>
<body role="document">
<div class="container">
    <jsp:include page="/WEB-INF/include/headAdmin.jsp"/>
    <div class="tabbable-custom">
        <div class="page-container">
            <div class="page-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box light-grey" id="configIndex">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-globe"></i>实例redis命令检测结果
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                </div>
                            </div>

                            <table class="table table-striped table-bordered table-hover" name="checkResultList">
                                <thead>
                                <tr>
                                    <th>实例id</th>
                                    <th>实例</th>
                                    <th>检测时间</th>
                                    <th>执行命令</th>
                                    <th>异常信息</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${checkResult != null}">
                                        <c:forEach items="${checkResult.instanceCheckList}" var="instanceCheck">
                                            <c:if test="${instanceCheck.success==false}">
                                                <tr class="odd gradeX">
                                                    <td>
                                                        <a href="/admin/instance/index?instanceId=${instanceCheck.instanceInfo.id}"
                                                           target="_blank">${instanceCheck.instanceInfo.id}</a>
                                                    </td>
                                                    <td>
                                                        ${instanceCheck.instanceInfo.ip}:${instanceCheck.instanceInfo.port}
                                                    </td>
                                                    <td>
                                                        ${checkResult.createTimeStr}
                                                    </td>
                                                    <td>
                                                        ${checkResult.command}
                                                    </td>
                                                    <td>
                                                        <c:if test="${instanceCheck.success==true}">否</c:if>
                                                        <c:if test="${instanceCheck.success==false}">
                                                            ${instanceCheck.message}
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/include/foot.jsp"/>