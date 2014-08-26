<ul>
	<li><a href="add_subject.php">Add subject</a></li>
<?php

	$host = "localhost";
	$dbname = "slutprojekt";
	$username = "slutprojekt";
	$password = "123";
	$dsn = "mysql:host=$host;dbname=$dbname";
	$attr = array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC);
	$pdo = new PDO($dsn, $username, $password, $attr);
	
	
	// add new subject from form
	if(!empty($_POST)
	{
		$_POST = null;
		$subject_id = filter_input(INPUT_POST, 'subject_id', FILTER_VALIDATE_INT);
	}
	
	foreach($pdo->query("SELECT * FROM subjects ORDER BY name") as $row)
	{
		echo "<li><a href=\"summaries.php?subject_id{$row['id']}\">{$row['name']}</a></li>";
	}
?>
</ul>