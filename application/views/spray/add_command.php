<?php if($responseCode != 0): ?>
	<form method="post" role="form" class="form-horizontal">
		<table id="command" class="table table-bordered">
		    <tr>
		        <td>Group name</td>
		        <td><?php echo $segment[0]?></td>
		        <td>대상 전문 그룹 이름</td>
		    </tr>
		    <tr>
		        <td>New command name</td>
		        <td><input type="text" name="command_name" value="<?php echo $data['command_name']?>" id="command_name" /></td>
		        <td>새 전문 이름</td>
		    </tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="Add" />
				</td>
				<td></td>
			</tr>
		    <tr>
		        <th>Field name</th>
		        <th>Field Option</th>
		        <th>Action</th>
		    </tr>
		    <tr class="item1">
		        <td><input type="text" name="field_name[item1]"></td>
		        <td>
		        	<input type="checkbox" checked="checked" value="required" name="option[item1][]" /> required :: 
					<input type="checkbox" checked="checked" value="trim" name="rules[password][]" /> trim :: 
					<input type="checkbox" value="valid_email" name="rules[password][]" /> email :: 
					<input type="checkbox" checked="checked" value="xss_clean" name="rules[password][]" /> xss_clean ::
				</td>
		        <th></th>
		    </tr>
		</table>
	</form>	
	<div class="alert alert-warning"><?php echo $responseMessage;?></div>
<?php else: ?>
<script>
	document.location.replace('/spray/cmd_list/<?php echo isset($segment[0]) ? $segment[0] : ''?>');
</script>
<?php endif; ?>	