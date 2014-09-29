<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
	
	
	
	
	$queries=$this->_request->getParam("queries");
	//print_r($queries);
	//exit();
	$offset=  Zend_Filter::filterStatic($this->_request->getParam("offset"), "StripTags");//sta
	$perPage=  Zend_Filter::filterStatic($this->_request->getParam("perPage"), "StripTags");//fixed
	$sorts=  $this->_request->getParam("sorts");
	 $searchkind ="id"; 
	 $searchtype="";
	 
	 	$pageLimit=$offset;
		
		$exported_query="";
		
		

		
		if(isset($queries))
		{
		end($queries);
$lastKey = key($queries);
		$exported_query=$exported_query." WHERE ";
		 foreach($queries as $key=>$value) 
		 {
		 if($key=="search")//start xx1
		 {
		 //$exported_query=$exported_query." id like '%".$value."%' OR ";
		 		 $exported_query=$exported_query." rank like '%".$value."%' OR ";
				   $exported_query=$exported_query." name like '%".$value."%' OR ";
				 		 		 $exported_query=$exported_query." price like '%".$value."%'  ";
				 //  $exported_query=$exported_query." year like '%".$value."%'  ";  

		 }
		 else{
		 
		 if($key!=$lastKey){
		$exported_query=$exported_query." ".$key." = ".$value." OR ";
		}
		else
		{
			$exported_query=$exported_query." ".$key." = ".$value;
		}
		}//end xx1
		 
		 }
		}
		
		
	 
	if(isset($sorts)){
	
	 $searchkind = array_keys($sorts)[0];
	 
	 if($sorts[ $searchkind]=="-1")
	 {
	$searchtype="DESC";
	 }
	 
	 	
		
		
	 
	 }
	
	 
	 $sql='SELECT * FROM places '.$exported_query.' order by '. $searchkind.' '.$searchtype.' limit '.$pageLimit.','.$perPage;
	 
	 
	
	
        	  $this->_helper->viewRenderer->setNoRender(true);
			  
			  
	 	$db = Zend_Db::factory('Pdo_Mysql', array(
    			'host'     => 'localhost',
    			'username' => 'root',
    			'password' => '',
    			'dbname'   => 'ans_dynatable'
    	));

		 
    	$stmt = $db->query($sql);
		$sql2='SELECT * FROM places ';
		$All_Record = $db->query($sql2);
		$dbA=array();
		while ($row = $All_Record->fetch()) {
    		
    		$dbA[]=$row;
    	
    	}
    	
    	$TotalRecord=count($dbA);
    			//'SELECT * FROM user WHERE user_id = ? AND fb_first_name = ?',
    			//array('7', 'Ahmad')
    	
    	 
    		//generate 1000 record db
$db=array();	
    	while ($row = $stmt->fetch()) {
    		
    		$db[]=$row;
    	
    	}
    	
    	$numberOfRecord=count($db);

	$a=array();
	
	$a['records']=$db;//showAllItems();
		//$a['records']=$page;//showAllItems();
		  $a["queryRecordCount"]= $TotalRecord;
  $a["totalRecordCount"]= $numberOfRecord;
	$a=Zend_Json::encode($a);
	 echo $a;
    	
    	
    	
    	
    	/* ::2 (fetching all the data as an array at one)
    	 * 
    	 * fetch array
    	 * 
    	 * */
    	
        //$rows = $stmt->fetchAll();	 
    	//echo $rows[0]['fb_email'];
    	 
    	
    	
    	/* ::3 (fetching data as an array of object)
    	 * 
    	 * fetch array of object
    	 * 
    	 * */
    	
    	//$obj = $stmt->fetchObject();
     	//echo $obj->fb_website;
    	
			  
			  
			  
			  
			 /* 
			  
			  
			  
			  
			  
			  
$sorts=  $this->_request->getParam("sorts");	

print_r( $sorts);

$page=  Zend_Filter::filterStatic($this->_request->getParam("page"), "StripTags");	
$perPage=  Zend_Filter::filterStatic($this->_request->getParam("perPage"), "StripTags");	
$offset=  Zend_Filter::filterStatic($this->_request->getParam("offset"), "StripTags");	
//echo $page." ".$perPage." ".$offset."<br />";
	
	
	
	
	//generate 1000 record db
$db=array();	
for($i=0;$i<1000;$i++)	//for($i=0;$i<100;$i++)	
{
$v=array();
$v['rank']="I am record one".($i+1);
$v['us-$']=($i+200);
$db[]=$v;
}


  //get number of pages
$numberOfRecord=count($db);
$numberOfPages=$numberOfRecord/$perPage;


 //put data In pages
 $page=array();
	for($i=$offset;$i<($offset+$perPage);$i++)
	{
	$page[]=$db[$i];
	}
	
	
	
	$a=array();
	
	$a['records']=$db;//showAllItems();
		//$a['records']=$page;//showAllItems();
		  $a["queryRecordCount"]= $perPage;
  $a["totalRecordCount"]= $numberOfRecord;
	$a=Zend_Json::encode($a);
	 echo $a;
   
}
	
	   public function getAllItemsAction()
	   {
	  $this->_helper->viewRenderer->setNoRender(true);
	
$id=  Zend_Filter::filterStatic($this->_request->getParam("id"), "StripTags");	
	   
	 $item = new Application_Model_Item();
	
	$a=array();
	
	$a['items']=$item->showCatItem($id);//showAllItems();
	$a=Zend_Json::encode($a);
	 echo $a;
	 
	 
	 */
	 
	   }
	
	
	
}
