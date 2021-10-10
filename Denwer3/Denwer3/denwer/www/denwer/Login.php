<?php
session_start();
$sLogin = $_GET['l'];
$sPass = $_GET['p'];
if($sLogin==null || $sPass==null) {
	echo "Неверный логин и пароль";
	return;
}

$con=mysqli_connect("localhost","root","root","shedulebase");
$LoginState = 1;

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  
$sql="SELECT ID,LOGIN,PASSWORD,NAME,GROUPID FROM siteusers ORDER BY ID";

if ($result=mysqli_query($con,$sql))
  {
  // Fetch one and one row
  while ($row=mysqli_fetch_row($result))
    {
		if(strtolower($sLogin)==strtolower($row[1]))
		{
			if($sPass==$row[2])
			{
				$LoginState = 0;
				$_SESSION["Username"] = iconv( 'cp1251', 'utf-8', $row[3]);
				$_SESSION["UserID"] = $row[0];
				$_SESSION["GroupID"] = $row[4];
				break;
			}
		}
    }
  // Free result set
  mysqli_free_result($result);
}

switch ($LoginState) {
    case 0:
        echo "";
        break;
    case 1:
        echo "Неверный логин и пароль";
        break;
}

mysqli_close($con);
?>