<?php
session_start();
if ($_SESSION["Username"]==null || $_SESSION["Username"]=="guest")
{
	return;
}

if($_GET['size']==null || $_GET['lvl']==null) {
	return;
}

$iSizeModifier = intval($_GET['size']);
$cLevel = intval($_GET['lvl']);

$dSelDate = $_GET['date'];
$iRoomTypeFilter = $_GET['room'];
$iGroup = $_GET['grp'];

// задание массива точек для многоугольника
$values = array(
            16*$iSizeModifier,  16*$iSizeModifier,
            144*$iSizeModifier, 16*$iSizeModifier,
            144*$iSizeModifier, 166*$iSizeModifier,
            527*$iSizeModifier, 166*$iSizeModifier,
            527*$iSizeModifier, 16*$iSizeModifier,
            655*$iSizeModifier, 16*$iSizeModifier,
			655*$iSizeModifier, 314*$iSizeModifier,
			16*$iSizeModifier, 314*$iSizeModifier
            );

// создание изображения
$image = imagecreatetruecolor(675*$iSizeModifier, 335*$iSizeModifier);

$black = imagecolorallocate($image, 0, 0, 0);
$hbcg = imagecolorallocate($image, 240, 240, 240);
$bbl = imagecolorallocate($image, 1, 1, 1);

imagecolortransparent($image, $black);

// рисование многоугольника
imagefilledpolygon($image, $values, 8, $hbcg);

imagepolygon($image, $values, 8, $bbl);

$con=mysqli_connect("localhost","root","root","shedulebase");
if (mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
	return;
}
$sqlClassRooms="SELECT ID,NUMBER,CoordX,CoordY,Width,Height,Type FROM classrooms ORDER BY ID";
$sqlSchedule="SELECT ID,GROUPID,STARTTIME,ENDTIME,CLASSROOMID FROM shedule ORDER BY ID";

$FreeRoomColor = imagecolorallocatealpha($image, 104, 255, 127, 0);
$OccupiedRoomColor = imagecolorallocatealpha($image, 244, 66, 66, 0);
$RoomColor = imagecolorallocatealpha($image, 217, 217, 217, 0);
$ServiceRoomColor = imagecolorallocatealpha($image, 255, 255, 42, 0);
$RoomBorder = imagecolorallocate($image, 1, 1, 1);
$OccupiedByGroupRoomColor = imagecolorallocatealpha($image, 51, 204, 255, 0);

$RoomBorderUnactive = imagecolorallocatealpha($image, 1, 1, 1, 99);
$FreeRoomColorUnactive = imagecolorallocatealpha($image, 104, 255, 127, 99);
$OccupiedRoomColorUnactive = imagecolorallocatealpha($image, 244, 66, 66, 99);
$RoomColorUnactive = imagecolorallocatealpha($image, 217, 217, 217, 99);
$ServiceRoomColorUnactive = imagecolorallocatealpha($image, 255, 255, 42, 99);

if ($result=mysqli_query($con,$sqlClassRooms))
{
	while ($row=mysqli_fetch_row($result))
	{
		$CoordX = intval($row[2])*$iSizeModifier;
		$CoordY = intval($row[3])*$iSizeModifier;
		$Width = $CoordX + intval($row[4])*$iSizeModifier;
		$Height = $CoordY + intval($row[5])*$iSizeModifier;
		$RoomNum = intval($row[1]);
		$Level = $cLevel;
		$txtX = $CoordX+($Width-$CoordX)/2-13;
		$txtY = $CoordY+($Height-$CoordY)/2-13;
		//немного хардкода
		if($RoomNum==310) {
			$txtY = $CoordY+($Height-$CoordY)/2-32;
		}
		$iType = intval($row[6]);
		$cCol = $RoomColor;
		$cColBorder = $RoomBorder;
		
		if($iType==3) {
			$cCol = $ServiceRoomColor;
		}
		
		if($RoomNum >= 100 * $Level && $RoomNum <= (100*$Level)+99) {		
			if($dSelDate!=null) {
				if($_SESSION["GroupID"]==1) {
					$cCol = $RoomColor;
					$cColBorder = $RoomBorder;
					
					if ($result2=mysqli_query($con,$sqlSchedule))
					{
						while ($row2=mysqli_fetch_row($result2))
						{
							$sTimeR = new DateTime(strval($row2[2]));	
							$sTimeR = $sTimeR->getTimestamp();
							$eTimeR = new DateTime(strval($row2[3]));
							$eTimeR = $eTimeR->getTimestamp();
							
							if($row[0]==$row2[4] && (intval($sTimeR)<=intval($dSelDate) && intval($eTimeR)>=intval($dSelDate))) {
								$cCol = $RoomColor;
								$cColBorder = $RoomBorder;
								if($iGroup!=null) {
									if(intval($iGroup)==intval($row2[1])) {
										$cCol = $OccupiedByGroupRoomColor;
										$cColBorder = $RoomBorder;
									}
								}
								break;
							}
						}
						mysqli_free_result($result2);
					}
				} else {
					if($iType==3) {
						$cCol = $ServiceRoomColor;
					} else {
						$cCol = $FreeRoomColor;
					}
					
					if ($result2=mysqli_query($con,$sqlSchedule))
					{
						while ($row2=mysqli_fetch_row($result2))
						{
							$sTimeR = new DateTime(strval($row2[2]));	
							$sTimeR = $sTimeR->getTimestamp();
							$eTimeR = new DateTime(strval($row2[3]));
							$eTimeR = $eTimeR->getTimestamp();
							
							if($row[0]==$row2[4] && (intval($sTimeR)<=intval($dSelDate) && intval($eTimeR)>=intval($dSelDate))) {
								$cCol = $OccupiedRoomColor;
								if($iGroup!=null) {
									if(intval($iGroup)==intval($row2[1])) {
										$cCol = $OccupiedByGroupRoomColor;
									}
								}
								break;
							}
						}
						mysqli_free_result($result2);
					}
				}
			}
			
			if($iRoomTypeFilter!=null) {
				if($iType!=$iRoomTypeFilter) {
					$cCol=$RoomColorUnactive;
					$cColBorder = $RoomBorderUnactive;
				}
			}
			
			imagefilledrectangle($image, $CoordX, $CoordY, $Width, $Height, $cCol);
			imagerectangle ($image, $CoordX , $CoordY, $Width, $Height, $cColBorder);
			imagestring($image, 4*$iSizeModifier, $txtX, $txtY, $RoomNum, $cColBorder);
		}
	}
	mysqli_free_result($result);
}

// вывод изображения
header('Content-type: image/png');
imagepng($image);
imagedestroy($image);
?>