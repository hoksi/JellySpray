<?php if($responseCode != 0): ?>

<?php if($responseCode > 0): ?>
	<div class="alert alert-danger"><?php echo $responseMessage;?></div>
<?php else : ?>
	<div class="alert alert-warning"><?php echo $responseMessage;?></div>
<?php endif; ?>


	<form method="post" role="form" class="form-horizontal">
		<table class="table table-bordered">
		    <thead>
		    <tr>
		        <th class="span2">Field</th>
		        <th></th>
		        <th></th>
		    </tr>
		    </thead>
		    <tr>
		        <td>Group name</td>
		        <td><input type="text" name="group_name" value="" id="group_name" /></td>
		        <td>전문 그룹 이름</td>
		    </tr>
		    <tr>
		        <td>Default model</td>
		        <td><input type="checkbox" name="default_model_create" value="Y" checked="checked"/></td>
		        <td>Default model file을 생성 합니다.</td>
		    </tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="Add" class="btn btn-primary" />
					<a href="/spray/cmd_list" class="btn btn-default">Back</a>
					
				</td>
				<td></td>
			</tr>
		</table>
	</form>	
<?php else: ?>
	<script>
		document.location.replace('/spray/cmd_list');
	</script>
<?php endif; ?>	