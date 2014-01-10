<p align="right">
	<a class="btn btn-primary" href="<?php echo $base_url?>/add_group">Add group</a>
	<a class="btn btn-default" href="">테스트용 세션키 설정</a>
</p>

<table class="table table-bordered table-hover">
<thead>
	<tr>
		<th>Group</th>
		<th>Code</th>
		<th>API</th>
		<th>Perm</th>
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
		<td><?php // echo $group['ptype']; ?></td>
		<td><?php echo $group['desc']; ?></td>
		<td>
			<a class="btn btn-link" onclick="modify_group('<?php echo $group['name']?>')">수정</a>
			<a class="btn btn-link" onclick="delete_group('<?php echo $group['name']?>')">삭제</a>
	<?php if($group['name'] == $segment[0]):?>
			<a class="btn btn-default" onclick="add_command('<?php echo $group['name']?>')">전문추가</a>
	<?php endif ?>
		</td>
	</tr>
	<?php if(isset($group['command']) && !empty($group['command'])):?>
		<?php foreach($group['command'] as $cmd):?>
	<tr class="active">
		<td></td>
		<td><a class="btn btn-default" href="/<?php echo $group['name']?>/<?php echo $cmd['name']; ?>/test/<?php echo $cmd['ptype'] != 'guest' ? $this->bu_session['test_session_key'] : ''; ?>" target="_blank"><?php echo $cmd['name']; ?></a></td>
		<td><?php echo base_url($group['name'] . '/' . $cmd['name']); ?>/json<?php echo $cmd['ptype'] != 'guest' ? '/{session_key}' : ''; ?></td>
		<td><?php echo $cmd['ptype']; ?></td>
		<td><?php echo $cmd['desc']; ?></td>
		<td><a class="btn btn-link" onclick="delete_command('<?php echo $group['name']?>', '<?php echo $cmd['name']?>')">삭제</a></td>
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

	function modify_group(group_name)
	{
		if(confirm('[' + group_name + '] 그룹을 수정 하시겠습니까?')) {
			document.location.href = '<?php echo $base_url?>/modify_group/' + group_name;
		}
	}

	function add_command(group_name)
	{
		document.location.href = '<?php echo $base_url?>/add_command/' + group_name;
	}


	function delete_command(group_name, command_name)
	{
		if(confirm('[' + group_name + '/' + command_name + '] 전문을 삭제 하시겠습니까?')) {
			document.location.href = '<?php echo $base_url?>/delete_command/' + group_name + '/' + command_name;
		}
	}

</script>