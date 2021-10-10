<?php
$con=mysqli_connect("localhost","root","root","shedulebase");
if (mysqli_connect_errno())
{
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$sqlTeachers="SELECT ID,FIO FROM teachers ORDER BY ID";

if ($result=mysqli_query($con,$sqlTeachers))
  {
	//Создаем элемент списка для не выбранного преподавателя
	echo "<option value=\"-1\" selected=\"\">Выберите преподавателя: </option>\n";
    //Создаем элементы списка с именами преподавателей
    while ($row=mysqli_fetch_row($result))
    {
		$htmltag = "<option value=\"".$row[0]."\">".$row[1]."</option>\n";
		$htmltag = iconv( 'cp1251', 'utf-8', $htmltag); //чтобы не было крокозябр из-за разлиии кодировок!
		echo $htmltag;
	}
	mysqli_free_result($result);
  }


?>