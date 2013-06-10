<form method="get" onsubmit="return go(this)">
<table class="table">
    <thead>
	<tr>
		<td></td>
		<td>
			<input type="submit" value="실 행" />
			<input type="reset" />
		</td>
		<td></td>
	</tr>
</table>
</form>
<form target="_blank" method="post" id="send"></form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
function go(f) {
    var paction = '/spray/<?php echo $command?>/debug/<?=time()?>';
    
    return send(paction);
}

function send(url) {
    $('#send').attr('action', url);
    $('#send').submit();
    
    return false;
}
</script>