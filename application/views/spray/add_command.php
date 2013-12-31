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
					<input type="button" value="Field add" id="addFieldBtn" />
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
		        	<input type="checkbox" value="required" name="itemx_required" /> required :: 
					<input type="checkbox" value="trim" name="itemx_trim" /> trim :: 
					<input type="checkbox" value="valid_email" name="itemx_email" /> email :: 
					<input type="checkbox" value="xss_clean" name="itemx_xss" /> xss_clean ::
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
                		new_name = new_name.replace("itemx", newitem_name)
	                	if(new_name == newitem_name) {
	                		$(this).val('');
	                	}
	                	$(this).attr('name', new_name).attr('checked', false);
                	}
                });
                newitem.addClass(newitem_name);
 
                $("#command").append(newitem);
            });
            
			$("#command").on("click", ".delBtn", function(){
                $(this).parent().parent().remove();
            });
		});
	</script>
<?php else: ?>
<script>
	document.location.replace('/spray/cmd_list/<?php echo isset($segment[0]) ? $segment[0] : ''?>');
</script>
<?php endif; ?>	