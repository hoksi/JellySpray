<form method="post" onsubmit="return go(this)" id="send" target="_blank">
<table class="table">
    <thead>
    <tr>
        <th class="span2">Field</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tr>
        <td>nickname</td>
        <td><input type="text" name="nickname" value="" id="nickname" /></td>
        <td>Nickname</td>
    </tr>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
function go(f) {
    var paction = '/spray/<?php echo $command?>/debug/<?=$this->_auth_key?>';

    return send(paction);
}

function send(url) {
    $('#send').attr('action', url);
    $('#send').submit();

    return false;
}
</script>