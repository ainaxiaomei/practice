<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
    <%String path=getServletContext().getContextPath();%>
 <!-- left, vertical navbar -->
                <div class="col-md-2 bootstrap-admin-col-left">
                    <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-chevron-right"></i> About</a>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li >
                            <a href="<%=path %>/app"><i class="glyphicon glyphicon-chevron-right"></i> Apps</a>
                        </li>
                        <li>
                            <a href="<%=path %>/appResource"><i class="glyphicon glyphicon-chevron-right"></i> App Resource</a>
                        </li>
                        <li>
                            <a href="<%=path %>/gateServer"><i class="glyphicon glyphicon-chevron-right"></i> Gate Server</a>
                        </li>
                        <li>
                            <a href="<%=path %>/indexDbServer"><i class="glyphicon glyphicon-chevron-right"></i> Membdb Server</a>
                        </li>
                        <li>
                            <a href="<%=path %>/ftpServer"><i class="glyphicon glyphicon-chevron-right"></i> Ftp Server</a>
                        </li>
                        <li>
                            <a href="<%=path %>/dictionary"><i class="glyphicon glyphicon-chevron-right"></i> Dictionary</a>
                        </li>
                        <li>
                            <a href="<%=path %>/device"><i class="glyphicon glyphicon-chevron-right"></i> Device</a>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-chevron-down"></i> Mcu Config</a>
                            <ul class="nav navbar-collapse bootstrap-admin-navbar-side">
                                 <li><a href="<%=path %>/mcuServer"><i class="glyphicon glyphicon-chevron-right"></i> Mcu Server</a></li>
                                <li><a href="<%=path %>/groupMcu"><i class="glyphicon glyphicon-chevron-right"></i> Mcu Group</a></li>
                                <li><a href="<%=path %>/groupMcuServer"><i class="glyphicon glyphicon-chevron-right"></i> Mcu Group Server</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-chevron-down"></i> Audio Config</a>
                            <ul class="nav navbar-collapse bootstrap-admin-navbar-side">
                                <li><a href="<%=path %>/audioServer"><i class="glyphicon glyphicon-chevron-right"></i> Audio Server</a></li>
                                <li><a href="<%=path %>/groupAudio"><i class="glyphicon glyphicon-chevron-right"></i> Audio Group</a></li>
                                <li><a href="<%=path %>/groupAudioServer"><i class="glyphicon glyphicon-chevron-right"></i> Audio Group Server</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">731</span> Orders</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">812</span> Invoices</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">2,221</span> Messages</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">11</span> Reports</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">83</span> Errors</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">4,231</span> Logs</a>
                        </li>
                    </ul>
                </div>
                