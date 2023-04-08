<?php
session_start();
error_reporting(1);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['update']))
{
$bookname=$_POST['bookname'];
$category=$_POST['category'];
$author=$_POST['author'];
$publisher=$_POST['publisher'];
$pub_date=$_POST['pub_date'];
$isbn=intval($_GET['bookid']);
$copies=$_POST['copies'];
$edition=$_POST['edition'];
$sql="update book set Title=:bookname,Category=:category,Author_name=:author,pub_year=:pub_date,edition=:edition,Copies=:copies,pub_name=:publisher where b_isbn=:isbn";
$query = $dbh->prepare($sql);
$query->bindParam(':bookname',$bookname,PDO::PARAM_STR);
$query->bindParam(':category',$category,PDO::PARAM_STR);
$query->bindParam(':author',$author,PDO::PARAM_STR);
$query->bindParam(':isbn',$isbn,PDO::PARAM_STR);
$query->bindParam(':publisher',$publisher,PDO::PARAM_STR);
$query->bindParam(':edition',$edition,PDO::PARAM_STR);
$query->bindParam(':copies',$copies,PDO::PARAM_STR);
$query->bindParam(':pub_date',$pub_date,PDO::PARAM_STR);
$query->execute();
$_SESSION['msg']="Book info updated successfully";
header('location:manage-books.php');


}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Edit Book</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="../assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
      <!------MENU SECTION START-->
<?php include('includes/header.php');?>
<!-- MENU SECTION END-->
    <div class="content-wra
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Update</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Book Info
</div>
<div class="panel-body">
<form role="form" method="post">
<?php 
$bookid=intval($_GET['bookid']);
$sql = "SELECT book.Title,book.category,book.Copies,book.author_name,book.b_isbn  ,book.pub_name,book.pub_year from  book where book.b_isbn =:bookid";
$query = $dbh -> prepare($sql);
$query->bindParam(':bookid',$bookid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<div class="form-group">
<label>Book ISBN</label>
<input class="form-control" type="number" name="bookid" value="<?php echo htmlentities($result->b_isbn);?>" readonly />
</div>

<div class="form-group">
<label>Book Name<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="bookname" value="<?php echo htmlentities($result->Title);?>" required />
</div>

<div class="form-group">
<label> Category<span style="color:red;">*</span></label>
<select class="form-control" name="category" required="required">
<option value="<?php echo htmlentities($result->category);?>"> <?php echo htmlentities($catname=$result->category);?></option>
<?php 
$status=1;
$sql1 = "SELECT categoryname from  category where Status=:status";
$query1 = $dbh -> prepare($sql1);
$query1-> bindParam(':status',$status, PDO::PARAM_STR);
$query1->execute();
$resultss=$query1->fetchAll(PDO::FETCH_OBJ);
if($query1->rowCount() > 0)
{
foreach($resultss as $row)
{           
if($catname==$row->categoryname)
{
continue;
}
else
{
    ?>  
<option value="<?php echo htmlentities($row->categoryname);?>"><?php echo htmlentities($row->categoryname);?></option>
 <?php }}} ?> 
</select>
</div>


<div class="form-group">
<label> Author <span style="color:red;">*</span></label>
<select class="form-control" name="author" required="required">
<option value="<?php echo htmlentities($result->author_name);?>"> <?php echo htmlentities($athrname=$result->author_name);?></option>
<?php 

$sql2 = "SELECT  DISTINCT author_name from  book ";
$query2 = $dbh -> prepare($sql2);
$query2->execute();
$result2=$query2->fetchAll(PDO::FETCH_OBJ);
if($query2->rowCount() > 0)
{
foreach($result2 as $ret)
{           
if($athrname==$ret->author_name)
{
continue;
} else{

    ?>  
<option value="<?php echo htmlentities($ret->author_name);?>"><?php echo htmlentities($ret->author_name);?></option>
 <?php }}} ?> 
</select>
</div>

<div class="form-group">
<label>Publisher<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="publisher" value="<?php echo htmlentities($result->publisher);?>"  required="required" />
</div>



<div class="form-group">
<label>Publication Date<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="pub_date" value="<?php echo htmlentities($result->pub_date);?>"  required="required" />
<p class="help-block">Enter in yyyy/mm/dd format</p>
</div>

<div class="form-group">
<label>Edition<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="edition" value="<?php echo htmlentities($result->edition);?>"  required="required" />
<p class="help-block"></p>
</div>
 
  <div class="form-group">
 <label>No of Copies<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="copies" value="<?php echo htmlentities($result->copies);?>"   required="required" />
 </div>
  
 
 <?php }} ?>
<button type="submit" name="update" class="btn btn-info">Update </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php } ?>
