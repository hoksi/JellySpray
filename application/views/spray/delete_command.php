<script>
<?php if($responseCode != 0): ?>
	alert('전문 삭제 실패');
<?php endif; ?>
	document.location.replace('/spray/cmd_list/<?php echo $segment[0];?>');
</script>
	