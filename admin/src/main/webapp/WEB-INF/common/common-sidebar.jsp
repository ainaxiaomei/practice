<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
    <%String path=getServletContext().getContextPath();%>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
            <li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
          </ul>
        </li>
        <li id="tables" class="treeview active">
          <a href="#">
            <i class="fa fa-table"></i> <span>Tables</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li id="app"><a href="<%=path %>/app"><i class="fa fa-circle-o"></i> App Table</a></li>
            <li id="appResources"><a href="<%=path %>/appResource"><i class="fa fa-circle-o"></i> AppResource Table</a></li>
            <li id="gateServers" ><a href="<%=path %>/gateServer"><i class="fa fa-circle-o"></i> Gate Table</a></li>
            <li id="indexDbServers" ><a href="<%=path %>/indexDbServers"><i class="fa fa-circle-o"></i> IndexDbServer Table</a></li>
            <li id="indexDbGroup" ><a href="<%=path %>/indexDbGroup"><i class="fa fa-circle-o"></i> IndexDbGroup Table</a></li>
            <li id="ftpServers"><a href="<%=path %>/ftpServer"><i class="fa fa-circle-o"></i> Ftp Table</a></li>
            <li id="devices" ><a href="<%=path %>/device"><i class="fa fa-circle-o"></i> Device Table</a></li>
            <li id="dictionarys"><a href="<%=path %>/dictionary"><i class="fa fa-circle-o"></i> Dictionary Table</a></li>
            <li id="configServer"><a href="<%=path %>/configServer"><i class="fa fa-circle-o"></i> ConfigServer Table</a></li>
            <li id="mcuConfig">
              <a href="#"><i class="fa fa-circle-o"></i> Mcu Config Table <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li id="mcuServers"><a href="<%=path %>/mcuServer"><i class="fa fa-circle-o"></i> Mcu Table</a></li>
                <li id="groupMcus" ><a href="<%=path %>/groupMcu"><i class="fa fa-circle-o"></i> GroupMcu Table</a></li>
                <li id="groupMcuServers"><a href="<%=path %>/groupMcuServer"><i class="fa fa-circle-o"></i> GroupMcuServer Table</a></li>
              </ul>
            </li>
            <li id="audioConfig">
              <a href="#"><i class="fa fa-circle-o"></i> Audio Config Table <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li id="audio"><a href="<%=path %>/audioServer"><i class="fa fa-circle-o"></i> Audio Table</a></li>
                <li id="groupAudios"><a href="<%=path %>/groupAudio"><i class="fa fa-circle-o"></i> GroupAudio Table</a></li>
                <li id="groupAudioServers"><a href="<%=path %>/groupAudioServer"><i class="fa fa-circle-o"></i> GroupAudioServer Table</a></li>
              </ul>
            </li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>