<?php if($responseCode != 0): ?>
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
		        <td>Orgin group name</td>
		        <td><?php echo $segment[0]?></td>
		        <td>대상 전문 그룹 이름</td>
		    </tr>
		    <tr>
		        <td>New group name</td>
		        <td><input type="text" name="group_name" value="<?php echo $data['group_name']?>" id="group_name" /></td>
		        <td>새 전문 그룹 이름</td>
		    </tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="Rename" />
				</td>
				<td></td>
			</tr>
		</table>
	</form>	
	<div class="alert alert-warning"><?php echo $responseMessage;?></div>
<?php else: ?>
<script>
	document.location.replace('/spray/cmd_list');
</script>
<?php endif; ?>	