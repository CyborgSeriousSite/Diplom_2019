<HTML>
<HEAD>
<script type="text/javascript" src="jquery-3.3.1.js"></script>
</HEAD>
<TITLE>
Профиль пользователя
</TITLE>
</HEAD>

<style>
body {
    background-color: rgba(255,255,255,1);
}
.ProfPage {
    background-color: rgba(200,200,200,1);
	width: 75%;
	height: 300px;
    margin: auto;
    border: 1px outset rgba(0,0,0,0.75);
	padding: 0px 5px 5px 5px;
	border-radius: 5px 5px 0px 0px;
	box-shadow: 1px 1px 1px rgba(0,0,0,1);
}
.ProfInform {
    background-color: rgba(100,100,100,1);
}
p {
   margin: 5px 0px 5px 5px;
}
</style>

<body>

<?php

$uvalid = false;
$uid = 0;
$umail = "";
$uusername = "";
$uusername2 = "";
$uusername3 = "";
$utele = "";
$ugroup = "";

$con=mysqli_connect("localhost","root","root","shedulebase");

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  
  $sql="SELECT * FROM siteusers ORDER BY ID";
  
  if ($result=mysqli_query($con,$sql))
  {
    // Fetch one and one row
    while ($row=mysqli_fetch_row($result))
    {
		if($_GET['id']==$row[0])
		{
			$uvalid = true;
			
			$uid = $row[0];
			$uusername = iconv( 'cp1251', 'utf-8', $row[3]);
			$uusername2 = iconv( 'cp1251', 'utf-8', $row[4]);
			$uusername3 = iconv( 'cp1251', 'utf-8', $row[5]);
			$ugroup = $row[6];
			
			$sql2="SELECT ID,NAME FROM sitegroups ORDER BY ID";
			if ($result2=mysqli_query($con,$sql2))
			{
				while ($row2=mysqli_fetch_row($result2))
				{
					if($row2[0]==$row[6])
					{
						$ugroup = iconv( 'cp1251', 'utf-8', $row2[1]);
						break;
					}
				}
			}
			mysqli_free_result($result2);
			
			$utele = iconv( 'cp1251', 'utf-8', $row[7]);
			$umail = iconv( 'cp1251', 'utf-8', $row[8]);
			break;
		}
	}
	if($uvalid==false) {
		echo '<script language="javascript">';
		echo 'alert("Профиль с таким id не найден!");';
		echo '</script>';
		exit("ERROR");
	}
  mysqli_free_result($result);
  }

mysqli_close($con);
  
?>

<div class="ProfPage" id="ProfPage">

<p width=100%>
Информация о профиле <?php echo $uusername." [ID: ".$uid."]";?></p>

<table border=1 width=100%>

<tr>
<td width=256px>
<img align=left <?php echo "src=\"http://njdaviesandsons.co.uk/wp-content/uploads/2014/12/93.png\""?> width=256px height=256px"> </img>
</td>
<td valign="top">
<p>Имя: 
<?php 
if($uusername=="" || $uusername==null) {
	echo 'Не указано';
} else {
	echo $uusername;
}
?>
</p>
<p>Фамилия: 
<?php 
if($uusername2=="" || $uusername2==null) {
	echo 'Не указано';
} else {
	echo $uusername2;
}
?>
</p>
<p>Отчество: 
<?php 
if($uusername3=="" || $uusername3==null) {
	echo 'Не указано';
} else {
	echo $uusername3;
}
?>
</p>
<p>Группа: 
<?php 
if($ugroup=="" || $ugroup==null) {
	echo 'Не указано';
} else {
	echo $ugroup;
}
?>
</p>
<p>Email: 
<?php 
if($umail=="" || $umail==null) {
	echo 'Не указано';
} else {
	echo $umail;
}
?>
</p>
<p>Телефон: 
<?php 
if($utele=="" || $utele==null) {
	echo 'Не указано';
} else {
	echo $utele;
}
?>
</p>
</td>
</tr>

</table>

</div>


</body>