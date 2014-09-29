<?php

class Application_Model_Item extends Zend_Db_Table_Abstract
{

protected $_name = 'item';

 public function createItem($iname,$cost,$topping,$size,$cat_id) {

        $row = $this->createRow();
        $row->name=$iname;
		$row->cost=$cost;
		$row->topping=$topping;
		$row->size=$size;
		$row->category_id=$cat_id;
		
        $row->save();
        $id = $this->_db->lastInsertId();
        return $id;
    }


	public function showCatItem($cat_id) {
    $items = new Application_Model_Item();
	$rowset = $items->fetchAll($items->select()
	->where('category_id = ?', $cat_id)
	->where('name = ?', 'Cola')
	);
    $rowArray = $rowset->toArray();
    return $rowArray;
	
    }

	
	
	public function showItem($item_id) {
    $items = new Application_Model_Item();
	$rowset = $items->fetchAll($items->select()->where('id = ?', $item_id));
    $rowArray = $rowset->toArray();
    return  $rowArray;
	
    }
	
	
	public function getItemName($item_id) {
    $cus   = new Application_Model_Item();
       $row = $cus->fetchRow($cus->select()->where('id = ?', $item_id));
	   if ($row){ 
       $name=$row->name;
       	   }
		   return $name;
}
	
	
	
		public function showAllItems() {
    $items = new Application_Model_Item();
	$resultset = $items->fetchAll();
    $resultArray = $resultset->toArray();
    return $resultArray;
	
    }
	
	
}

