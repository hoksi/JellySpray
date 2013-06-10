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
        <td>email</td>
        <td><input type="text" name="email" value="" id="email" /></td>
        <td>사용자 Email</td>
    </tr>
    <tr>
        <td>nickname</td>
        <td><input type="text" name="nickname" value="" id="nickname" /></td>
        <td>Nickname</td>
    </tr>
    <tr>
        <td>password</td>
        <td><input type="text" name="password" value="" id="next" /></td>
        <td>사용자암호</td>
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
    var next = $('#next').val();
    var paction = '/spray/<?php echo $command?>/debug/';
    
    return send(paction);
}

function send(url) {
    $('#send').attr('action', url);
    $('#send').submit();
    
    return false;
}
</script>