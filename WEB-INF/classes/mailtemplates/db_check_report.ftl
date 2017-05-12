<html>
    <head>
        <title>数据库检查报告</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style> 
            #ftlreport table{ width:100%; table-layout:fixed; border: 1px solid #dde7f0; border-spacing: 0px; float: left; }  
            #ftlreport table thead tr th{ height: 30px; line-height: 1.5; border: 1px solid #dde7f0; background-color: #ecf0f1; }  
            #ftlreport table tbody tr:nth-child(2n+2){ background: #f9f9f9; } 
            #ftlreport table tbody tr td{overflow:hidden;text-overflow:ellipsis;} 
            #ftlreport .title{ font-size: 15px; word-spacing: 100px; color: #009cff; padding: 8px; letter-spacing: 1px; font-weight: bold; width: 98%; }  
            #ftlreport .divItem { width: 100%; margin-top: 20px; }  a{ text-decoration: underline; color:#36c; cursor: pointer; }  
            #ftlreport .portlet { position: relative; clear: both; width: auto; overflow: hidden; margin: 10px 10px 10px 10px; }  
            #ftlreport .portlet .portlet-header { position: relative; padding: 2px 8px; background-color:#f8f9fd; border: 1px solid #dde7f0; -webkit-background-clip: padding-box; }  
            #ftlreport .portlet .portlet-header:before, .portlet .portlet-header:after { content: " "; display: table; }  
            #ftlreport .portlet .portlet-header:after { clear: both; }  
            #ftlreport .portlet .portlet-header>.caption{float: left;}
            #ftlreport .portlet .portlet-header>.actions{float: right;}
            #ftlreport .portlet .portlet-content { display:none; padding: 10px 10px 10px; background: #FFF; border: 1px solid #dde7f0; -webkit-background-clip: padding-box; -moz-background-clip: padding; background-clip: padding-box; overflow: hidden; margin-top:0px; }  
            #ftlreport .portlet .portlet-header + .portlet-content, .portlet .portlet-toolbar + .portlet-content { -webkit-border-top-left-radius: 0; -webkit-border-top-right-radius: 0; -moz-border-radius-topleft: 0; -moz-border-radius-topright: 0; border-top-left-radius: 0; border-top-right-radius: 0; border-top-width: 0px; }  
            #ftlreport .portlet .portlet-content:before, .portlet .portlet-content:after { content: " "; display: table; clear: both; }  
            #ftlreport .portlet .portlet-content.portlet-grey{ background-color:#fefcfd; }
            #ftlreport .collapse{text-decoration: none; font-size: 24px;}
        </style>
        <script type="text/javascript">
            function collapse(obj){
                var portlet = obj.parentNode.parentNode.parentNode;
                if (obj.className == 'collapse close') {
                    portlet.children[1].style.display = 'block';
                    obj.className = 'collapse open';
                    obj.innerHTML = '-';
                } else {
                    portlet.children[1].style.display = 'none';
                    obj.className = 'collapse close';
                    obj.innerHTML = '+';
                }
            }
        </script>
    </head>
    <body>
    <div id="ftlreport">
        <div class="title" style="height:40px;line-height:2;">
            <div style="width:100%;float:left;text-align:center;">
                <h4 class="title" style="font-size: 18px; margin-bottom:5px;">${BIZ_NAME}数据库检查报告<br/>
                    <em style="font-size:12px;line-height:1;word-spacing:1px;font-style:normal;">检查周期：( ${CHK_FROM_DATE} ~ ${CHK_TO_DATE} )</em>
                </h4>
            </div>
        </div>
        <div class="content">
            <div id="reorg" class="divItem">
                <h3>1、REORG情况</h3>
                <div class="portlet">
                    <#list DB_CHECK_RESULT as objDb>
                        <div class="portlet">
                            <div class="portlet-header">
                                <div class="caption">
                                    ${objDb.RES_NAME}有${objDb.TABLE_NON_REORG_LIST_SIZE}个表没有REGOR，没有REORG的表如下：
                                </div>
                                <div class="actions">
                                    <a class="collapse open" href="javascript:;" onclick="collapse(this)">+</a>
                                </div>
                            </div>
                            <div class="portlet-content" style="width:80%;">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width:6%;">序号</th><th style="width:30%;">表名</th><th style="width:15%;">表状态</th>
                                            <th style="width:15%;">行数</th><th style="width:30%;">上次REORG日期</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list objDb.TABLE_NON_REORG_LIST as nonReorg>
                                            <tr>
                                                <td>${nonReorg_index+1}</td>
                                                <td>${nonReorg.TABNAME}</td>
                                                <td>${nonReorg.STATUS}</td>
                                                <td>${nonReorg.CARD}</td>
                                                <td>${nonReorg.REORG_START}</td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
            <div id="indexs" class="divItem">
                <h3>2、未使用索引情况</h3>
                <div class="portlet">
                    <#list DB_CHECK_RESULT as objDb>
                        <div class="portlet">
                            <div class="portlet-header">
                                <div class="caption">
                                    ${objDb.RES_NAME}有${objDb.INDEX_NON_USE_LIST_SIZE}个索引未使用，未使用索引列表如下：
                                </div>
                                <div class="actions">
                                    <a class="collapse open" href="javascript:;" onclick="collapse(this)">+</a>
                                </div>
                            </div>
                            <div class="portlet-content">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width:6%;">序号</th><th style="width:15%;">表名</th><th style="width:15%;">索引名称</th>
                                            <th style="width:30%;">包含列</th><th style="width:10%;">数据行</th><th style="width:20%;">上次使用日期</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list objDb.INDEX_NON_USE_LIST as noUsedIndex>
                                            <tr>
                                                <td>${noUsedIndex_index+1}</td>
                                                <td>${noUsedIndex.TABNAME}</td>
                                                <td>${noUsedIndex.INDNAME}</td>
                                                <td>${noUsedIndex.COLNAMES}</td>
                                                <td>${noUsedIndex.CARD}</td>
                                                <td>${noUsedIndex.LASTUSED}</td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
        </div>
    </body>
</html>