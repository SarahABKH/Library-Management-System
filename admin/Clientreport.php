<?php 

//require_once 'core.php';
require_once 'includes/config.php';
	
	$sql = "SELECT user_.U_NAME,book.title,book.b_isbn,book_lending.date_issue,book_lending.date_return,book_lending.id as rid from book_lending join user_ on user_.U_ID=book_lending.u_id join book on book.b_isbn=book_lending.b_isbn order by book_lending.id desc";
	$query = $dbh -> prepare($sql);
	$query->execute();
	$results=$query->fetchAll(PDO::FETCH_OBJ);

	$table = '
	<table border="1" cellspacing="0" cellpadding="0" style="width:100%;">
		<tr>
			<th>Student Name</th>
			<th>Book Name</th>
			<th>ISBN Number</th>
			<th>Issued Date</th>
			<th>Return Date</th>
		</tr>

		<tr>';
		$cnt=1;
		if($query->rowCount() > 0)
		{
		foreach($results as $result)
		{  
			//echo"<script>alert('".$result->FullName."')</script>";
			$table .= '<tr>
				<td><center>'.$result->U_NAME.'</center></td>
				<td><center>'.$result->title.'</center></td>
				<td><center>'.$result->b_isbn.'</center></td>
				<td><center>'.$result->date_issue.'</center></td>
				<td><center>'.$result->date_return.'</center></td>
			</tr>';	
		}
		}
		$table .= '
		</tr>		
	</table>
	<button onClick="window.print()">Print this page</button>
	';	

	echo $table;



?>