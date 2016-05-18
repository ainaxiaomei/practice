<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Forms | Bootstrap 3.x Admin Theme</title>
        <jsp:include page="common/commonHead.jsp"></jsp:include>
    </head>
    <body class="bootstrap-admin-with-small-navbar">
        <!-- small navbar -->
        <nav class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar-sm" role="navigation">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left bootstrap-admin-theme-change-size">
                                <li class="text">Change size:</li>
                                <li><a class="size-changer small">Small</a></li>
                                <li><a class="size-changer large active">Large</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#">Link</a></li>
                                <li><a href="#">Link</a></li>
                                <li>
                                    <a href="#">Reminders <i class="glyphicon glyphicon-bell"></i></a>
                                </li>
                                <li>
                                    <a href="#">Settings <i class="glyphicon glyphicon-cog"></i></a>
                                </li>
                                <li>
                                    <a href="#">Go to frontend <i class="glyphicon glyphicon-share-alt"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i> Username <i class="caret"></i></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li><a href="index.html">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- main / large navbar -->
        <nav class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".main-navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="about.html">Admin Panel</a>
                        </div>
                        <div class="collapse navbar-collapse main-navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Link</a></li>
                                <li><a href="#">Link</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-hover="dropdown">Dropdown <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li role="presentation" class="dropdown-header">Dropdown header</li>
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li role="presentation" class="divider"></li>
                                        <li role="presentation" class="dropdown-header">Dropdown header</li>
                                        <li><a href="#">Separated link</a></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div>
                </div>
            </div><!-- /.container -->
        </nav>

        <div class="container">
            <!-- left, vertical navbar & content -->
            <div class="row">
                <!-- left, vertical navbar -->
                <div class="col-md-2 bootstrap-admin-col-left">
                    <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                        <li>
                            <a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> About</a>
                        </li>
                        <li>
                            <a href="dashboard.html"><i class="glyphicon glyphicon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li class="disabled">
                            <a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Calendar</a><!-- calendar.html -->
                        </li>
                        <li class="disabled">
                            <a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Statistics (Charts)</a><!-- stats.html -->
                        </li>
                        <li class="active">
                            <a href="forms.html"><i class="glyphicon glyphicon-chevron-right"></i> Forms</a>
                        </li>
                        <li>
                            <a href="tables.html"><i class="glyphicon glyphicon-chevron-right"></i> Tables</a>
                        </li>
                        <li>
                            <a href="buttons-and-icons.html"><i class="glyphicon glyphicon-chevron-right"></i> Buttons &amp; Icons</a>
                        </li>
                        <li>
                            <a href="wysiwyg-editors.html"><i class="glyphicon glyphicon-chevron-right"></i> WYSIWYG Editors</a>
                        </li>
                        <li>
                            <a href="ui-and-interface.html"><i class="glyphicon glyphicon-chevron-right"></i> UI &amp; Interface</a>
                        </li>
                        <li>
                            <a href="error-pages.html"><i class="glyphicon glyphicon-chevron-right"></i> Error pages</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="glyphicon glyphicon-chevron-down"></i> Submenu</a>
                            <ul class="nav navbar-collapse bootstrap-admin-navbar-side">
                                <li><a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> Submenu 1</a></li>
                                <li><a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> Submenu 2</a></li>
                                <li><a href="about.html"><i class="glyphicon glyphicon-chevron-right"></i> Submenu 3</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">731</span> Orders</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">812</span> Invoices</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">27</span> Clients</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge pull-right">1,234</span> Users</a>
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

                <!-- content -->
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="page-header">
                                <h1>Application Detail</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default bootstrap-admin-no-table-panel">
                                <div class="panel-heading">
                                    <div class="text-muted bootstrap-admin-box-title"></div>
                                </div>
                                <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                    <form class="form-horizontal">
                                        <fieldset>
                                            <legend>Application Server Config</legend>
                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" for="focusedInput">Focused input</label>
                                                <div class="col-lg-10">
                                                    <input class="form-control" id="focusedInput" type="text" value="This is focused...">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-2 control-label">Uneditable input</label>
                                                <div class="col-lg-10">
                                                    <span class="form-control">Some value here</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" for="disabledInput">Disabled input</label>
                                                <div class="col-lg-10">
                                                    <input class="form-control disabled" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-2 control-label" for="optionsCheckbox2">Disabled checkbox</label>
                                                <div class="col-lg-10">
                                                    <label>
                                                        <input type="checkbox" id="optionsCheckbox2" value="option1" disabled="">
                                                        This is a disabled checkbox
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group has-warning">
                                                <label class="col-lg-2 control-label" for="inputError">Input with warning</label>
                                                <div class="col-lg-10">
                                                    <input type="text" id="inputWarning" class="form-control">
                                                    <span class="help-block">Something may have gone wrong</span>
                                                </div>
                                            </div>
                                            <div class="form-group has-error">
                                                <label class="col-lg-2 control-label" for="inputError">Input with error</label>
                                                <div class="col-lg-10">
                                                    <input type="text" id="inputError" class="form-control">
                                                    <span class="help-block">Please correct the error</span>
                                                </div>
                                            </div>
                                            <div class="form-group has-error">
                                                <label class="col-lg-2 control-label" for="inputError">Input group with error</label>
                                                <div class="col-lg-10">
                                                    <div class="input-group">
                                                        <input type="text" id="inputError" class="form-control">
                                                        <span class="input-group-addon">%</span>
                                                    </div>
                                                    <span class="help-block">Please correct the error</span>
                                                </div>
                                            </div>
                                            <div class="form-group has-success">
                                                <label class="col-lg-2 control-label" for="inputError">Input with success</label>
                                                <div class="col-lg-10">
                                                    <input type="text" id="inputSuccess" class="form-control">
                                                    <span class="help-block">Woohoo!</span>
                                                </div>
                                            </div>
                                            <div class="form-group has-success">
                                                <label class="col-lg-2 control-label" for="selectError">Select with success</label>
                                                <div class="col-lg-10">
                                                    <select id="selectError" class="form-control">
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                    <span class="help-block">Woohoo!</span>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                            <button type="reset" class="btn btn-default">Cancel</button>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       <jsp:include page="common/commonFooter.jsp"></jsp:include>

       

        <script type="text/javascript">
            $(function() {
                $('.datepicker').datepicker();
                $('.uniform_on').uniform();
                $('.chzn-select').chosen();
                $('.selectize-select').selectize();
                $('.textarea-wysihtml5').wysihtml5({
                    stylesheets: [
                        'vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/stylesheets/bootstrap-wysihtml5/wysiwyg-color.css'
                    ]
                });

                $('#rootwizard').bootstrapWizard({
                    'nextSelector': '.next',
                    'previousSelector': '.previous',
                    onNext: function(tab, navigation, index) {
                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        var $percent = ($current / $total) * 100;
                        $('#rootwizard').find('.progress-bar').css('width', $percent + '%');
                        // If it's the last tab then hide the last button and show the finish instead
                        if ($current >= $total) {
                            $('#rootwizard').find('.pager .next').hide();
                            $('#rootwizard').find('.pager .finish').show();
                            $('#rootwizard').find('.pager .finish').removeClass('disabled');
                        } else {
                            $('#rootwizard').find('.pager .next').show();
                            $('#rootwizard').find('.pager .finish').hide();
                        }
                    },
                    onPrevious: function(tab, navigation, index) {
                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        var $percent = ($current / $total) * 100;
                        $('#rootwizard').find('.progress-bar').css('width', $percent + '%');
                        // If it's the last tab then hide the last button and show the finish instead
                        if ($current >= $total) {
                            $('#rootwizard').find('.pager .next').hide();
                            $('#rootwizard').find('.pager .finish').show();
                            $('#rootwizard').find('.pager .finish').removeClass('disabled');
                        } else {
                            $('#rootwizard').find('.pager .next').show();
                            $('#rootwizard').find('.pager .finish').hide();
                        }
                    },
                    onTabShow: function(tab, navigation, index) {
                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        var $percent = ($current / $total) * 100;
                        $('#rootwizard').find('.bar').css({width: $percent + '%'});
                    }
                });
                $('#rootwizard .finish').click(function() {
                    alert('Finished!, Starting over!');
                    $('#rootwizard').find('a[href*=\'tab1\']').trigger('click');
                });
            });
        </script>
    </body>
</html>
