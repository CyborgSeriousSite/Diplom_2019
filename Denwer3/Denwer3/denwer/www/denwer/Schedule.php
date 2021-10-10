<?php
if($_GET['ds']==null || $_GET['de']==null) {
	echo "<p class=\"noentriestext\"><b>Записи не найдены!</b></p>";
	return;
}
$dStartB = strtotime($_GET['ds']);
$dStartE = date('d.m.y',$dStartB);
$dEndB = strtotime($_GET['de']);
$dEndE = date('d.m.y',$dEndB);

if($dStartE>$dEndE) {
	echo "<p class=\"noentriestext\"><b>Записи не найдены!</b></p>";
	return;
}

$con=mysqli_connect("localhost","root","root","shedulebase");
if (mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
	return;
}

$sql="SELECT ID,GROUPID,SUBJECTID,STARTTIME,ENDTIME,CLASSROOMID,TEACHERID FROM shedule ORDER BY STARTTIME";
$sqlClassRooms="SELECT ID,NUMBER FROM classrooms ORDER BY ID";
$sqlSubjects="SELECT ID,NAME FROM subjects ORDER BY ID";
$sqlGroups="SELECT ID,NAME FROM groups ORDER BY ID";
$sqlTeachers="SELECT ID,FIO FROM teachers ORDER BY ID";

echo 
'
<table id="scheduletable" class="display">
    <thead>
        <tr>
            <th>Дата</th>
            <th>Время начала</th>
            <th>Время окончания</th>
			<th>Аудитория</th>
			<th>Дисциплина</th>
			<th>Группа</th>
			<th>Преподаватель</th>
        </tr>
    </thead>
    <tbody>
';

//Код для всех занятий в диапазоне дат
if(isset($_GET['all'])) {
	$hasOneEntry = false;
	if ($result=mysqli_query($con,$sql))
	  {
	  // Fetch one and one row
	  while ($row=mysqli_fetch_row($result))
		{
			$rsDate = date('d.m.y',strtotime($row[3]));
			$reDate = date('d.m.y',strtotime($row[4]));
			
			if(($rsDate>=$dStartE) && ($rsDate<=$dEndE)) {
				$clrNum = 0;
				$strSubj = 0;
				$strGroup = 0;
				$strTeacher = 0;
				
				if ($result2=mysqli_query($con,$sqlClassRooms))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[5]))
						{
							$clrNum = $row2[1];
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlSubjects))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[2]))
						{
							$strSubj = $row2[1];
							$strSubj = iconv( 'cp1251', 'utf-8', $strSubj);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlGroups))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[1]))
						{
							$strGroup = $row2[1];
							$strGroup = iconv( 'cp1251', 'utf-8', $strGroup);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlTeachers))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[6]))
						{
							$strTeacher = $row2[1];
							$strTeacher = iconv( 'cp1251', 'utf-8', $strTeacher);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				  
				if(!$hasOneEntry) {
					$hasOneEntry = true;
				}
				
				echo '
				<tr>
				<td class="dt-body-center">'.$rsDate.'</td>';
				$rsTime = date('H:i',strtotime($row[3]));
				$reTime = date('H:i',strtotime($row[4]));
				echo '
				<td class="dt-body-center">'.$rsTime.'</td>
				<td class="dt-body-center">'.$reTime.'</td>
				<td class="dt-body-center">'.$clrNum.'</td>
				<td class="dt-body-center">'.$strSubj.'</td>
				<td class="dt-body-center">'.$strGroup.'</td>
				<td class="dt-body-center">'.$strTeacher.'</td>
				</tr>';
			}			
		}
	  // Free result set
	  mysqli_free_result($result);
	  
	  if(!$hasOneEntry) {
		echo "<p class=\"noentriestext\"><b>Записи не найдены!</b></p>";
		return;
	  }
	}
}

