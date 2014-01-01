<?php if($responseCode != 0): ?>
	<form method="post" role="form" class="form-horizontal" id="add_command_form">
		<input type="hidden" name="item_len" value="0" id="item_len"/>
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
					<input type="submit" value="Add" class="btn btn-primary" />
					<input type="button" value="Field add" class="btn btn-info" id="addFieldBtn" />
					<a href="/spray/cmd_list/<?php echo $segment[0]?>" class="btn btn-default">Back</a>
				</td>
				<td></td>
			</tr>
		    <tr class="item0">
		        <th>Field name</th>
		        <th>Field Option</th>
		        <th>Action</th>
		    </tr>
		</table>
	</form>	
	<div class="alert alert-warning"><?php echo $responseMessage;?></div>
	<div style="display:none">
		<table id="field_form">
		    <tr class="itemx">
		        <td><input type="text" name="itemx"></td>
		        <td>
		        	<input type="checkbox" value="required" name="itemx_opt1" checked="checked" /> required :: 
					<input type="checkbox" value="trim" name="itemx_opt2" checked="checked" /> trim :: 
					<input type="checkbox" value="valid_email" name="itemx_opt3" /> email :: 
					<input type="checkbox" value="xss_clean" name="itemx_opt4" checked="checked" /> xss_clean<br/>
					Error message : <input type="input" name="itemx_errmsg" size="30" />
				</td>
		        <td>
		        	<button class="delBtn" type="button">삭제</button>
		        </td>
		    </tr>
		</table>
	</div>
	<script>
		$(function(){
			$("#addFieldBtn").click(function(){
                var lastItemNo = $("#command tr:last").attr("class").replace("item", "");
                var newitem = $("#field_form tr:eq(0)").clone();
                var newitem_name = "item"+(parseInt(lastItemNo)+1);
                
                newitem.removeClass();
                newitem.find("input").each(function(data) {
                	var new_name = $(this).attr('name');
                	if(new_name) {
	                	$(this).attr('name', new_name.replace("itemx", newitem_name));
                	}
                });
                newitem.addClass(newitem_name);
 
                $("#command").append(newitem);
                $("#item_len").val(parseInt(lastItemNo)+1);
            });
            
			$("#command").on("click", ".delBtn", function(){
                var currentItemNo = $(this).parent().parent().attr("class").replace("item", "");
                var lastItemNo = $("#command tr:last").attr("class").replace("item", "");
                $(this).parent().parent().remove();
                for(var i=currentItemNo + 1; i < lastItemNo; i++) {
                	var itemName = "item" + i;
                }
            });
            
            $('#add_command_form').submit(function() {
            	if($('#command_name').val() == '') {
            		alert('Command 이름을 입력해 주십시오.');
            		$('#command_name').focus();
            		return false;
            	} else {
            		return true;
            	}
            });
		});
	</script>
<?php else: ?>
<script>
	document.location.replace('/spray/cmd_list/<?php echo isset($segment[0]) ? $segment[0] : ''?>');
</script>
<?php endif; ?>	