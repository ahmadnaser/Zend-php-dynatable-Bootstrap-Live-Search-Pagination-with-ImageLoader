<?php

class ItemController extends Zend_Controller_Action
{


    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

	public function postDispatch()
    {
   
    }
	
	
	
	public function showCategoryItemsAction()
    {
	
	$cat_id=  Zend_Filter::filterStatic($this->_request->getParam("cat_id"), "StripTags");
    $itemModel = new Application_Model_Item();

	$result =  $itemModel->showCatItem($cat_id);

	$a=array();
	$a['item']=$result;

	
	 echo Zend_Json::encode($a);
	}
	
	
	
	public function getItemNameAction()
    {
	
	$item_id=  Zend_Filter::filterStatic($this->_request->getParam("item_id"), "StripTags");
    $itemModel = new Application_Model_Item();
	$result =  $itemModel->getItemName($item_id);
	$a=array();
	$a['name']=$result;
	
	
	echo Zend_Json::encode($a);
	
	}
	

	
	
		public function showAllItemsAction()
    {
	
	
    $itemModel = new Application_Model_Item();
	$result =  $itemModel->showAllItems();

	$a=array();
	$a['item']=$result;

	echo Zend_Json::encode($a);
	
	}
	
	
	public function showItemAction()
    {
	
	$item_id=  Zend_Filter::filterStatic($this->_request->getParam("item_id"), "StripTags");
    $itemModel = new Application_Model_Item();
	$result =  $itemModel->showItem($item_id);

	$a=array();
	$a['item']=$result;

	echo Zend_Json::encode($a);
	
	}
	
	
	
	
	
	
	
	public function testAction()
    {
	$topping=array();
	
	//////// Topping for Pizza
	///Meat, Vegetable, Onion, Green Peppercorn,  Green Olive, Edible Mushroom, Pineapple, Black Olive
	
	$top1=array();
	$top1["name"]="Chease";
    $top1["id"]="1";
	$top1["price"]="4";
	
	$top2=array();
	$top2["name"]="Meat";
    $top2["id"]="2";
	$top2["price"]="4";
	
    $top3=array();
	$top3["name"]="Vegetable";
    $top3["id"]="3";
	$top3["price"]="4";

	$top4=array();
	$top4["name"]="Onion";
    $top4["id"]="4";
	$top4["price"]="4";


	$top5=array();
	$top5["name"]="Green Peppercorn";
    $top5["id"]="5";
	$top5["price"]="4";
	
	
    $topping[]=$top1;
    $topping[]=$top2;
	$topping[]=$top3;
	$topping[]=$top4;
	$topping[]=$top5;
    
	$a=array();
	$a['topping']=$topping;
	
	
	
	$a=Zend_Json::encode($topping);
	echo $a;
	$id=  Zend_Filter::filterStatic($this->_request->getParam("item_id"), "StripTags");
    $item = new Application_Model_Item();

    $row = $item->fetchRow($item->select()->where('id = ?', $id));
		
	   if ($row) {
            $row->topping=$a;
            return true;
        } 
	



	
	}
	
	
	
	
	
	
	
}




