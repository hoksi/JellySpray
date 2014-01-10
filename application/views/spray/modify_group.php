<?php if($responseCode != 0): ?>

<?php if($responseCode > 0): ?>
	<div class="alert alert-danger"><?php echo $responseMessage;?></div>
<?php else : ?>
	<div class="alert alert-warning"><?php echo $responseMessage;?></div>
<?php endif; ?>

	<form method="post" role="form" class="form-horizontal">
	<input type="hidden" name="gid" value="<?php echo isset($data['gid']) ? $data['gid'] : ''; ?>" />
	<input type="hidden" name="group_name" value="<?php echo isset($data['group_name']) ? $data['group_name'] : ''; ?>" />
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
		        <td><?php echo isset($data['group_name']) ? $data['group_name'] : ''; ?></td>
		        <td></td>
		    </tr>
		    <tr>
		        <td>접근권한</td>
		        <td>
		        	<select name="ptype" id="ptype">
		        		<option value="public">public</option>
		        		<option value="member">member</option>
		        		<option value="admin">admin</option>
		        	</select>
		        </td>
		        <td>(필수)</td>
		    </tr>
		    <tr>
		        <td>설명</td>
		        <td><input type="text" name="desc" value="<?php echo isset($data['desc']) ? $data['desc'] : ''; ?>" id="desc" /></td>
		        <td>그룹에 대한 설명을 적습니다.</td>
		    </tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="수정" class="btn btn-primary" />
					<a href="/spray/cmd_list" class="btn btn-default">Back</a>
					
				</td>
				<td></td>
			</tr>
		</table>
	</form>
	<script>
		$('#ptype').val('<?php echo $data['ptype']?>');
	</script>
<?php else: ?>
	<script>
		document.location.replace('/spray/cmd_list');
	</script>
<?php endif; ?>	