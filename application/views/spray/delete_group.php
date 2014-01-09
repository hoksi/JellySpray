<script>
<?php if($responseCode != 0): ?>
alert('<?php echo $responseMessage; ?>');
<?php endif; ?>
document.location.replace('/spray/cmd_list/<?php echo $segment[0]?>');
</script>
	