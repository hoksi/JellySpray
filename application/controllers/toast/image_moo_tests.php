<?php
class Image_moo_tests extends Toast
{
	private $org_img, $thumb_dir;
	
	function __construct()
	{
		parent::__construct(__FILE__);
		
		$this->load->library('image_moo');
		$this->org_img = 'assets/img/test.jpg';
		$this->thumb_dir = 'assets/img/';
	}

	function test_make_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb.jpg';
		
		$this->image_moo
			 ->load($this->org_img)
			 ->resize(100, 100)
			 ->save($target_file)
			 ->clear();
			 
		$this->_assert_true(file_exists($target_file));			
	}
	
	function test_make_fixed_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb_fix.jpg';

		$this->image_moo
			 ->load($this->org_img)
			 ->resize(100, 100, TRUE)
			 ->save($target_file)
			 ->clear();
			 
		$this->_assert_true(file_exists($target_file));		
	}

	function test_make_fixed_crop_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb_fix_crop.jpg';

		$this->image_moo
			 ->load($this->org_img)
			 ->resize_crop(100, 100)
			 ->save($target_file)
			 ->clear();
			 
		$this->_assert_true(file_exists($target_file));		
	}

	function test_make_border_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb_border.jpg';

		$this->image_moo
			 ->load($this->org_img)
			 ->resize(100, 100)
			 ->border(5, "#ffffff")
			 ->border(1, "#000000")
			 ->save($target_file)
			 ->clear();
			 
		$this->_assert_true(file_exists($target_file));		
	}

	function test_make_round_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb_round.jpg';

		$this->image_moo
			 ->load($this->org_img)
			 ->resize_crop(100, 100)
			 ->round(25)
			 ->save($target_file)
			 ->clear();

		$this->_assert_true(file_exists($target_file));
	}

	function test_make_circle_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb_circle.jpg';

		$this->image_moo
			 ->load($this->org_img)
			 ->resize_crop(100, 100)
			 ->round(100 / 2)
			 ->save($target_file)
			 ->clear();

		$this->_assert_true(file_exists($target_file));
	}

	function test_make_3d_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb_3d.jpg';

		$this->image_moo
			 ->load($this->org_img)
			 ->resize_crop(100, 100)
			 ->border_3d(5)
			 ->save($target_file)
			 ->clear();

		$this->_assert_true(file_exists($target_file));
	}

	function test_make_shadow_thumb()
	{
		$target_file = $this->thumb_dir . 'test_thumb_shadow.jpg';

		$this->image_moo
			 ->load($this->org_img)
			 ->resize(100, 100)
			 ->shadow()
			 ->save($target_file)
			 ->clear();

		$this->_assert_true(file_exists($target_file));
	}
}

// End of file example_test.php */
// Location: ./system/application/controllers/test/example_test.php */