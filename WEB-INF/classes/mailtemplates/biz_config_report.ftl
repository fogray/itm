<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title></title>
        <style>
            #ftlreport .table{
                width:100%;
                table-layout:fixed;
                border: 1px solid #dde7f0;
                border-spacing: 0px;
                float: left;
            }
            #ftlreport .table thead tr th{
                height: 30px;
                line-height: 1.5;
                border: 1px solid #dde7f0;
                background-color: #ecf0f1;
            }
            #ftlreport .table tbody tr:nth-child(2n+2){
                background: #f9f9f9;
            }
            #ftlreport .trItem td{
                height: 24px;
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
            #ftlreport .noDisplayTr th{
                height:0px !important;
                padding: 0px !important;
                line-height:0px !important;
                border: none !important;
            }
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
                setTimeout("floatMenu()",500);
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
                    dynamic.style.display = 'none';
                }
            }
        </script>
    </head>
    <body>
        <#setting number_format="0.#"> 
        <div id="ftlreport">
            <div class="title" style="height:40px;line-height:2;">
                <input type="hidden" id="BIZ_NAME" value="${BIZ_NAME }">
                <div style="width:85%;float:left;text-align:center;">
                    <h4 class="title" style="font-size: 18px; margin-bottom:5px;">${BIZ_NAME }系统运维报告<br>
                    <em style="font-size:12px;line-height:1;word-spacing:1px;font-style:normal;">报告时间：${CURRENT_DATE }</em></h4>
                </div>
            </div>
            <div class="content">
                <div id="staticMenu" class="staticMenu" onclick="displayMenu()" style="right:10px;">快速定位</div>
                <div class="floatMenu" id="floatMenu">
                    <div class="dynamicMenu" id="dynamicMenu">
                        <div class="floatMenuItem">
                            <div class="float_memu_ul">预警信息</div>
                            <div class="float_memu_li">
                                <a href="#alarm_info">当前预警信息</a>
                            </div>
                        </div>
                        <div class="floatMenuItem">
                            <div class="float_memu_ul">数据库</div>
                            <#list DB_CONFIG_LIST as objDb>
                                <div class="float_memu_li">
                                    <a href="#${objDb.RES_ID }">${objDb.RES_NAME }</a>
                                </div>
                            </#list>
                        </div>
                        <div class="floatMenuItem">
                            <div class="float_memu_ul">中间件</div>
                            <#list MW_CONFIG_LIST as objMw>
                                <div class="float_memu_li">
                                    <a href="#${objMw.RES_ID }">${objMw.RES_NAME }</a>
                                </div>
                            </#list>
                            <#if APACHE_LIST?size gt 0>
                                <div class="float_memu_li">
                                    <a href="#apache">APACHE信息</a>
                                </div>
                            </#if>
                            <#if TOMCAT_INFO.TOMCAT_SERVER_LIST?exists && TOMCAT_INFO.TOMCAT_SERVER_LIST?size gt 0>
                                <div class="float_memu_li">
                                    <a href="#tomcat">TOMCAT信息</a>
                                </div>
                            </#if>
                        </div>
                        <div class="floatMenuItem">
                            <div class="float_memu_ul">主机</div>
                            <#list HOST_CONFIG_LIST as objHost>
                                <#if ((objHost_index % 4 == 0) && (objHost_index != 0)) ><br/></#if>
                                <div class="float_memu_li">
                                    <a href="#${objHost.RES_ID }">${objHost.RES_NAME }</a>
                                </div>
                            </#list>
                        </div>
                    </div>
                </div>
                
                <div>
                    <div class="title" style="float:left;">
                        <label class="itemLabel">预警信息</label>
                    </div>
                    <div class="divItem portlet" id="alarm_info" name="alarm_info">
                        <div class="portlet-header">
                            <label class="itemLabel">当前预警信息</label>
                        </div>
                        <div class="portlet-content">
                            <div>
                                <table class="table" style="width:100%;">
                                    <thead>
                                        <tr>
                                            <th style="width:8%;">序号</th>
                                            <th style="width:20%;">资源名称</th>
                                            <th style="width:60%;">预警信息</th>
                                            <th style="width:14%;">最近更新时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list ALARM_LIST as objAlarm>
                                            <tr  class="trItem">
                                                <td align="center">${objAlarm_index+1 }</td>
                                                <td>${objAlarm.RES_NAME }[${objAlarm.IP }]</td>
                                                <td>于${objAlarm.CREATE_TIME }时
                                                    <#if objAlarm.INDICATOR_KEY != "" > [${objAlarm.INDICATOR_KEY }]</#if>
                                                    ${objAlarm.RULE_NAME }为${objAlarm.VALUE }发生预警，阀值为${objAlarm.FORMULA }${objAlarm.THRESHOLD }
                                                </td>
                                                <td>${objAlarm.LAST_TIME }</td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="title" style="float:left;">
                        <label class="itemLabel">数据库配置</label>
                    </div>
                    <#list DB_CONFIG_LIST as objDb >
                        <div class="divItem portlet" id="${objDb.RES_ID }" name="${objDb.RES_ID }">
                            <div class="portlet-header">
                                <label class="itemLabel">资源名：</label>${objDb.RES_NAME }
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;数据库名：</label>${objDb.DB_INSTANCE_NAME }
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;类型：</label>${objDb.SUBTYPE }
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;IP：</label>${objDb.IP }:${objDb.PORT }
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;版本：</label>
                                    <#if objDb.connStatus == "1">
                                        <#if objDb.SUBTYPE == "MYSQL">${objDb.BASIC_INFO.version }
                                        <#else>${objDb.BASIC_INFO.version }
                                        </#if>
                                    </#if>
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;状态：</label>
                                    <#if objDb.connStatus == "1">up<#else>down</#if>
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;环境：</label>
                                <#if objDb.ENV_TYPE == "1">生产
                                <#elseif objDb.ENV_TYPE == "2">测试
                                <#else>未设置</#if>
                            </div>
                            <div class="portlet-content">
                                <#if objDb.connStatus == "1">
                                    <div>
                                        <div class="title" style="float:left;">参数列表</div>
                                        <table class="table" style="width:80%;">
                                            <thead>
                                                <tr>
                                                    <th style="width:8%;">序号</th>
                                                    <th style="width:27%;">参数名称</th>
                                                    <th style="width:15%;">值</th>
                                                    <th style="width:50%;">说明</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#if objDb.SUBTYPE != "MYSQL">
                                                    <#list objDb.PARAM_LIST as objParam>
                                                        <tr  class="trItem">
                                                            <td align="center">${objParam_index+1 }</td>
                                                            <td>${objParam.name }</td>
                                                            <#if objParam.valueFlag != "">
                                                                <#if objParam.valueFlag != "" && objParam.valueFlag != "NONE">
                                                                    <td>${objParam.valueFlag }</td>
                                                                <#else>
                                                                    <td>${objParam.value }</td>
                                                                </#if>
                                                            <#else>
                                                                <td>${objParam.value }</td>
                                                            </#if>
                                                            <td>${objParam.descr }</td>
                                                        </tr>
                                                    </#list>
                                                </#if>
                                                <#if objDb.SUBTYPE == "MYSQL">
                                                    <tr class="trItem"><td align="center">1</td><td>default_storage_engine</td><td>${objDb.VARIABLES.default_storage_engine}</td><td>默认引擎</td></tr>
                                                    <tr class="trItem"><td align="center">2</td><td>tx_isolation</td><td>${objDb.VARIABLES.tx_isolation}</td><td>隔离级别</td></tr>
                                                    <tr class="trItem"><td align="center">3</td><td>character_set_server</td><td>${objDb.VARIABLES.character_set_server}</td><td>字符集</td></tr>
                                                    <tr class="trItem"><td align="center">4</td><td>log_bin</td><td>${objDb.VARIABLES.log_bin}</td><td>二进制日志开关</td></tr>
                                                    <tr class="trItem"><td align="center">5</td><td>max_connections</td><td>${objDb.VARIABLES.max_connections}</td><td>最大连接数</td></tr>
                                                    <tr class="trItem"><td align="center">6</td><td>lower_case_table_names</td><td>${objDb.VARIABLES.lower_case_table_names}</td><td>大小写敏感</td></tr>
                                                    <tr class="trItem"><td align="center">7</td><td>log_bin_trust_function_creators</td><td>${objDb.VARIABLES.log_bin_trust_function_creators}</td><td>存储函数是否被信任</td></tr>
                                                    <tr class="trItem"><td align="center">8</td><td>table_open_cache</td><td>${objDb.VARIABLES.table_open_cache}</td><td>最大打开表数量</td></tr>
                                                    <tr class="trItem"><td align="center">9</td><td>query_cache_size</td><td>${objDb.VARIABLES.query_cache_size?number/1048576.0 }</td><td>查询缓存大小(Mb)</td></tr>
                                                    <tr class="trItem"><td align="center">10</td><td>key_buffer_size</td><td>${objDb.VARIABLES.key_buffer_size?number/1048576.0}</td><td>索引缓存大小(Mb)</td></tr>
                                                    <tr class="trItem"><td align="center">11</td><td>read_buffer_size</td><td>${objDb.VARIABLES.read_buffer_size?number/1048576.0}</td><td>顺序读缓存大小(Mb)</td></tr>
                                                    <tr class="trItem"><td align="center">12</td><td>read_rnd_buffer_size</td><td>${objDb.VARIABLES.read_rnd_buffer_size?number/1048576.0}</td><td>随机读缓存大小(Mb)</td></tr>
                                                    <tr class="trItem"><td align="center">13</td><td>innodb_open_files</td><td>${objDb.VARIABLES.innodb_open_files}</td><td>innodb最大打开文件数</td></tr>
                                                    <tr class="trItem"><td align="center">14</td><td>innodb_file_per_table</td><td>${objDb.VARIABLES.innodb_file_per_table}</td><td>innodb每个表打开最大文件数</td></tr>
                                                    <tr class="trItem"><td align="center">15</td><td>innodb_buffer_pool_size</td>
                                                        <td>
                                                            <#if objDb.VARIABLES.innodb_buffer_pool_size?exists>
                                                                ${objDb.VARIABLES.innodb_buffer_pool_size?number/1048576.0}
                                                            </#if>
                                                        </td><td>innodb缓冲池大小(Mb)</td>
                                                    </tr>
                                                    <tr class="trItem"><td align="center">16</td><td>log_output</td><td>${objDb.VARIABLES.log_output}</td><td>日志输出类型</td></tr>
                                                </#if>
                                            </tbody>
                                        </table>
                                    </div>
                                    <#if objDb.SUBTYPE == "DB2" || objDb.SUBTYPE == "MYSQL">
                                        <div>
                                            <div class="title" style="float:left;">性能指标信息</div>
                                            <table class="table" style="width:50%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width:8%;">序号</th>
                                                        <th style="width:40%;">性能指标</th>
                                                        <th style="width:20%;">当前值</th>
                                                        <th style="width:25%;">参考值</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <#if objDb.SUBTYPE == "DB2">
                                                        <tr class="trItem">
                                                            <td align="center">1</td><td>包缓冲区命中率</td>
                                                                <td>${objDb.PERFORM_INFO.pkgCacheHitRatio }</td><td>&gt;=98%</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">2</td><td>编目缓冲区命中率</td>
                                                            <td>${objDb.PERFORM_INFO.catCacheHitRatio }</td><td>&gt;=98%</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">3</td><td>排序溢出率</td>
                                                            <td>${objDb.PERFORM_INFO.sortOverflowPercent }</td><td>&lt;=1%</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">4</td><td>日志写入速度</td>
                                                            <td>${objDb.PERFORM_INFO.avgLogWriteMs }</td><td>&lt;=3ms</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">5</td><td>锁等待会话</td>
                                                            <td>${objDb.PERFORM_INFO.locksWaiting }</td><td>少量</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">6</td><td>连接使用率</td>
                                                            <td>${objDb.PERFORM_INFO.applsUsedUtil }</td><td>-</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">7</td><td>总连接数</td>
                                                            <td>${objDb.PERFORM_INFO.curApplsCons }</td><td>-</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">8</td><td>脏页偷取次数</td>
                                                            <td>${objDb.PERFORM_INFO.poolDirtyPgStealClns }</td><td>非常低</td>
                                                        </tr>
                                                    <#elseif objDb.SUBTYPE == "MYSQL">
                                                        <tr class="trItem">
                                                            <td align="center">1</td><td>查询缓存命中率</td>
                                                            <td>${objDb.PERFORM_INFO.qcacheHitRatio }</td><td>&gt;=99%</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">2</td><td>key Buffer读命中率</td>
                                                            <td>${objDb.PERFORM_INFO.kbrHitRatio }</td><td>&gt;=99%</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">3</td><td>InnoDB Buffer命中率</td>
                                                            <td>${objDb.PERFORM_INFO.innodbBufferHitRatio }</td><td>&gt;=99%</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">4</td><td>当前总连接数</td>
                                                            <td>${objDb.PERFORM_INFO.threadsConnected }</td><td>-</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">5</td><td>当前活动连接数</td>
                                                            <td>${objDb.PERFORM_INFO.threadsRunning }</td><td>-</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">6</td><td>死锁数</td>
                                                            <td>${objDb.PERFORM_INFO.lockCount }</td><td>少量</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">7</td><td>锁等待数</td>
                                                            <td>${objDb.PERFORM_INFO.lockWaitCount }</td><td>少量</td>
                                                        </tr>
                                                        <tr class="trItem">
                                                            <td align="center">8</td><td>慢SQL</td>
                                                            <td>${objDb.PERFORM_INFO.slowQueryCount }</td><td>少量</td>
                                                        </tr>
                                                    </#if>
                                                </tbody>
                                            </table>
                                        </div>
                                        <#if objDb.SUBTYPE == "DB2">
                                            <div>
                                                <div class="title" style="float:left;">缓冲池</div>
                                                <table class="table" style="width:80%;">
                                                    <thead>
                                                        <tr>
                                                            <th style="width:5%;">序号</th>
                                                            <th style="width:20%;">缓冲池</th>
                                                            <th style="width:15%;">总体命中率(%)</th>
                                                            <th style="width:15%;">数据命中率(%)</th>
                                                            <th style="width:15%;">索引命中率(%)</th>
                                                            <th style="width:15%;">大小(GB)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#list objDb.BP_LIST as objBp>
                                                            <tr  class="trItem">
                                                                <td align="center">${objBp_index+1 }</td>
                                                                <td>${objBp.bpName }</td>
                                                                <td>${objBp.totalHitRatioPercent }</td>
                                                                <td>${objBp.dataHitRatioPercent }</td>
                                                                <td>${objBp.indexHitRatioPercent }</td>
                                                                <td>
                                                                    <#if objBp.nPages?number lt 0>自动管理
                                                                    <#else>${objBp.pageSize?number/100 }</#if>
                                                                </td>
                                                            </tr>
                                                        </#list>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </#if>
                                    </#if>
                                    <#if objDb.SUBTYPE != "MYSQL">
                                        <div>
                                            <div class="title" style="float:left;">表空间</div>
                                            <div style="padding-left: 30%; float: left; display: inline;">
                                                <label>空间总大小(GB)：</label><em id="tbspTotalSize">${objDb.TBSP_TOTAL_SIZE }</em>
                                                <label>总使用空间(GB)：</label><em id="tbspTotalUsedSize">${objDb.TBSP_USED_SIZE }</em>
                                                <label>总空闲空间(GB)：</label><em id="tbspTotalFreeSize">${objDb.TBSP_FREE_SIZE }</em>
                                            </div>
                                            <table class="table" style="width:100%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width:5%;">序号</th>
                                                        <th style="width:20%;">表空间名</th>
                                                        <#if objDb.SUBTYPE == "DB2">
                                                            <th style="width:8%;">类型</th>
                                                            <th style="width:8%;">状态</th>
                                                        </#if>
                                                        <#if objDb.SUBTYPE == "ORACLE">
                                                            <th style="width:10%;">在线状态</th>
                                                        </#if>
                                                        <th style="width:8%;">大小(GB)</th>
                                                        <th style="width:10%;">已用空间(GB)</th>
                                                        <th style="width:10%;">空闲空间(GB)</th>
                                                        <th style="width:8%;">使用率(%)</th>
                                                        <th style="width:8%;">自动扩展</th>
                                                        <#if objDb.SUBTYPE == "DB2">
                                                            <th style="width:16%;">所用缓冲池</th>
                                                        </#if>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <#list objDb.TBSP_LIST as objTbsp>
                                                        <tr  class="trItem">
                                                            <td align="center">${objTbsp_index+1 }</td>
                                                            <td>${objTbsp.name }</td>
                                                            <#if objDb.SUBTYPE == "DB2">
                                                                <td>${objTbsp.type }</td>
                                                            </#if>
                                                            <td>${objTbsp.state }</td>
                                                            <td>${objTbsp.usableSize }</td>
                                                            <td>${objTbsp.usedSize }</td>
                                                            <td>${objTbsp.freeSize }</td>
                                                            <td>${objTbsp.tbspUtilPercent }</td>
                                                            <td>
                                                                <#if objDb.SUBTYPE == "DB2">
                                                                   <#if objTbsp.autoResizeEnable?number == 1>Yes
                                                                   <#else>No</#if>
                                                                </#if>
                                                                <#if objDb.SUBTYPE == "ORACLE">${objTbsp.autoExtensible }</#if>
                                                            </td>
                                                            <#if objDb.SUBTYPE == "DB2">
                                                                <td>${objTbsp.bpName }</td>
                                                            </#if>
                                                        </tr>
                                                    </#list>
                                                </tbody>
                                            </table>
                                        </div>
                                    </#if>
                                    <#if objDb.SUBTYPE == "ORACLE">
                                        <div>
                                            <div class="title" style="float:left;">重做日志组</div>
                                            <table class="table" style="width:60%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width:5%;">组</th>
                                                        <th style="width:20%;">状态</th>
                                                        <th style="width:15%;">成员数</th>
                                                        <th style="width:15%;">已归档</th>
                                                        <th style="width:15%;">大小(MB)</th>
                                                        <th style="width:15%;">序列</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <#list objDb.LOG_GROUP_LIST as objLog>
                                                        <tr class="trItem">
                                                            <td align="center">${objLog.group }</td>
                                                            <td>${objLog.status }</td>
                                                            <td>${objLog.members }</td>
                                                            <td>${objLog.archived }</td>
                                                            <td>${objLog.size }</td>
                                                            <td>${objLog.sequence}</td>
                                                        </tr>
                                                    </#list>
                                                </tbody>
                                            </table>
                                        </div>
                                    </#if>
                                    <#if objDb.SUBTYPE == "MYSQL">
                                        <#if objDb.SLAVE_LIST?size gt 0>
                                            <div>
                                                <div class="title" style="float:left;">主从复制</div>
                                                <table class="table" style="width:90%;">
                                                    <thead>
                                                        <tr>
                                                            <th style="width:5%;">序号</th>
                                                            <th style="width:10%;">主库</th>
                                                            <th style="width:8%;">主库用户</th>
                                                            <th style="width:10%;">Slave_IO_State</th>
                                                            <th style="width:9%;">IO线程状态</th>
                                                            <th style="width:9%;">SQL线程状态</th>
                                                            <th style="width:10%;">当前主库日志</th>
                                                            <th style="width:8%;">已读位置</th>
                                                            <th style="width:10%;">复制DB</th>
                                                            <th style="width:10%;">最新Error</th>
                                                            <th style="width:10%;">延迟时间(s)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#list objDb.SLAVE_LIST as objSlave>
                                                            <tr class="trItem">
                                                                <td align="center">${objSlave_index+1 }</td>
                                                                <td>${objSlave.masterHost }</td>
                                                                <td>${objSlave.masterUser }</td>
                                                                <td>${objSlave.slaveIoState }</td>
                                                                <td>${objSlave.slaveIoRunning }</td>
                                                                <td>${objSlave.slaveSqlRunning}</td>
                                                                <td>${objSlave.masterLogFile}</td>
                                                                <td>${objSlave.readMasterLogPos}</td>
                                                                <td>${objSlave.replicateDoDb}</td>
                                                                <td>${objSlave.lastError}</td>
                                                                <td>${objSlave.secondsBehindMaster}</td>
                                                            </tr>
                                                        </#list>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </#if>
                                        <#if objDb.BINARYLOG_LIST?size gt 0>
                                            <div>
                                                <div class="title" style="float:left;">二进制日志</div>
                                                <div style="padding-left: 30%; float: left; display: inline;">
                                                    <#if objDb.MASTER_INFO?exists>
                                                        <label>当前文件：</label><em>${objDb.MASTER_INFO.file }</em>
                                                        <label>当前位置：</label><em>${objDb.MASTER_INFO.position }</em>
                                                    </#if>
                                                </div>
                                                <table class="table" style="width:60%;">
                                                    <thead>
                                                        <tr>
                                                            <th style="width:10%;">序号</th>
                                                            <th style="width:60%;">文件名称</th>
                                                            <th style="width:30%;">大小(Mb)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#list objDb.BINARYLOG_LIST as objLog>
                                                            <tr class="trItem">
                                                                <td align="center">${objLog_index+1 }</td>
                                                                <td>${objLog.logName }</td>
                                                                <td>${objLog.fileSize/1024.0/1024.0 }</td>
                                                            </tr>
                                                        </#list>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </#if>
                                    </#if>
                                </#if>
                            </div>
                        </div>
                    </#list>
                </div>
                <div>
                    <div class="title">
                        <label class="itemLabel">中间件配置</label>
                    </div>
                    <#list MW_CONFIG_LIST as objMw>
                        <div class="divItem portlet" id="${objMw.RES_ID }" name="${objMw.RES_ID }">
                            <div class="portlet-header">
                                <label class="itemLabel">资源名：</label>${objMw.RES_NAME }
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;控制台：</label>${objMw.IP }:${objMw.PORT }
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;版本：</label>${objMw.VERSION }
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;环境：</label>
                                <#if objMw.ENV_TYPE == "1">生产
                                <#elseif objMw.ENV_TYPE == "2">测试
                                <#else>未设置</#if>
                            </div>
                            <div class="portlet-content">
                                <#if objMw.SUBTYPE == "WAS">
                                    <!-- WAS服务器 -->
                                    <div>
                                        <div class="title" style="float:left;">应用服务器列表</div>
                                        <table class="table">
                                            <thead>
                                                <tr class="noDisplayTr">
                                                   <th style="width:4%;"></th><th style="width:8%;"></th><th style="width:8%;"></th>
                                                   <th style="width:10%;"></th><th style="width:10%;"></th><th style="width:10%;"></th>
                                                   <th style="width:6%;"><th style="width:8%;"></th><th style="width:8%;"></th><th style="width:8%;"></th>
                                                   <th style="width:10%;"></th><th style="width:10%;"></th>
                                                </tr>
                                                <tr>
                                                    <th colspan="3" style="width:20%;">基本信息</th>
                                                    <th colspan="3" style="width:30%;">JVM虚拟机</th>
                                                    <th colspan="4" style="width:30%;">WebContainer线程池</th>
                                                    <th colspan="2" style="width:20%;">所在域</th>
                                                </tr>
                                                <tr>
                                                   <th>序号</th><th>服务器名</th><th>状态</th><th>当前堆(MB)</th><th>最大堆(MB)</th><th>使用率</th><th>最小值</th><th>最大值</th><th>超时时间</th><th>当前值</th><th>节点</th><th>集群</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list objMw.SERVER_LIST as objServer>
                                                    <tr class="trItem">
                                                        <td align="center">${objServer_index+1 }</td>
                                                        <td title="${objServer.server }">${objServer.server }</td>
                                                        <td title="${objServer.state }">
                                                            <#if objServer.state == "1">up<#else>down</#if>
                                                        </td>
                                                        <td title="${objServer.usedMemory }">${objServer.usedMemory }</td>
                                                        <td title="${objServer.maxMemory }">${objServer.maxMemory }</td>
                                                        <td title="${objServer.memUseRatio }">${objServer.memUseRatio }</td>
                                                        <td title="${objServer.webConMinSize }">${objServer.webConMinSize }</td>
                                                        <td title="${objServer.webConMaxSize }">${objServer.webConMaxSize }</td>
                                                        <td title="${objServer.webConInactivityTimeout }">${objServer.webConInactivityTimeout }</td>
                                                        <td title="${objServer.currentThreadPool }">${objServer.currentThreadPool }</td>
                                                        <td title="${objServer.node }">${objServer.node }</td>
                                                        <td title="${objServer.ClusterName }">${objServer.ClusterName }</td>
                                                    </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <div class="title" style="float:left;">JDBC数据源列表</div>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th style="width:5%;">序号</th>
                                                    <th style="width:12%;">名称</th>
                                                    <th style="width:13%;">JNDI名</th>
                                                    <th style="width:16%;">URL</th>
                                                    <th style="width:8%;">最小连接数</th>
                                                    <th style="width:8%;">最大连接数</th>
                                                    <th style="width:8%;">超时时间</th>
                                                    <th style="width:7%;">隔离级别</th>
                                                    <th style="width:7%;">语句<br>高速缓存</th>
                                                    <th style="width:16%;">作用域</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list objMw.JDBC_LIST as objJdbc>
                                                    <tr class="trItem">
                                                        <td align="center">${objJdbc_index+1 }</td>
                                                        <td title="${objJdbc.datasourceName }">${objJdbc.datasourceName }</td>
                                                        <td title="${objJdbc.jndiName }">${objJdbc.jndiName }</td>
                                                        <td title="${objJdbc.Url }">${objJdbc.Url }</td>
                                                        <td title="${objJdbc.minConnections }">${objJdbc.minConnections }</td>
                                                        <td title="${objJdbc.maxConnections }">${objJdbc.maxConnections }</td>
                                                        <td title="${objJdbc.connectionTimeout }">${objJdbc.connectionTimeout }</td>
                                                        <td title="${objJdbc.isolationLevel }">${objJdbc.isolationLevel }</td>
                                                        <td title="${objJdbc.statementCacheSize }">${objJdbc.statementCacheSize }</td>
                                                        <td title="${objJdbc.workDomain }">${objJdbc.workDomain }</td>
                                                    </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <div class="title" style="float:left;">应用程序列表</div>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th style="width:4%;">序号</th>
                                                    <th style="width:10%;">应用程序</th>
                                                    <th style="width:6%;">服务器</th>
                                                    <th style="width:10%;">Web模块</th>
                                                    <th style="width:15%;">路径</th>
                                                    <th style="width:6%;">二进制<br>配置</th>
                                                    <th style="width:6%;">状态</th>
                                                    <th style="width:10%;">Cookie路径</th>
                                                    <th style="width:8%;">会话<br>超时时间</th>
                                                    <th style="width:6%;">当前<br>会话数</th>
                                                    <th style="width:10%;">节点</th>
                                                    <th style="width:9%;">集群</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list objMw.APP_LIST as objApp>
                                                    <tr class="trItem">
                                                        <td align="center">${objApp_index+1 }</td>
                                                        <td title="${objApp.appName }">${objApp.appName }</td>
                                                        <td title="${objApp.server }">${objApp.server }</td>
                                                        <td title="${objApp.webMoudle }">${objApp.webMoudle }</td>
                                                        <td title="${objApp.binariesURL }">${objApp.binariesURL }</td>
                                                        <td title="${objApp.useMetadataFromBinaries }">${objApp.useMetadataFromBinaries }</td>
                                                        <td title="${objApp.state }">
                                                            <#if objApp.state == "1">up<#else>down</#if>
                                                        </td>
                                                        <td title="${objApp.path }">${objApp.path }</td>
                                                        <td title="${objApp.sessionTimeout }">${objApp.sessionTimeout }</td>
                                                        <td title="${objApp.currentSession }">${objApp.currentSession }</td>
                                                        <td title="${objApp.node }">${objApp.node }</td>
                                                        <td title="${objApp.ClusterName }">${objApp.ClusterName }</td>
                                                    </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                </#if>
                                
                                <#if objMw.SUBTYPE == "WEBLOGIC">
                                    <!-- WEBLOGIC服务器 -->
                                    <div>
                                        <div class="title" style="float:left;">应用服务器列表</div>
                                        <table class="table">
                                            <thead>
                                                <tr class="noDisplayTr">
                                                   <th style="width:3%;"></th><th style="width:8%;"></th><th style="width:8%;"></th><th style="width:6%;"></th>
                                                   <th style="width:10%;"></th><th style="width:10%;"></th><th style="width:10%;"></th>
                                                   <th style="width:8%;"></th><th style="width:8%;"></th><th style="width:9%;"></th>
                                                   <th style="width:10%;"></th><th style="width:10%;"></th>
                                                </tr>
                                                <tr>
                                                    <th colspan="4" style="width:25%;">基本信息</th>
                                                    <th colspan="3" style="width:30%;">JVM虚拟机</th>
                                                    <th colspan="3" style="width:25%;">WebContainer线程池</th>
                                                    <th colspan="2" style="width:20%;">所在域</th>
                                                </tr>
                                                <tr>
                                                   <th>序号</th><th>服务器名</th><th>状态</th><th>端口</th><th>计算使用(MB)</th><th>最大堆(MB)</th><th>使用率(%)</th><th>当前池</th><th>队列长度</th><th>吞吐量</th><th>计算机</th><th>集群</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list objMw.SERVER_LIST as objServer>
                                                    <tr class="trItem">
                                                        <td align="center">${objServer_index+1 }</td>
                                                        <td title="${objServer.serverName }">${objServer.serverName }</td>
                                                        <td title="${objServer.state }">
                                                            <#if objServer.state == "1">up<#else>down</#if>
                                                        </td>
                                                        <td title="${objServer.listenPort }">${objServer.listenPort }</td>
                                                        <td title="${objServer.heapUsedCurrent }">${objServer.heapUsedCurrent }</td>
                                                        <td title="${objServer.heapSizeMax }">${objServer.heapSizeMax }</td>
                                                        <td title="${objServer.heapUsedPercent }">${objServer.heapUsedPercent }</td>
                                                        <td title="${objServer.executeThreadTotalCount }">${objServer.executeThreadTotalCount }</td>
                                                        <td title="${objServer.queueLength }">${objServer.queueLength }</td>
                                                        <td title="${objServer.throughput }">${objServer.throughput }</td>
                                                        <td title="${objServer.machine }">${objServer.machine }</td>
                                                        <td title="${objServer.cluster }">${objServer.cluster }</td>
                                                    </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <div class="title" style="float:left;">JDBC数据源列表</div>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th style="width:4%;">序号</th>
                                                    <th style="width:10%;">名称</th>
                                                    <th style="width:10%;">JNDI名</th>
                                                    <th style="width:5%;">状态</th>
                                                    <th style="width:18%;">URL</th>
                                                    <th style="width:9%;">目标Server</th>
                                                    <th style="width:7%;">初始容量</th>
                                                    <th style="width:7%;">最大容量</th>
                                                    <th style="width:7%;">语句<br>高速缓存</th>
                                                    <th style="width:8%;">当前活动<br>连接数</th>
                                                    <th style="width:8%;">平均活动<br>连接数</th>
                                                    <th style="width:8%;">最大活动<br>连接数</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list objMw.JDBC_LIST as objJdbc>
                                                    <tr class="trItem">
                                                        <td align="center">${objJdbc_index+1 }</td>
                                                        <td title="${objJdbc.DSName }">${objJdbc.DSName }</td>
                                                        <td title="${objJdbc.JNDIName }">${objJdbc.JNDIName }</td>
                                                        <td title="${objJdbc.state }">
                                                            <#if objJdbc.state == "1">up<#else>down</#if>
                                                        </td>
                                                        <td title="${objJdbc.Url }">${objJdbc.Url }</td>
                                                        <td title="${objJdbc.server }">${objJdbc.server }</td>
                                                        <td title="${objJdbc.InitialCapacity }">${objJdbc.InitialCapacity }</td>
                                                        <td title="${objJdbc.MaxCapacity }">${objJdbc.MaxCapacity }</td>
                                                        <td title="${objJdbc.StatementCacheSize }">${objJdbc.StatementCacheSize }</td>
                                                        <td title="${objJdbc.activeConnectionsCurrentCount }">${objJdbc.activeConnectionsCurrentCount }</td>
                                                        <td title="${objJdbc.activeConnectionsAverageCount }">${objJdbc.activeConnectionsAverageCount }</td>
                                                        <td title="${objJdbc.activeConnectionsHighCount }">${objJdbc.activeConnectionsHighCount }</td>
                                                    </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <div class="title" style="float:left;">应用程序列表</div>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th style="width:4%;">序号</th>
                                                    <th style="width:8%;">应用程序</th>
                                                    <th style="width:10%;">模块名</th>
                                                    <th style="width:4%;">状态</th>
                                                    <th style="width:8%;">上下文</th>
                                                    <th style="width:8%;">服务器</th>
                                                    <th style="width:15%;">路径</th>
                                                    <th style="width:8%;">会话<br>超时时间</th>
                                                    <th style="width:10%;">Cookie路径</th>
                                                    <th style="width:6%;">当前<br>会话数</th>
                                                    <th style="width:10%;">计算机</th>
                                                    <th style="width:9%;">集群</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <#list objMw.APP_LIST as objApp>
                                                    <tr class="trItem">
                                                        <td align="center">${objApp_index+1 }</td>
                                                        <td title="${objApp.appName }">${objApp.appName }</td>
                                                        <td title="${objApp.componentName }">${objApp.componentName }</td>
                                                        <td title="${objApp.state }">
                                                            <#if objApp.state == "1">up<#else>down</#if>
                                                        </td>
                                                        <td title="${objApp.contextRoot }">${objApp.contextRoot }</td>
                                                        <td title="${objApp.server }">${objApp.server }</td>
                                                        <td title="${objApp.absoluteSourcePath }">${objApp.absoluteSourcePath }</td>
                                                        <td title="${objApp.sessionTimeoutSecs }">${objApp.sessionTimeoutSecs }</td>
                                                        <td title="${objApp.sessionCookiePath }">${objApp.sessionCookiePath }</td>
                                                        <td title="${objApp.openSessionsCurrentCount }">${objApp.openSessionsCurrentCount }</td>
                                                        <td title="${objApp.machine }">${objApp.machine }</td>
                                                        <td title="${objApp.cluster }">${objApp.cluster }</td>
                                                    </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </#list>
                    <#if (APACHE_LIST?size gt 0)>
                        <!-- APACHE服务器 -->
                        <div>
                            <div class="title" style="float:left;" id="apache" name="apache">APACHE监控信息</div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width:5%;">序号</th>
                                        <th style="width:15%;">资源名</th>
                                        <th style="width:6%;">状态</th>
                                        <th style="width:8%;">W个数</th>
                                        <th style="width:8%;">K个数</th>
                                        <th style="width:10%;">W/K比值</th>
                                        <th style="width:10%;">IdleWorkers</th>
                                        <th style="width:10%;">BusyWorkers</th>
                                        <th style="width:25%;">URL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#list APACHE_LIST as objApache>
                                        <tr class="trItem">
                                            <td align="center">${objApache_index+1 }</td>
                                            <td title="${objApache.RES_NAME }">${objApache.RES_NAME }</td>
                                            <td title="${objApache.status }">
                                                <#if objApache.status == "1">up<#else>down</#if>
                                            </td>
                                            <td title="${objApache.sumW }">${objApache.sumW }</td>
                                            <td title="${objApache.sumK }">${objApache.sumK }</td>
                                            <td title="${objApache.WKRatio }">${objApache.WKRatio }</td>
                                            <td title="${objApache.IdleWorkers }">${objApache.IdleWorkers }</td>
                                            <td title="${objApache.BusyWorkers }">${objApache.BusyWorkers }</td>
                                            <td title="${objApache.URL }">${objApache.URL }</td>
                                        </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                    </#if>
                    <#if (TOMCAT_INFO.TOMCAT_SERVER_LIST?exists && TOMCAT_INFO.TOMCAT_SERVER_LIST?size gt 0)>
                        <div class="title" id="tomcat" name="tomcat">
                            <label class="itemLabel">Tomcat配置</label>
                        </div>
                        <!-- TOMCAT -->
                        <div>
                            <table class="table" style="float:left;">
                                <thead>
                                    <tr>
                                        <th colspan="1" width="2%"></th>
                                        <th colspan="1" width="9%"></th>
                                        <th colspan="1" width="6%"></th>
                                        <th colspan="1" width="5%"></th>
                                        <th colspan="4" width="32%">JVM虚拟机(MB)</th>
                                        <th colspan="4" width="46%">WebContainer线程池</th>
                                    </tr>
                                    <tr>
                                        <th width="3%"></th>
                                        <th width="11%">服务名</th>
                                        <th width="6%">状态</th>
                                        <th width="5%">版本</th>
                                        <th width="9%">当前(堆)</th>
                                        <th width="10%">最大(堆)</th>
                                        <th width="9%">当前（非堆）</th>
                                        <th width="10%">最大（非堆）</th>
                                        <th width="9%">线程池名</th>
                                        <th width="9%">端口</th>
                                        <th width="10%">线程池（忙碌/当前/最大）</th>
                                        <th width="10%">连接数（当前/最大）</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#list TOMCAT_INFO.TOMCAT_SERVER_LIST as objTs >
                                        <tr class="trItem">
                                            <td align="center">${objTs_index+1 }</td>
                                            <td title="${objTs.RES_NAME }">${objTs.RES_NAME }</td>
                                            <td title="${objTs.state }">
                                                <#if objTs.state == "1">up<#else>down</#if>
                                            </td>
                                            <td title="${objTs.serverInfo }">${objTs.serverInfo }</td>
                                            <td title="${objTs.usedMemory }">${objTs.usedMemory }</td>
                                            <td title="${objTs.maxMemory }">${objTs.maxMemory }</td>
                                            <td title="${objTs.usedMemory_nonheap }">${objTs.usedMemory_nonheap }</td>
                                            <td title="${objTs.maxMemory_nonheap }">${objTs.maxMemory_nonheap }</td>
                                            <td title="${objTs.threadPoolName }">${objTs.threadPoolName }</td>
                                            <td title="${objTs.ports }">${objTs.ports }</td>
                                            <td><#if objTs.currentThreadsBusy?length != 0> ${objTs.currentThreadsBusy} / ${objTs.currentThreadCount} / (${objTs.maxThreads} )</#if></td>
                                            <td><#if objTs.connectionCount?length != 0>"${objTs.connectionCount} /( ${objTs.maxConnections})</#if></td>
                                        </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                        <#if TOMCAT_INFO.TOMCAT_JDBC_LIST?size gt 0>
                            <div>
                                <table class="table" style="float:left;">
                                    <thead>
                                        <tr>
                                            <th width="5%">序号</th>
                                            <th width="14%">JNDI名称</th>
                                            <th width="15%">URL</th>
                                            <th width="11%">连接数(当前/最大)</th>
                                            <th width="12%">空闲连接(当前/最大)</th>
                                            <th width="11%">最大等待时间(s)</th>
                                            <th width="7%">是否清理</th>
                                            <th width="10%">最大空闲时间（s）</th>
                                            <th width="15%">所属tomcat </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list TOMCAT_INFO.TOMCAT_JDBC_LIST as objJl >
                                            <tr class="trItem">
                                                <td align="center">${objJl_index+1 }</td>
                                                <td title="${objJl.jndiName }">${objJl.jndiName }</td>
                                                <td title="${objJl.url }">${objJl.url }</td>
                                                <td>${objJl.numActive }/${objJl.maxActive }</td>
                                                <td>${objJl.numIdle }/${objJl.maxIdle }</td>
                                                <td>${objJl.maxWait }</td>
                                                <td>${objJl.removeAbandoned }</td>
                                                <td>${objJl.removeAbandonedTimeout }</td>
                                                <td title="${objJl.RES_NAME }">${objJl.RES_NAME }</td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                        </#if>
                        <#if TOMCAT_INFO.TOMCAT_DRUID_LIST?size gt 0>
                            <div>
                                <table class="table" style="float:left;">
                                    <thead>
                                        <tr>
                                            <th width="6%">序号</th>
                                            <th width="10%">名称</th>
                                            <th width="5%">库类型</th>
                                            <th width="15%">URL</th>
                                            <th width="8%">当前活跃连接</th>
                                            <th width="12%">活跃连接峰值/时间</th>
                                            <th width="8%">当前池大小</th>
                                            <th width="12%">池峰值/时间</th>
                                            <th width="10%">初始/最大连接</th>
                                            <th width="10%">所属tomcat</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list TOMCAT_INFO.TOMCAT_DRUID_LIST as objDl >
                                            <tr class="trItem">
                                                <td align="center">${objDl_index+1 }</td>
                                                <td title="${objDl.Name }">${objDl.Name }</td>
                                                <td title="${objDl.DbType }">${objDl.DbType }</td>
                                                <td title="${objDl.Url }">${objDl.Url }</td>
                                                <td>${objDl.ActiveCount }</td>
                                                <td>${objDl.ActivePeak }/[${objDl.ActivePeakTime }]</td>
                                                <td>${objDl.PoolingCount }</td>
                                                <td>${objDl.PoolingPeak }/[${objDl.PoolingPeakTime }]</td>
                                                <td>${objDl.InitialSize }/[${objDl.MaxActive }]</td>
                                                <td title="${objDl.RES_NAME }">${objDl.RES_NAME }</td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                        </#if>
                        <#if TOMCAT_INFO.TOMCAT_WAR_LIST?size gt 0>
                            <div>
                                <table class="table" style="float:left;">
                                    <thead>
                                        <tr>
                                            <th width="6%">序号</th>
                                            <th width="12%">应用程序</th>
                                            <th width="20%">路径</th>
                                            <th width="9%">当前会话</th>
                                            <th width="9%">历史最大会话</th>
                                            <th width="9%">允许最大会话</th>
                                            <th width="11%">会话超时时间(m)</th>
                                            <th width="9%">cookie路径</th>
                                            <th width="15%">所属tomcat</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#list TOMCAT_INFO.TOMCAT_WAR_LIST as objWar >
                                            <tr class="trItem">
                                                <td align="center">${objWar_index+1 }</td>
                                                <td title="${objWar.path }">${objWar.path }</td>
                                                <td title="${objWar.docBase }">${objWar.docBase }</td>
                                                <td>${objWar.activeSessions }</td>
                                                <td>${objWar.maxActive }</td>
                                                <td>${objWar.maxActiveSessions }</td>
                                                <td>${objWar.maxInactiveInterval }</td>
                                                <td>${objWar.sessionCookiePath }</td>
                                                <td title="${objWar.RES_NAME }">${objWar.RES_NAME }</td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                        </#if>
                    </#if>
                </div>
                <div>
                    <div class="title">
                        <label class="itemLabel">主机配置</label>
                    </div>
                    <#list HOST_CONFIG_LIST as objHost>
                        <div class="divItem portlet" id="${objHost.RES_ID }" name="${objHost.RES_ID }">
                            <div class="portlet-header">
                                <label class="itemLabel">资源名：</label>${objHost.RES_NAME }
                                <label class="itemLabel">&nbsp;&nbsp;IP：</label>${objHost.IP }
                                <label class="itemLabel">&nbsp;&nbsp;系统：</label>${objHost.SUBTYPE }
                                <label class="itemLabel">&nbsp;&nbsp;主机名：</label><#if objHost.BASIC_INFO?exists>${objHost.BASIC_INFO.hostName }</#if>
                                <label class="itemLabel">&nbsp;&nbsp;CPU使用率：</label><#if objHost.CPU_USAGE?exists>${objHost.CPU_USAGE }%</#if>
                                <label class="itemLabel">&nbsp;&nbsp;&nbsp;Ping状态：</label>
                                    <#if objHost.BASIC_INFO.pingStatus == "1">up<#else>down</#if>
                            </div>
                            <div class="portlet-content">
                                <#if objHost.ENV_TYPE == "2" || objHost.BASIC_INFO.pingStatus == "0" ||  objHost.BASIC_INFO.snmpStatus == "0">
                                    <div style="width:100%;text-align:center;color:#009cff;">该资源监控失败！</div>
                                <#else>
                                    <div>
                                        <div class="title" style="float:left;">内存信息</div>
                                        <div style="margin-left:100px;">
                                            <label style="margin-left:10px;">内存总大小：</label>${objHost.MEM_INFO.phySize?number/1024.0/1024.0/1024.0 }&nbsp;GB
                                            <label style="margin-left:10px;">已用物理内存：</label>${objHost.MEM_INFO.phyUsed?number/1024.0/1024.0/1024.0 }&nbsp;GB
                                            <label style="margin-left:10px;">Buffer缓存：</label>
                                                <#if objHost.SUBTYPE != "AIX" && objHost.SUBTYPE != "WINDOWS">
                                                    ${objHost.MEM_INFO.buffersUsed?number/1024.0/1024.0/1024.0 }&nbsp;GB
                                                <#else>—</#if>
                                            <label style="margin-left:10px;">Cached缓存：</label>
                                                <#if objHost.SUBTYPE != "AIX" && objHost.SUBTYPE != "WINDOWS">
                                                    ${objHost.MEM_INFO.cachedUsed?number/1024.0/1024.0/1024.0 }&nbsp;GB
                                                <#else>—</#if>
                                            <label style="margin-left:10px;">内存使用率：</label>${objHost.MEM_INFO.calMemUsage?number }%
                                        </div>
                                    </div>
                                    <div>
                                        <div class="title" style="float:left;">文件系统</div>
                                        <div>
                                            <div style="padding-left: 30%; float: left; display: inline;">
                                                <label>空间总大小(GB)：</label><em id="fsTotalSize">${objHost.FS_TOTAL_SIZE }</em>
                                                <label>总使用空间(GB)：</label><em id="fsTotalUsedSize">${objHost.FS_USED_SIZE }</em>
                                                <label>总剩余空间(GB)：</label><em id="fsTotalFreeSize">${objHost.FS_FREE_SIZE }</em>
                                            </div>
                                            <table class="table" style="width:90%;">
                                                <thead>
                                                    <tr>
                                                        <th style="width:5%;">序号</th>
                                                        <th style="width:25%;">文件系统</th>
                                                        <th style="width:16%;">空间大小(GB)</th>
                                                        <th style="width:16%;">已用空间(GB)</th>
                                                        <th style="width:16%;">剩余空间(GB)</th>
                                                        <th style="width:16%;">使用率(%)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <#list objHost.FS_INFO as objFs>
                                                        <tr class="trItem">
                                                            <td align="center">${objFs_index+1 }</td>
                                                            <td>${objFs.fsDescr }</td>
                                                            <td>${objFs.fsSize?number/1024.0/1024.0/1024.0 }</td>
                                                            <td>${objFs.fsUsed?number/1024.0/1024.0/1024.0 }</td>
                                                            <td>${objFs.fsFree }</td>
                                                            <td>${objFs.fsUsage }</td>
                                                        </tr>
                                                    </#list>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
        </div>
    </body>
</html>