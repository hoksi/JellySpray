<!DOCTYPE html>
<html lang="ko">
  <head>
  	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<!-- Optional theme -->
	<link rel="stylesheet" href="/assets/css/bootstrap-theme.min.css">
  </head>
  <body>
    <div class="container">
    	<div class="row">
		  <div class="col-md-12" id="search_container">
		  	<table class="table table-bordered table-hover">
		  	<thead>
		  		<tr>
		  			<th>전문그룹</th>
		  			<th>전문코드</th>
		  			<th>전문</th>
		  			<th><a class="btn btn-primary">새 그룹 만들기</a></th>
		  		</tr>
		  	</thead>
<?php foreach($groups as $group): ?>
<?php 	if(isset($group['command']) && !empty($group['command'])):?>
<?php 		foreach($group['command'] as $cmd):?>
				<tr>
					<td><?php echo $group['name']; ?></td>
					<td><?php echo $cmd; ?></td>
					<td><?php echo base_url($group['name'] . '/' . $cmd); ?>/json</td>
					<td></td>
				</tr>
<?php 		endforeach; ?>
<?php	else: ?>
				<tr>
					<td class="spray_group" data-value="<?php echo $group['name'];?>"><?php echo $group['name'] . '(' . $group['len'] . ')'; ?></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
<?php	endif;?>		
<?php endforeach; ?>
		  	</table>
		  </div>
		</div>
    </div>
    <script src="/assets/js/jquery-2.0.3.min.js"></script>
	<script src="/assets/js/bootstrap.min.js"></script>
	<script>
		$(function(){
			$('.spray_group').click(function(evt) {
				var group_name = $(this).attr('data-value');
				location.replace('/spray/welcome/index/' + group_name);
			});
		});
	</script>
  </body>
</html>