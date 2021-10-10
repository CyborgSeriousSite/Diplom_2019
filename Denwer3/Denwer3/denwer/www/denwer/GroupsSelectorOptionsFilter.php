<?php
$con=mysqli_connect("localhost","root","root","shedulebase");
if (mysqli_connect_errno())
{
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
echo "<option value=\"-1\" selected\"\">Не выбрана</option>";
$sqlGroups="SELECT ID,NAME FROM groups ORDER BY ID";

if ($result=mysqli_query($con,$sqlGroups))
  {
    //Создаем элементы списка с подразделениями
    while ($row=mysqli_fetch_row($result))
    {
		$htmltag = "<option value=\"".$row[0]."\">".$row[1]."</option>\n";
		$htmltag = iconv( 'cp1251', 'utf-8', $htmltag);
		echo $htmltag;
	}
	mysqli_free_result($result);
  }


?>