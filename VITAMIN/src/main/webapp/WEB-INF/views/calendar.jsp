<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Custom CSS -->
<link href="./resources/calendar/libs/fullcalendar/dist/fullcalendar.min.css"
	rel="stylesheet">
<link href="./resources/calendar/extra-libs/calendar/calendar.css"
	rel="stylesheet">
<link href="./resources/css/calendar/style.min.css" rel="stylesheet">
<link href="./resources/css/calendar/rateit.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet"/>

<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}
</style>


</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr/>
	<!-- ============================================================== -->
	<!-- Page wrapper  -->
	<!-- ============================================================== -->
	<div class="page-wrapper" >
		<!-- ============================================================== -->
		<!-- Bread crumb and right sidebar toggle -->
		<!-- ============================================================== -->
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-12 d-flex no-block align-items-center">
					<h4 class="page-title">스케줄 관리</h4>
					<div class="ml-auto text-right">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Schedule</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End Bread crumb and right sidebar toggle -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Container fluid  -->
		<!-- ============================================================== -->
		<div class="container-fluid">
			<!-- ============================================================== -->
			<!-- Start Page Content -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="">
							<div class="row">
								<div class="col-lg-3 border-right p-r-0">
									<div class="card-body border-bottom">
										<h4 class="card-title m-t-10">Drag &amp; Drop Event</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<div id="calendar-events" class="">
													<div
														class="calendar-events m-b-20 ui-draggable ui-draggable-handle"
														data-class="bg-info" style="position: relative;">
														<i class="fa fa-circle text-info m-r-10"></i> 운동
													</div>
													<div
														class="calendar-events m-b-20 ui-draggable ui-draggable-handle"
														data-class="bg-success" style="position: relative;">
														<i class="fa fa-circle text-success m-r-10"></i> 식사
													</div>
													<div
														class="calendar-events m-b-20 ui-draggable ui-draggable-handle"
														data-class="bg-danger" style="position: relative;">
														<i class="fa fa-circle text-danger m-r-10"></i> 휴식
													</div>
												</div>
												<!-- checkbox -->
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="drop-remove"> <label
														class="custom-control-label" for="drop-remove">Remove
														after drop</label>
												</div>									
									         </div>
										</div>
									</div>
								</div>
								<!-- 캘린더 핵심 -->
								<div class="col-lg-9" >
									<div class="card-body b-l calender-sidebar">
										<div id="calendar" class="fc fc-unthemed fc-ltr"></div>
									</div>
								</div>
								<!-- 캘린더 핵심 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- BEGIN MODAL -->
		<div class="modal none-border" id="my-event">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">
							<strong>Add Event</strong>
						</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body"></div>
					<!-- 여기에 추가 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary waves-effect"
							data-dismiss="modal">Close</button>
						<button type="button"
							class="btn btn-success save-event waves-effect waves-light">Create
							event</button>
						<button type="button"
							class="btn btn-danger delete-event waves-effect waves-light"
							data-dismiss="modal">Delete</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ============================================================== -->
		<!-- End PAge Content -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	
	<!-- ============================================================== -->
	<!-- End Page wrapper  -->
	<!-- ============================================================== -->
	
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="./resources/calendar/libs/jquery/dist/jquery.min.js"></script>
	<script src="./resources/js/calendar/jquery.ui.touch-punch-improved.js"></script>
	<script src="./resources/js/calendar/jquery-ui.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="./resources/calendar/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="./resources/calendar/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="./resources/calendar/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="./resources/calendar/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="./resources/js/calendar/waves.js"></script>
	<!--Menu sidebar -->
	<script src="./resources/js/calendar/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="./resources/js/calendar/custom.min.js"></script>
	<!-- this page js -->
	<script src="./resources/calendar/libs/moment/min/moment.min.js"></script>
	<script src="./resources/calendar/libs/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="./resources/js/calendar/pages/calendar/cal-init.js"></script>
<%@ include file="../../footer.jsp"%>
</body>
</html>