<?php
$pid = $_GET['pid'];
if($pid==-1 || $pid==null) {
	echo "<option value=\"-1\" selected\"\">Сначала выберите подразделение</option>";
	return;
}

$con=mysqli_connect("localhost","root","root","shedulebase");
if (mysqli_connect_errno())
{
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sqlGroups="SELECT ID,NAME,PODRAZID FROM groups ORDER BY ID";

if ($result=mysqli_query($con,$sqlGroups))
  {
    //Создаем элементы списка с подразделениями
    while ($row=mysqli_fetch_row($result))
    {
		if($row[2]==$pid) {
			$htmltag = "<option value=\"".$row[0]."\">".$row[1]."</option>\n";
			$htmltag = iconv( 'cp1251', 'utf-8', $htmltag); //чтобы не было крокозябр из-за разлиии кодировок!
			echo $htmltag;
		}
	}
	mysqli_free_result($result);
  }


?>