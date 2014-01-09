<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * MY_Model
 * Webis Base Model object
 *
 * @package    class
 * @subpackage 
 * @author     hoksi
 * @link       
 */
class Spray_model extends CI_Model {
    /**
     * Table name
     *
     * @var string
     */
	protected $_tbl = NULL;
    /**
     * Wheres array
     *
     * @var array
     */
	protected $_where = FALSE;
    /**
     * 1페이지당 출력될 라인 수
     *
     * @var int
     */
	protected $_rows_per_page = 20;
    /**
     * 현재 페이지
     *
     * @var int
     */
	protected $_page_num = 1;
    /**
     * 출력할 페이지 수 
     *
     * @var int
     */
	protected $_show=10;
    /**
     * read only db resource
     *
     * @var object
     */
    protected $_rodb;
    /**
     * write / read db resource
     *
     * @var object
     */
    protected $_wrdb;
	
	public $wdb;
	
    /**
     * 생성자
     *
     * @access  public
     * @param   
     * @return  
     */
    public function __construct($master_db = 'single')
    {
        parent::__construct();
        
		if($master_db == 'single') {
			$this->load->database();
			$this->wdb = &$this->db;
		} else {
			$this->load->databse(); // read_only
			$this->wdb = $this->load->database($master_db, TRUE); // read / write
		}
		
        $this->set_db($master_db);
    }
    
    /**
     * DB를 선택 한다.
     *
     * @access  public
     * @param   string $db 'shop' or 'board'
     * @return  
     */
    public function set_db($master_db = 'single')
    {
        if($master_db == 'single') {
            $this->_rodb = &$this->db;
            $this->_wrdb = &$this->wdb;
        } else {
            $this->_rodb = &$this->bdb;
            $this->_wrdb = &$this->wbdb;
        }
    }

    /**
     * 테이블을 설정 한다.
     *
     * @access  public
     * @param   string $tbl
     * @return  object
     */
	public function set_table($tbl)
	{
		$this->_tbl = $tbl;
		
		return $this;
	}
	
    /**
     * Auto pager를 설정 한다.
     *
     * @access  public
     * @param   int $rows_per_page  1페이지 당 출력될 라인 수
     * @param   int show    출력될 페이지 수
     * @return  object
     */
	public function set_page_config($rows_per_page, $show)
	{
		$this->_rows_per_page = $rows_per_page;
		$this->_show = $show;
		
		return $this;
	}
	
    /**
     * 현재 보여지는 페이지 번호
     *
     * @access  public
     * @param   int $page_num
     * @return  object
     */
	public function set_page_num($page_num)
	{
		$this->_page_num = $page_num;
		
		return $this;
	}

    /**
     * insert 나 update 시 사용되는 데이터를 설정 한다.
     *
     * @access  public
     * @param   string $key 수정 또는 입력할 컬럼명
     * @param   string $value   데이타
     * @param   boolean $escape SQL 컬럼 보호 여부
     * @return  object
     */
	public function set_data($key, $value = '', $escape = TRUE)
	{
		$this->_wrdb->set($key, $value, $escape);
		
		return $this;
	}
	
    /**
     * Select 시 사용될 컬럼을 설정한다.
     *
     * @access  public
     * @param   string $select  컬럼명
     * @param   boolean $escape SQL 컬럼 보호 여부
     * @return  object
     */
	public function set_select($select = '*', $escape = NULL)
	{
		$this->_rodb->select($select, $escape);
		
		return $this;
	}
	
    /**
     * 검색 조건을 설정 한다.
     *
     * @access  public
     * @param   string $key 검색 할 컬럼명
     * @param   string $value   검색할 데이터
     * @param   boolean $escape SQL 컬럼 보호 여부
     * @return  object
     */
	public function set_where($key, $value = NULL, $escape = TRUE)
	{
		// Init $this->_where
		$this->_where == FALSE ? ($this->_where = array()) : FALSE;
		$this->_where[] = array('key' => $key, 'value' => $value, 'escape' => $escape);
		
		return $this;
	}

