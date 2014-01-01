<p align="right"><a class="btn btn-primary" href="<?php echo $base_url?>/add_group">Add group</a></p>
<table class="table table-bordered table-hover">
<thead>
	<tr>
		<th>Group</th>
		<th>Code</th>
		<th>API</th>
		<th>Comment</th>
		<th>Action</th>
	</tr>
</thead>
<?php foreach($data['groups'] as $group): ?>
<?php if($group['name'] == $segment[0]):?>
	<tr class="active">
<?php else:?>
	<tr>
<?php endif ?>
		<td><a class="btn btn-link" href="<?php echo $self;?>/<?php echo $group['name']?>"><?php echo $group['name'] . '(' . $group['len'] . ')'; ?></a></td>
		<td></td>
		<td></td>
		<td></td>
		<td>
<?php if($group['name'] == $segment[0]):?>
			<a class="btn btn-link" onclick="add_command('<?php echo $group['name']?>')">전문추가</a>
<?php endif ?>			
			<a class="btn btn-link" onclick="rename_group('<?php echo $group['name']?>')">이름변경</a>
			<a class="btn btn-link" onclick="delete_group('<?php echo $group['name']?>')">삭제</a>
		</td>
	</tr>
	<?php if(isset($group['command']) && !empty($group['command'])):?>
		<?php foreach($group['command'] as $cmd):?>
	<tr class="active">
		<td></td>
		<td><a class="btn btn-default" href="/<?php echo $group['name']?>/<?php echo $cmd; ?>/test" target="_blank"><?php echo $cmd; ?></a></td>
		<td><?php echo base_url($group['name'] . '/' . $cmd); ?>/json</td>
		<td></td>
		<td></td>
	</tr>
		<?php endforeach; ?>
	<?php endif; ?>
<?php endforeach; ?>
</table>
<script>
	function delete_group(group_name)
	{
		if(confirm('[' + group_name + '] 그룹을 삭제 하시겠습니까?')) {
			document.location.href = '<?php echo $base_url?>/delete_group/' + group_name;
		}
	}

	function rename_group(group_name)
	{
		if(confirm('[' + group_name + '] 그룹명을 변경 하시겠습니까?')) {
			document.location.href = '<?php echo $base_url?>/rename_group/' + group_name;
		}
	}

	function add_command(group_name)
	{
		document.location.href = '<?php echo $base_url?>/add_command/' + group_name;
	}
</script>