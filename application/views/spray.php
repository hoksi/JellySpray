<?php $this->load->helper('xml')?>
<?php $this->load->helper('array2xml')?>
<?php if($_debug === TRUE):?>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title><?php echo $responseMessage;?></title>
	<link href="/assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/assets/css/bootstrap-responsive.css" rel="stylesheet">
	<style type="text/css">
	  body { padding-top: 20px; }
	</style>
</head>
<body>
	<div class="container">
		<div class="row well">
			<h3>실행결과</h3>
			<xmp>
<?php endif;?>
<response>
	<responseCode><?php echo $responseCode;?></responseCode>
<?php if($_debug === TRUE):?>
	<responseMessage><?php echo $responseMessage;?></responseMessage>
<?php endif;?>
	<transactionDate><?php echo $transactionDate?></transactionDate>
<?php if(!empty($data)):?>
	<data>
<?php array2xml($data, 2);?>
	</data>
<?php endif;?>
</response>
<?php if($_debug === TRUE):?>
			</xmp>
		</div>
	</div>
</body>
</html>
<?php endif;?>