    /**
     * distinct 부분을 설정 한다.
     *
     * @access  public
     * @param   string or array
     * @return  object
     */
	public function set_distinct($val = TRUE)
	{
		$this->_rodb->distinct($val);
		
		return $this;
	}
	
	 /**
     * 검색 limit을 설정 한다.
     *
     * @access  public
     * @param   int $value 리턴 받을 행의 수
     * @param   int $offset 건너띨 행의 수
     * @return  object
     */
	public function set_limit($value, $offset = '')
	{
		$this->_rodb->limit($value, $offset);
		
		return $this;
	}
	
    /**
     * 정렬을 설정 한다.
     *
     * @access  public
     * @param   string $orderby 정렬할 컬럼명
     * @param   string $direction ASC or DESC
     * @return  object
     */
	public function set_order_by($orderby, $direction = '')
	{
		$this->_rodb->order_by($orderby, $direction);
		
		return $this;
	}
	
    /**
     * group by 부분을 설정 한다.
     *
     * @access  public
     * @param   string or array
     * @return  object
     */
	public function set_group_by($by)
	{
		$this->_rodb->group_by($by);
		
		return $this;
	}
	
    /**
     * Having을 설정 한다.
     *
     * @access  public
     * @param   string or array $key
     * @param   string $value
     * @return  boolean $escape
     */
	public function set_having($key, $value = '', $escape = TRUE)
	{
		$this->_rodb->having($key, $value, $escape);
		
		return $this;
	}
		
    /**
     * 검색 조건에 해당하는 전체 데이터를 배열 행태로 반환 한다.
     *
     * @access  public
     * @param   int $limit 기본값 1000
     * @return  array
     */
	public function get_all($limit = 1000)
	{
		if($this->_where != FALSE) {
			$this->_where_($this->_rodb);
		}
		
		if(is_array($limit)) {
			$this->_rodb->limit($limit[0], $limit[1]);			
		} else {
			$this->_rodb->limit($limit);
		}
		
		return $this->_rodb->get($this->_tbl)->result_array();
	}
	
    /**
     * 검색조건에 해당하는 데이터 1개를 배열 행태로 반환 한다.
     *
     * @access  public
     * @param   
     * @return  array
     */
	public function get_one()
	{
		$row = $this->get_all(1);
		return isset($row[0]) ? $row[0] : $row;
	}
	
    /**
     * 검색조건에 해당하는 row 수를 반환 한다.
     *
     * @access  public
     * @param   
     * @return  int
     */
	public function get_count()
	{
		if($this->_where == FALSE) {
			$ret = $this->_rodb->count_all($this->_tbl);
		} else {
			$this->_where_($this->_rodb);
			$ret = $this->_rodb->count_all_results($this->_tbl);
		}
		
		return $ret;
	}
	
    /**
     * 사용자가 입력한 데이터를 테이블에 insert 한다.
     *
     * @access  public
     * @param   array $data
     * @return  int
     */
	public function insert($data = NULL)
	{
		$this->_wrdb->insert($this->_tbl, $data);
		return $this->_wrdb->insert_id();
	}
	
    /**
     * 사용자가 입력한 데이터를 테이블에 update 한다.
     *
     * @access  public
     * @param   array $data
     * @return  int
     */
	public function update($data = NULL)
	{
		if($this->_where != FALSE) {
			$this->_where_($this->_wrdb);
			$this->_wrdb->update($this->_tbl, $data);
			
			return $this->_wrdb->affected_rows();
		} else {
			throw new Exception('All update. First call method set_where()');
		}
	}

    /**
     * 사용자가 입력한 데이터를 테이블에  delete 한다.
     *
     * @access  public
     * @param   
     * @return  int
     */
	public function delete()
	{
		if($this->_where != FALSE) {
			$this->_where_($this->_wrdb);
			$this->_wrdb->delete($this->_tbl);

			return $this->_wrdb->affected_rows();
		} else {
			throw new Exception('All delete. First call method set_where()');
		}
	}

