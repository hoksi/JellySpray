<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?=$command?> 전문</title>
<link href="/assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/assets/css/bootstrap-responsive.css" rel="stylesheet">
<style type="text/css">
  body { padding-top: 20px; }
</style>
</head>
<body>
	<div class="container">
		<div class="row well">
			<h4><?=$command?> 전문 테스트</h4>
		</div>
		<div class="row well">
			<form method="post" action="/<?php echo $spray_dir?>/<?php echo $command?>/debug/<?php echo $auth?>" id="send" target="_blank" enctype="multipart/form-data">
			<?php $this->load->view($spray_dir . '/' . $command);?>
			</form>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</body>
</html>
