<?php if($responseCode != 0): ?>

<?php if($responseCode > 0): ?>
	<div class="alert alert-danger"><?php echo $responseMessage;?></div>
<?php else : ?>
	<div class="alert alert-warning"><?php echo $responseMessage;?></div>
<?php endif; ?>

	<form method="post" role="form" class="form-horizontal" id="add_command_form">
<?php if(isset($data['v_config']) && $data['v_config']):?>
		<input type="hidden" name="item_len" value="<?php echo count($data['v_config']) ?>" id="item_len"/>
<?php else: ?>
		<input type="hidden" name="item_len" value="0" id="item_len"/>
<?php endif; ?>
		<table id="command" class="table table-bordered">
		    <tr>
		        <td>Group name</td>
		        <td><?php echo $segment[0]?></td>
		        <td>대상 전문 그룹 이름</td>
		    </tr>
		    <tr>
		        <td>New command name</td>
		        <td><input type="text" name="command_name" value="<?php echo isset($data['command_name']) ? $data['command_name'] : ''; ?>" id="command_name" /></td>
		        <td>새 전문 이름(필수)</td>
		    </tr>
		    <tr>
		        <td>접근권한</td>
		        <td>
		        	<select name="ptype" id="ptype">
		        		<option value="public">public</option>
		        		<option value="member">member</option>
		        		<option value="admin">admin</option>
		        	</select>
		        </td>
		        <td>(필수)</td>
		    </tr>
		    <tr>
		        <td>설명</td>
		        <td><input type="text" name="desc" value="<?php echo isset($data['desc']) ? $data['desc'] : ''; ?>" id="desc" /></td>
		        <td>전문에 대한 설명</td>
		    </tr>
		    <tr>
		        <td>기본 Error message</td>
		        <td><input type="text" name="default_errmsg" value="<?php echo $data['default_errmsg'] ? $data['default_errmsg'] : '데이터가 입력 되지 않았습니다.'; ?>" id="default_errmsg" size="80%" /></td>
		        <td></td>
		    </tr>		    
		    <tr>
		        <td>Add form field</td>
		        <td><input type="button" value="Field add" class="btn btn-info" id="addFieldBtn" /></td>
		        <td>폼 필드를 추가 합니다.</td>
		    </tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="Add command" class="btn btn-primary" />
					<a href="/spray/cmd_list/<?php echo $segment[0]?>" class="btn btn-default">Back</a>
				</td>
				<td></td>
			</tr>
		    <tr class="item0">
		        <th>Field name</th>
		        <th>Field Option</th>
		        <th>Action</th>
		    </tr>
<?php if(isset($data['v_config']) && $data['v_config']):?>
<?php $idx = 1; ?> 
<?php foreach($data['v_config'] as $item):?>
<?php $item_name = 'item' . $idx++; ?>
<?php $rules = explode('|', $item['rules'])?>
		    <tr class="<?php echo $item_name; ?>">
		        <td><input type="text" name="<?php echo $item_name; ?>" value="<?php echo $item['field']; ?>" /></td>
		        <td>
		        	<input type="checkbox" value="required" name="<?php echo $item_name; ?>_opt1" <?php echo in_array('required', $rules) ? 'checked="checked"' : ''?> /> required :: 
					<input type="checkbox" value="trim" name="<?php echo $item_name; ?>_opt2" <?php echo in_array('trim', $rules) ? 'checked="checked"' : ''?> /> trim :: 
					<input type="checkbox" value="valid_email" name="<?php echo $item_name; ?>_opt3" <?php echo in_array('valid_email', $rules) ? 'checked="checked"' : ''?> /> email :: 
					<input type="checkbox" value="xss_clean" name="<?php echo $item_name; ?>_opt4" <?php echo in_array('xss_clean', $rules) ? 'checked="checked"' : ''?> /> xss_clean<br/>
					Error message : <input type="input" name="<?php echo $item_name; ?>_errmsg" size="60%" value="<?php echo $item['err_msg']; ?>" />
				</td>
		        <td>
		        	<button class="delBtn" type="button">삭제</button>
		        </td>
		    </tr>
<?php endforeach; ?>
<?php endif; ?>		    
		</table>
	</form>	
	<div style="display:none">
		<table id="field_form">
		    <tr class="itemx">
		        <td><input type="text" name="itemx" /></td>
		        <td>
		        	<input type="checkbox" value="required" name="itemx_opt1" checked="checked" /> required :: 
					<input type="checkbox" value="trim" name="itemx_opt2" checked="checked" /> trim :: 
					<input type="checkbox" value="valid_email" name="itemx_opt3" /> email :: 
					<input type="checkbox" value="xss_clean" name="itemx_opt4" checked="checked" /> xss_clean<br/>
					Error message : <input type="input" name="itemx_errmsg" size="60%" />
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
            		return confirm('새로운 전문을 만들까요?');
            	}
            });
		});
	</script>
<?php else: ?>
<script>
	document.location.replace('/spray/cmd_list/<?php echo isset($segment[0]) ? $segment[0] : ''?>');
</script>
<?php endif; ?>	