    /**
     * 사용자 Sql을 실행 한다.
     *
     * @access  public
     * @param   string $sql SQL query
     * @param   array $binds An array of binding data
     * @return  mixed
     */
    public function query($sql, $binds = FALSE, $return_object = TRUE)
    {
        return strncmp(strtolower(ltrim($sql)), 'select', 6) === 0 ? $this->_rodb->query($sql, $binds, $return_object) : $this->_wrdb->query($sql, $binds, $return_object);
    }
    
    /**
     * 설정된 pager의 정보를 배열 형태로 반환한다.
     *
     * @access  public
     * @param
     * @return  array
     */
    public function get_page_config()
    {
        return array('rows_per_page' => $this->_rows_per_page, 'show' => $this->_show);
    }
	
    /**
     * pager를 배열로 반환 한다.
     *
     * @access  public
     * @param
     * @return  array
     */
	public function get_page()
	{
		$arr = array();
		
		$total_rows = $this->get_count();
		
		// calculate last page
		$last_page = ceil($total_rows / $this->_rows_per_page);
		// make sure we are within limits
		$this->_page_num = (int) $this->_page_num;
		if ($this->_page_num < 1)
		{
		   $this->_page_num = 1;
		}
		elseif ($this->_page_num > $last_page)
		{
		   $this->_page_num = $last_page;
		}
		$upto = ($this->_page_num - 1) * $this->_rows_per_page;
		$arr['vno'] = $total_rows - ($upto);
		$arr['limit'] = array($this->_rows_per_page, $upto);
		$arr['current'] = $this->_page_num;
		if ($this->_page_num == 1)
			$arr['previous'] = $this->_page_num;
		else
			$arr['previous'] = $this->_page_num - 1;
		if ($this->_page_num == $last_page)
			$arr['next'] = $last_page;
		else
			$arr['next'] = $this->_page_num + 1;
		$arr['last'] = $last_page;
		$arr['info'] = 'Page ('.$this->_page_num.' of '.$last_page.')';
		$arr['pages'] = $this->get_surrounding_pages($this->_page_num, $last_page, $arr['next'], $this->_show);
		
		return $arr;
	}

    /**
     * 페이지 번호를 생성 한다.
     *
     * @access  private
     * @param   int $page_num   현재페이지 
     * @param   int $last_page  마지막페이지
     * @param   int $next       다음 페이지
     * @param   int $show       출력할 페이지 수
     * @return  array
     */
	private function get_surrounding_pages($page_num, $last_page, $next, $show)
	{
		$arr = array();

		// at first
		if ($page_num == 1)
		{
			// case of 1 page only
			if ($next == $page_num) return array(1);
			for ($i = 0; $i < $show; $i++)
			{
				if ($i == $last_page) break;
				array_push($arr, $i + 1);
			}
			return $arr;
		}
		// at last
		if ($page_num == $last_page)
		{
			$start = $last_page - $show;
			if ($start < 1) $start = 0;
			for ($i = $start; $i < $last_page; $i++)
			{
				array_push($arr, $i + 1);
			}
			return $arr;
		}
		// at middle
		$start = $page_num - $show;
		if ($start < 1) $start = 0;
		for ($i = $start; $i < $page_num; $i++)
		{
			array_push($arr, $i + 1);
		}
		for ($i = ($page_num + 1); $i < ($page_num + $show); $i++)
		{
			if ($i == ($last_page + 1)) break;
			array_push($arr, $i);
		}
		return $arr;
	}

    /**
     * 선택한 DB 객체에 검색 조건을 전달 하고 _where array 를 리셋 한다.
     *
     * @access  public
     * @param   string $db
     * @return  
     */
	private function _where_($db)
	{
		foreach($this->_where as $where) {
			$db->where($where['key'], $where['value'], $where['escape']);
		}
		
		$this->_where = FALSE;
	}
}
/* End of file WB_Model.php */
/* Location: /class//WB_Model.php */