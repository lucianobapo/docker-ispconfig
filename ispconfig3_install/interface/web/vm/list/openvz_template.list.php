<?php

/*
	Datatypes:
	- INTEGER
	- DOUBLE
	- CURRENCY
	- VARCHAR
	- TEXT
	- DATE
*/



// Name of the list
$liste["name"]     = "openvz_template";

// Database table
$liste["table"]    = "openvz_template";

// Index index field of the database table
$liste["table_idx"]   = "template_id";

// Search Field Prefix
$liste["search_prefix"]  = "search_";

// Records per page
$liste["records_per_page"]  = 15;

// Script File of the list
$liste["file"]    = "openvz_template_list.php";

// Script file of the edit form
$liste["edit_file"]   = "openvz_template_edit.php";

// Script File of the delete script
$liste["delete_file"]  = "openvz_template_del.php";

// Paging Template
$liste["paging_tpl"]  = "templates/paging.tpl.htm";

// Enable authe
$liste["auth"]    = "yes";


/*****************************************************
* Suchfelder
*****************************************************/

$liste["item"][] = array( 'field'  => "active",
	'datatype' => "VARCHAR",
	'formtype' => "SELECT",
	'op'  => "=",
	'prefix' => "",
	'suffix' => "",
	'width'  => "",
	'value'  => array('y' => "<div id=\"ir-Yes\" class=\"swap\"><span>".$app->lng('yes_txt')."</span></div>", 'n' => "<div class=\"swap\" id=\"ir-No\"><span>".$app->lng('no_txt')."</span></div>"));


$liste["item"][] = array( 'field'  => "template_name",
	'datatype' => "VARCHAR",
	'formtype' => "TEXT",
	'op'  => "like",
	'prefix' => "%",
	'suffix' => "%",
	'width'  => "",
	'value'  => "");


?>