//Код для занятий по преподавателю
if($_GET['tch']!=null) {
	$hasOneEntry = false;
	if($_GET['tch']<0) {
		echo "<p class=\"noentriestext\"><b>Записи не найдены!</b></p>";
		return;
	}
	
	if ($result=mysqli_query($con,$sql))
	{
	  while ($row=mysqli_fetch_row($result))
		{
			$rsDate = date('d.m.y',strtotime($row[3]));
			$reDate = date('d.m.y',strtotime($row[4]));
			
			if(($rsDate>=$dStartE) && ($rsDate<=$dEndE)) {
				$clrNum = 0;
				$strSubj = 0;
				$strGroup = 0;
				$strTeacher = 0;
				$tID = -1;
				
				if ($result2=mysqli_query($con,$sqlClassRooms))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[5]))
						{
							$clrNum = $row2[1];
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlSubjects))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[2]))
						{
							$strSubj = $row2[1];
							$strSubj = iconv( 'cp1251', 'utf-8', $strSubj);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlGroups))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[1]))
						{
							$strGroup = $row2[1];
							$strGroup = iconv( 'cp1251', 'utf-8', $strGroup);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlTeachers))
				{
					while ($row2=mysqli_fetch_row($result2))
					{					
						if(intval($row2[0])==intval($row[6]))
						{
							$strTeacher = $row2[1];
							$tID = $row2[0];
							$strTeacher = iconv( 'cp1251', 'utf-8', $strTeacher);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if(intval($tID)==intval($_GET['tch'])) {
					if(!$hasOneEntry) {
						$hasOneEntry = true;
					}
					echo '
					<tr>
					<td class="dt-body-center">'.$rsDate.'</td>';
					$rsTime = date('H:i',strtotime($row[3]));
					$reTime = date('H:i',strtotime($row[4]));
					echo '
					<td class="dt-body-center">'.$rsTime.'</td>
					<td class="dt-body-center">'.$reTime.'</td>
					<td class="dt-body-center">'.$clrNum.'</td>
					<td class="dt-body-center">'.$strSubj.'</td>
					<td class="dt-body-center">'.$strGroup.'</td>
					<td class="dt-body-center">'.$strTeacher.'</td>
					</tr>';
				}
			}			
		}
	  // Free result set
	  mysqli_free_result($result);
	  
	  if(!$hasOneEntry) {
		echo "<p class=\"noentriestext\"><b>Записи не найдены!</b></p>";
		return;
	  }
	}
	
	
}

//Код для занятий по преподавателю
if($_GET['grp']!=null) {
	$hasOneEntry = false;
	if($_GET['grp']<0) {
		echo "<p class=\"noentriestext\"><b>Записи не найдены!</b></p>";
		return;
	}
	
	if ($result=mysqli_query($con,$sql))
	{
	  while ($row=mysqli_fetch_row($result))
		{
			$rsDate = date('d.m.y',strtotime($row[3]));
			$reDate = date('d.m.y',strtotime($row[4]));
			
			if(($rsDate>=$dStartE) && ($rsDate<=$dEndE)) {
				$clrNum = 0;
				$strSubj = 0;
				$strGroup = 0;
				$strTeacher = 0;
				$gID = -1;
				
				if ($result2=mysqli_query($con,$sqlClassRooms))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[5]))
						{
							$clrNum = $row2[1];
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlSubjects))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[2]))
						{
							$strSubj = $row2[1];
							$strSubj = iconv( 'cp1251', 'utf-8', $strSubj);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlGroups))
				{
					while ($row2=mysqli_fetch_row($result2))
					{
						if(intval($row2[0])==intval($row[1]))
						{
							$strGroup = $row2[1];
							$gID = $row2[0];
							$strGroup = iconv( 'cp1251', 'utf-8', $strGroup);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if ($result2=mysqli_query($con,$sqlTeachers))
				{
					while ($row2=mysqli_fetch_row($result2))
					{					
						if(intval($row2[0])==intval($row[6]))
						{
							$strTeacher = $row2[1];
							$strTeacher = iconv( 'cp1251', 'utf-8', $strTeacher);
							break;
						}
					}
					mysqli_free_result($result2);
				}
				
				if(intval($gID)==intval($_GET['grp'])) {
					if(!$hasOneEntry) {
						$hasOneEntry = true;
					}
					$clkDate = date('yyyy-mm-dd H:i',strtotime($row[3]));
					echo '
					<tr>
					<td class="dt-body-center">'.$rsDate.'</td>';
					$rsTime = date('H:i',strtotime($row[3]));
					$reTime = date('H:i',strtotime($row[4]));
					echo '
					<td class="dt-body-center">'.$rsTime.'</td>
					<td class="dt-body-center">'.$reTime.'</td>
					<td class="dt-body-center">'.$clrNum.'</td>
					<td class="dt-body-center">'.$strSubj.'</td>
					<td class="dt-body-center">'.$strGroup.'</td>
					<td class="dt-body-center">'.$strTeacher.'</td>
					</tr>';
				}
			}			
		}
	  // Free result set
	  mysqli_free_result($result);
	  
	  if(!$hasOneEntry) {
		echo "<p class=\"noentriestext\"><b>Записи не найдены!</b></p>";
		return;
	  }
	}
	
}

echo '
</tbody>
</table>
';

mysqli_close($con);
?>