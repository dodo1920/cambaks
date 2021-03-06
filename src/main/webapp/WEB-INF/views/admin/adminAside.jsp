<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/adminAssets/images/favicon.png">
    <title>Matrix Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="../resources/adminAssets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../resources/adminDist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<aside class="left-sidebar" data-sidebarbg="skin5">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
				<ul id="sidebarnav" class="p-t-30">
					<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="index.html" aria-expanded="false"><i
							class="mdi mdi-view-dashboard"></i><span class="hide-menu">Dashboard</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="charts.html" aria-expanded="false"><i
							class="mdi mdi-chart-bar"></i><span class="hide-menu">Charts</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="widgets.html" aria-expanded="false"><i
							class="mdi mdi-chart-bubble"></i><span class="hide-menu">Widgets</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="tables.html" aria-expanded="false"><i
							class="mdi mdi-border-inside"></i><span class="hide-menu">Tables</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="grid.html" aria-expanded="false"><i
							class="mdi mdi-blur-linear"></i><span class="hide-menu">Full
								Width</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-receipt"></i><span class="hide-menu">Forms
						</span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="form-basic.html"
								class="sidebar-link"><i class="mdi mdi-note-outline"></i><span
									class="hide-menu"> Form Basic </span></a></li>
							<li class="sidebar-item"><a href="form-wizard.html"
								class="sidebar-link"><i class="mdi mdi-note-plus"></i><span
									class="hide-menu"> Form Wizard </span></a></li>
						</ul></li>
					<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="pages-buttons.html" aria-expanded="false"><i
							class="mdi mdi-relative-scale"></i><span class="hide-menu">Buttons</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-face"></i><span class="hide-menu">Icons </span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="icon-material.html"
								class="sidebar-link"><i class="mdi mdi-emoticon"></i><span
									class="hide-menu"> Material Icons </span></a></li>
							<li class="sidebar-item"><a href="icon-fontawesome.html"
								class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span
									class="hide-menu"> Font Awesome Icons </span></a></li>
						</ul></li>
					<li class="sidebar-item"><a
						class="sidebar-link waves-effect waves-dark sidebar-link"
						href="pages-elements.html" aria-expanded="false"><i
							class="mdi mdi-pencil"></i><span class="hide-menu">Elements</span></a></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-move-resize-variant"></i><span class="hide-menu">Addons
						</span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="index2.html"
								class="sidebar-link"><i class="mdi mdi-view-dashboard"></i><span
									class="hide-menu"> Dashboard-2 </span></a></li>
							<li class="sidebar-item"><a href="pages-gallery.html"
								class="sidebar-link"><i class="mdi mdi-multiplication-box"></i><span
									class="hide-menu"> Gallery </span></a></li>
							<li class="sidebar-item"><a href="pages-calendar.html"
								class="sidebar-link"><i class="mdi mdi-calendar-check"></i><span
									class="hide-menu"> Calendar </span></a></li>
							<li class="sidebar-item"><a href="pages-invoice.html"
								class="sidebar-link"><i class="mdi mdi-bulletin-board"></i><span
									class="hide-menu"> Invoice </span></a></li>
							<li class="sidebar-item"><a href="pages-chat.html"
								class="sidebar-link"><i class="mdi mdi-message-outline"></i><span
									class="hide-menu"> Chat Option </span></a></li>
						</ul></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-account-key"></i><span class="hide-menu">Authentication
						</span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="authentication-login.html"
								class="sidebar-link"><i class="mdi mdi-all-inclusive"></i><span
									class="hide-menu"> Login </span></a></li>
							<li class="sidebar-item"><a
								href="authentication-register.html" class="sidebar-link"><i
									class="mdi mdi-all-inclusive"></i><span class="hide-menu">
										Register </span></a></li>
						</ul></li>
					<li class="sidebar-item"><a
						class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false"><i
							class="mdi mdi-alert"></i><span class="hide-menu">Errors </span></a>
						<ul aria-expanded="false" class="collapse  first-level">
							<li class="sidebar-item"><a href="error-403.html"
								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
									class="hide-menu"> Error 403 </span></a></li>
							<li class="sidebar-item"><a href="error-404.html"
								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
									class="hide-menu"> Error 404 </span></a></li>
							<li class="sidebar-item"><a href="error-405.html"
								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
									class="hide-menu"> Error 405 </span></a></li>
							<li class="sidebar-item"><a href="error-500.html"
								class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
									class="hide-menu"> Error 500 </span></a></li>
						</ul></li>
				</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
	</aside>
</body>
</html>