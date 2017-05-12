<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TOP SQL运维报告</title>
        <style>
            #ftlreport .table_top_sql{
                width:100%;
                table-layout:fixed;
                border: 1px solid #dde7f0;
                border-spacing: 0px;
                float: left;
            }
            #ftlreport .table_top_sql thead tr th{
                height: 30px;
                line-height: 1.5;
                border: 1px solid #dde7f0;
                background-color: #ecf0f1;
            }
            #ftlreport .table_top_sql tbody tr:nth-child(2n+2){
                background: #f9f9f9;
            }
            #ftlreport .trItem td{
                height: 30px;
                line-height: 1.5;
                border: 1px solid #dde7f0;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            #ftlreport .trItem:hover{
                cursor: pointer;
            }
            #ftlreport .title{
                font-size: 15px;
                word-spacing: 100px;
                color: #009cff;
                padding: 8px;
                letter-spacing: 1px;
                font-weight: bold;
                width: 98%;
            }
            #ftlreport .itemLabel{
                font-size: 14px;
                color: #009cff;
                font-weight: bold;
                height: 30px;
                line-height: 2;
            }
            #ftlreport .btn{
                height: 24px;
                line-height: 1;
                padding: 2px 5px 2px 5px;
                color: #ffffff;
                background-color: #ffffff;
                border: 1px solid #1a98e1 !important;
                float: right;
                font-size: 13px;
                color: #0000ff !important;
                margin-top: 10px;
            }
            #ftlreport .trItemDetail td{
                padding: 4px 10px 4px 10px;
                min-height: 24px;
                wodr-wrap: break-word;
                word-break: break-all;
                white-space: pre-wrap;
            }
            #ftlreport .trItemDetail td:hover{
                color: #75ad14;
            }
            #ftlreport .divItem {
                width: 100%;
                margin-top: 20px;
            }
            #ftlreport a{
                text-decoration: underline;
                color:#36c;
                cursor: pointer;
            }
            /*******************portlet 开始**********************/
            #ftlreport .portlet {
              position: relative;
              clear: both;
              width: auto;
              overflow: hidden;
              margin: 10px 10px 10px 10px;
            }
            #ftlreport .portlet .portlet-header {
              position: relative;
              padding: 2px 8px;
              background-color:#f8f9fd;
              border: 1px solid #dde7f0;
              -webkit-background-clip: padding-box;
            }
            #ftlreport .portlet .portlet-header:before,
            #ftlreport .portlet .portlet-header:after {
              content: " ";
              display: table;
            }
            #ftlreport .portlet .portlet-header:after {
              clear: both;
            }
            
            #ftlreport .portlet .portlet-content {
              padding: 10px 10px 10px;
              background: #FFF;
              border: 1px solid #dde7f0;
              -webkit-background-clip: padding-box;
              -moz-background-clip: padding;
              background-clip: padding-box;
              overflow: hidden;
              margin-top:0px;
            }
            
            #ftlreport .portlet .portlet-header + .portlet-content,
            #ftlreport .portlet .portlet-toolbar + .portlet-content {
              -webkit-border-top-left-radius: 0;
              -webkit-border-top-right-radius: 0;
              -moz-border-radius-topleft: 0;
              -moz-border-radius-topright: 0;
              border-top-left-radius: 0;
              border-top-right-radius: 0;
              border-top-width: 0px;
            }
            #ftlreport .portlet .portlet-content:before,
            #ftlreport .portlet .portlet-content:after {
              content: " ";
              display: table;
              clear: both;
            }
            #ftlreport .portlet .portlet-content.portlet-grey{
              background-color:#fefcfd;
            }
            /*************portlet--结束************/
            #ftlreport #popupMask{
                display:none;
            }
            #ftlreport .staticMenu{
                position:fixed;
                _position:absolute;
                top: 160px;
                right: 40px;
                z-index: 10;
                display:inline;
                border: 1px solid #dde7f0;
                border-radius: 20px;
                background-color: #009cff;
                color: #ffffff;
                padding-top: 7px;
                padding-bottom: 7px;
                cursor: pointer;
            }
            #ftlreport .floatMenu{
                position:fixed;
                _position:absolute;
                z-index: 10;
                display:none;
            }
            #ftlreport .floatMenuItem{
                border: 1px solid #dde7f0;
                margin: 2px 2px 2px 2px;
                line-height: 1.5;
            }
            #ftlreport .float_memu_ul{
                border-right: 1px solid #dde7f0;
                display: inline;
            }
            #ftlreport .float_memu_li{
                display: inline;
            }
            #ftlreport .staticMenu:hover{
                background-color: #1ca8dd;
            }
            #ftlreport .dynamicMenu{
                background-color: #eeffff;
            }
            #ftlreport .dynamicMenu a:hover{
                color: red;
            }
        </style>
        <script type="text/javascript">
            //显示SQL详细内容
            function displayDetail(tr) {
                var trItemDetail = getNextNode(tr); 
                if (trItemDetail.className == "trItemDetail") {
                    if (trItemDetail.style.display == "none") {
                        trItemDetail.style.display = "";
                    } else {
                        trItemDetail.style.display = "none";
                    }
                }
            }
            //获取当前节点的下一个同级节点
            function getNextNode(node) {
                if (node.nextSibling && node.nextSibling.nodeType == 1) {
                    return node.nextSibling;
                }
                if (node.nextSibling) {
                    return getNextNode(node.nextSibling);
                }
                return null;
            }
            //浮动资源快捷入口
            function floatMenu() {
                var staticmenu = document.getElementById("staticMenu");
                var dynamic = document.getElementById("floatMenu");
                if (window.parent.length > 0) {
                    staticmenu.style.top=window.parent.pageYOffset+50+"px";
                    dynamic.style.top = parseInt(staticmenu.style.top,10)+25+"px";
                    dynamic.style.right = parseInt(staticmenu.style.right,10)+60+"px";
                } else {
                    staticmenu.style.top=window.screenTop+25+"px";
                    dynamic.style.top = parseInt(staticmenu.style.top,10)+25+"px";
                    dynamic.style.right = parseInt(staticmenu.style.right,10)+60+"px";
                }
                setTimeout("floatMenu()", 500);
            }
            window.onload = floatMenu;
            
            //显示/隐藏快速定位按钮
            function displayMenu() {
                var staticmenu = document.getElementById("staticMenu");
                var dynamic = document.getElementById("floatMenu");
                if (dynamic.style.display != "inline") {
                    dynamic.style.display = "inline";
                    dynamic.style.top = parseInt(staticmenu.style.top,10)+25+"px";
                    dynamic.style.right = parseInt(staticmenu.style.right,10)+60+"px";
                } else {
                    dynamic.style.display = "none";
                }
            }
        </script>
    </head>
    <body>
        <div id="ftlreport">
            <div class="title" style="height:40px;line-height:2;">
                <input type="hidden" id="BIZ_NAME" value="${BIZ_NAME}" >
                <div style="width:85%;float:left;text-align:center;">
                    <h4 class="title" style="font-size: 18px; margin-bottom:5px;">${BIZ_NAME }SQL运维报告<br>
                    <em style="font-size:12px;line-height:1;word-spacing:1px;font-style:normal;">报告时间：${CURRENT_DATE }</em></h4>
                </div>
            </div>
            
            <div class="content">
                <div id="staticMenu" class="staticMenu" onclick="displayMenu()" style="right:10px;">快速定位</div>
                <div class="floatMenu" id="floatMenu">
                    <div class="dynamicMenu" id="dynamicMenu">
                        <#list DB_TOP_SQL_LIST as objDb>
                            <div class="floatMenuItem">
                                <div class="float_memu_ul">${objDb.RES_NAME }</div>
                                <div class="float_memu_li">
                                    <#if objDb.SUBTYPE != "MYSQL" >
                                        <a href="#${objDb.RES_ID }_CUR">当前执行SQL</a>
                                        <a href="#${objDb.RES_ID }_CPU_A">平均用户CPU时间</a>
                                        <a href="#${objDb.RES_ID }_IO">IO读写</a>
                                        <a href="#${objDb.RES_ID }_EXECTIME_A">平均执行时间</a>
                                        <a href="#${objDb.RES_ID }_EXECCOUNT">执行次数</a>
                                        <a href="#${objDb.RES_ID }_SORT">排序次数</a>
                                    <#else>
                                        <a href="#${objDb.RES_ID }_CUR">当前执行SQL</a>
                                        <a href="#${objDb.RES_ID }_EXECTIME_A">平均执行时间</a>
                                        <#if objDb.IS_STATEMENT_ANALYSIS == true >
                                            <a href="#${objDb.RES_ID }_EXECCOUNT">执行次数</a>
                                        </#if>
                                    </#if>
                                </div>
                             </div>
                        </#list>
                    </div>
                </div>
                <#list DB_TOP_SQL_LIST as objDb>
                    <div class="divItem portlet">
                        <div class="portlet-header">
                            <label class="itemLabel">资源名：</label>${objDb.RES_NAME }
                            <label class="itemLabel">&nbsp;&nbsp;&nbsp;数据库名：</label>${objDb.DB_INSTANCE_NAME }
                            <label class="itemLabel">&nbsp;&nbsp;&nbsp;IP：</label>${objDb.IP }
                            <label class="itemLabel">&nbsp;&nbsp;&nbsp;类型：</label>${objDb.SUBTYPE }
                            <#if objDb.SUBTYPE == "MYSQL">
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;版本：</label>${objDb.MYSQL_VERSION }
                            </#if>
                            <label class="itemLabel">&nbsp;&nbsp;&nbsp;环境：</label>
                            <#if objDb.ENV_TYPE == "1" >生产
                            <#elseif objDb.ENV_TYPE == "2">测试
                            <#else>未设置
                            </#if>
                        </div>
                        <div class="portlet-content"> 
                            <div>
                                <div class="title" style="float:left;" id="${objDb.RES_ID }_CUR" name="${objDb.RES_ID }_CUR">当前执行SQL</div>
                                <table class="table_top_sql">
                                    <thead>
                                        <tr>
                                            <th style="width:4%;">序号</th>
                                            <#if objDb.SUBTYPE == "DB2" >
                                                <th style="width:20%;">APPL_ID</th>
                                                <th style="width:10%;">句柄</th>
                                            <#elseif objDb.SUBTYPE == "ORACLE" >
                                                <th style="width:20%;">SQL_ID</th>
                                                <th style="width:10%;">SQL哈希值</th>
                                            <#elseif objDb.SUBTYPE == "MYSQL" >
                                                <th style="width:12%;">连接ID</th>
                                                <th style="width:18%;">客户机</th>
                                            </#if>
                                            <th style="width:10%;">状态</th>
                                            <th style="width:56%;">SQL语句</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list objDb.TOP_CUR_SQL as objSql>
                                            <tr  class="trItem" onclick="displayDetail(this)">
                                                <td align="center">${objSql_index+1 }</td>
                                                <#if objDb.SUBTYPE == "DB2">
                                                    <td>${objSql.applId }</td>
                                                    <td>${objSql.appHandle }</td>
                                                    <td>${objSql.applStatus }</td>
                                                    <td>${objSql.sqlText }</td>
                                                <#elseif objDb.SUBTYPE == "ORACLE" >
                                                    <td>${objSql.sqlId }</td>
                                                    <td>${objSql.sqlHashValue }</td>
                                                    <td>${objSql.sqlStatus }</td>
                                                    <td>${objSql.sqlText }</td>
                                                <#elseif objDb.SUBTYPE == "MYSQL" >
                                                    <td>${objSql.id }</td>
                                                    <td>${objSql.host }</td>
                                                    <td>${objSql.state }</td>
                                                    <td>${objSql.sqlText }</td>
                                                </#if>
                                            </tr>
                                            <tr class="trItemDetail" style="display:none;">
                                                <td colspan="5">
                                                    <#if objDb.SUBTYPE == "DB2" >${objSql.sqlText }
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >${objSql.sqlText }
                                                    <#elseif objDb.SUBTYPE == "MYSQL" >${objSql.sqlText }</#if>
                                                </td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                            <#if objDb.SUBTYPE != "MYSQL">
                                <div>
                                    <div class="title" style="float:left;" id="${objDb.RES_ID }_CPU_A" name="${objDb.RES_ID }_CPU_A">平均用户CPU时间</div>
                                    <table class="table_top_sql">
                                        <thead>
                                            <tr>
                                                <th style="width:4%;">序号</th>
                                                <#if objDb.SUBTYPE == "ORACLE" >
                                                    <th style="width:10%;">SQL_ID</th>
                                                </#if>
                                                <th style="width:15%;">平均用户CPU时间(s)</th>
                                                <th style="width:10%;">执行次数</th>
                                                <th style="width:60%;">SQL语句</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <#list objDb.TOP_CPU_SQL_A as objSql>
                                                <tr class="trItem" onclick="displayDetail(this)">
                                                    <td align="center">${objSql_index+1 }</td>
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td>${objSql.avgCpuTime }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td>${objSql.sqlId }</td>
                                                        <td>${objSql.avgCpuTime }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                                <tr class="trItemDetail" style="display:none;">
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td colspan="4">${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td colspan="5">${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                                <div>
                                    <div class="title" style="float:left;" id="${objDb.RES_ID }_IO" name="${objDb.RES_ID }_IO">IO读写</div>
                                    <table class="table_top_sql">
                                        <thead>
                                            <tr>
                                                <th style="width:4%;">序号</th>
                                                <#if objDb.SUBTYPE == "DB2" >
                                                    <th style="width:10%;">读取行数</th>
                                                    <th style="width:10%;">写入行数</th>
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:66%;">SQL语句</th>
                                                <#elseif objDb.SUBTYPE == "ORACLE" >
                                                    <th style="width:10%;">SQL_ID</th>
                                                    <th style="width:10%;">读取缓存次数</th>
                                                    <th style="width:10%;">读取磁盘次数</th>
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:56%;">SQL语句</th>
                                                </#if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <#list objDb.TOP_IO_SQL as objSql>
                                                <tr class="trItem" onclick="displayDetail(this)">
                                                    <td align="center">${objSql_index+1 }</td>
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td>${objSql.rowsRead }</td>
                                                        <td>${objSql.rowsWritten }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td>${objSql.sqlId }</td>
                                                        <td>${objSql.bufferGets }</td>
                                                        <td>${objSql.diskReads }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                                <tr class="trItemDetail" style="display:none;">
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td colspan="5">${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td colspan="6">${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                            </#if>
                            
                            <div>
                                <div class="title" style="float:left;" id="${objDb.RES_ID }_EXECTIME_A" name="${objDb.RES_ID }_EXECTIME_A">平均执行时间</div>
                                <table class="table_top_sql">
                                    <thead>
                                        <tr>
                                            <th style="width:4%;">序号</th>
                                            <#if objDb.SUBTYPE == "DB2" >
                                                <th style="width:10%;">平均执行时间(s)</th>
                                                <th style="width:10%;">执行次数</th>
                                                <th style="width:76%;">SQL语句</th>
                                            <#elseif objDb.SUBTYPE == "ORACLE" >
                                                <th style="width:10%;">SQL_ID</th>
                                                <th style="width:10%;">平均执行时间(s)</th>
                                                <th style="width:10%;">执行次数</th>
                                                <th style="width:66%;">SQL语句</th>
                                            <#elseif objDb.SUBTYPE == "MYSQL" >
                                                <th style="width:10%;">平均执行时间(s)</th>
                                                <#if objDb.IS_STATEMENT_ANALYSIS == true >
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:14%;">最近执行</th>
                                                    <th style="width:62%;">SQL语句</th>
                                                <#else>
                                                    <th style="width:10%;">等待锁时间(s)</th>
                                                    <th style="width:76%;">SQL语句</th>
                                                </#if>
                                            </#if>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list objDb.TOP_EXEC_TIME_SQL_A as objSql>
                                            <tr class="trItem" onclick="displayDetail(this)">
                                                <td align="center">${objSql_index+1 }</td>
                                                <#if objDb.SUBTYPE == "DB2" >
                                                    <td>${objSql.avgExecTime }</td>
                                                    <td>${objSql.execCount }</td>
                                                    <td>${objSql.sqlText }</td>
                                                <#elseif objDb.SUBTYPE == "ORACLE" >
                                                    <td>${objSql.sqlId }</td>
                                                    <td>${objSql.execTime }</td>
                                                    <td>${objSql.execCount }</td>
                                                    <td>${objSql.sqlText }</td>
                                                <#elseif objDb.SUBTYPE == "MYSQL" >
                                                    <#if objDb.IS_STATEMENT_ANALYSIS == true >
                                                        <td>${objSql.avgTime }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.lastSeen }</td>
                                                    <#else>
                                                        <td>${objSql.queryTime }</td>
                                                        <td>${objSql.lockTime }</td>
                                                    </#if>
                                                    <td>${objSql.sqlText }</td>
                                                </#if>
                                            </tr>
                                            <tr class="trItemDetail" style="display:none;">
                                                <#if objDb.SUBTYPE == "DB2" >
                                                    <td colspan="4">${objSql.sqlText }</td>
                                                <#elseif objDb.SUBTYPE == "ORACLE" >
                                                    <td colspan="5">${objSql.sqlText }</td>
                                                <#elseif objDb.SUBTYPE == "MYSQL" >
                                                    <td colspan="5">${objSql.sqlText }</td>
                                                </#if>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                            <#if objDb.SUBTYPE != "MYSQL" || objDb.IS_STATEMENT_ANALYSIS == true >
                                <div>
                                    <div class="title" style="float:left;" id="${objDb.RES_ID }_EXECCOUNT" name="${objDb.RES_ID }_EXECCOUNT">执行次数</div>
                                    <table class="table_top_sql">
                                        <thead>
                                            <tr>
                                                <th style="width:4%;">序号</th>
                                                <#if objDb.SUBTYPE == "DB2" >
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:86%;">SQL语句</th>
                                                <#elseif objDb.SUBTYPE == "ORACLE" >
                                                    <th style="width:10%;">SQL_ID</th>
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:76%;">SQL语句</th>
                                                <#elseif objDb.SUBTYPE == "MYSQL" >
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:12%;">平均执行时间(s)</th>
                                                    <th style="width:74%;">SQL语句</th>
                                                </#if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <#list objDb.TOP_EXEC_MOST_TOP as objSql>
                                                <tr class="trItem" onclick="displayDetail(this)">
                                                    <td align="center">${objSql_index+1 }</td>
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td>${objSql.sqlId }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "MYSQL" >
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.avgTime }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                                <tr class="trItemDetail" style="display:none;">
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td colspan="3">${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td colspan="4">${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "MYSQL" >
                                                        <td colspan="4">${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                            </#if>
                            <#if objDb.SUBTYPE != "MYSQL">
                                <div>
                                    <div class="title" style="float:left;" id="${objDb.RES_ID }_SORT" name="${objDb.RES_ID }_SORT">排序次数</div>
                                    <table class="table_top_sql">
                                        <thead>
                                            <tr>
                                                <th style="width:4%;">序号</th>
                                                <#if objDb.SUBTYPE == "DB2" >
                                                    <th style="width:10%;">排序次数</th>
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:76%;">SQL语句</th>
                                                </#if>
                                                <#if objDb.SUBTYPE == "ORACLE" >
                                                    <th style="width:10%;">SQL_ID</th>
                                                    <th style="width:10%;">排序次数</th>
                                                    <th style="width:10%;">执行次数</th>
                                                    <th style="width:66%;">SQL语句</th>
                                                </#if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <#list objDb.TOP_SORT_SQL as objSql>
                                                <tr class="trItem" onclick="displayDetail(this)">
                                                    <td align="center">${objSql_index+1 }</td>
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td>${objSql.sorts }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td>${objSql.sqlId }</td>
                                                        <td>${objSql.sorts }</td>
                                                        <td>${objSql.execCount }</td>
                                                        <td>${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                                <tr class="trItemDetail" style="display:none;">
                                                    <#if objDb.SUBTYPE == "DB2" >
                                                        <td colspan="4">${objSql.sqlText }</td>
                                                    <#elseif objDb.SUBTYPE == "ORACLE" >
                                                        <td colspan="5">${objSql.sqlText }</td>
                                                    </#if>
                                                </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                            </#if>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </body>
</html>
