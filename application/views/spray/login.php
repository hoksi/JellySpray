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
		        <td>Email</td>
		        <td><input type="text" name="email" value="" id="email" /></td>
		        <td>관리자 Email</td>
		    </tr>
		    <tr>
		        <td>password</td>
		        <td><input type="text" name="passwd" value="" id="passwd" /></td>
		        <td>관리자암호</td>
		    </tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="Login" />
					<input type="reset" />
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