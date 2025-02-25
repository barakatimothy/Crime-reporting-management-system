
<style>
	.collapse a{
		text-indent:10px;
	}
	nav#sidebar{
		/*background: url(assets/uploads/<?php echo $_SESSION['system']['cover_img'] ?>) !important*/
	}
</style>

<nav id="sidebar" class='mx-lt-5 bg-dark' >
		
		<div class="sidebar-list">
				<a href="index.php?page=home" class="nav-item nav-home"><h5><b> Dashboard</h5></b></a>
				<a href="index.php?page=complaints" class="nav-item nav-complaints"><span class='icon-field'><i class="fa fa-list-alt "></i></span> Crimes Reported</a>
				<br>
				<div class="mx-2 text-white"><h5><b>Master List</h5></b></div>
				<br>
				<a href="index.php?page=complainants" class="nav-item nav-complainants"><span class='icon-field'><i class="fa fa-user-secret "></i></span> Victims</a>
				<a href="index.php?page=responders" class="nav-item nav-responders"><span class='icon-field'><i class="fa fa-user-shield "></i></span> Responders</a>
				<a href="index.php?page=stations" class="nav-item nav-stations"><span class='icon-field'><i class="fa fa-building "></i></span> Stations</a>
				<br>
				<div class="mx-2 text-white"><h5><b>Report</h5></b></div>
				<br>
				<a href="index.php?page=complaints_report" class="nav-item nav-complaints_report"><span class='icon-field'><i class="fa fa-th-list"></i></span> Complaints Report</a>
				<br>
				<div class="mx-2 text-white"><h5><b>Systems</h5></b></div>
				<br>
				<?php if($_SESSION['login_type'] == 1): ?>
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users "></i></span> Users</a>
				<a href="index.php?page=site_settings" class="nav-item nav-site_settings"><span class='icon-field'><i class="fa fa-cogs"></i></span> System Settings</a>
			<?php endif; ?>
		</div>

</nav>
<script>
	$('.nav_collapse').click(function(){
		console.log($(this).attr('href'))
		$($(this).attr('href')).collapse()
	})
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>
