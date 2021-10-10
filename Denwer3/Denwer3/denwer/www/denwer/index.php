<?php
	session_start();
    if ($_SESSION["Username"] == null)
	{
		$_SESSION["Username"] = "guest";
	}
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="jquery-3.3.1.js"></script>

<link rel="stylesheet" type="text/css" href="DataTables/datatables.css">
<script type="text/javascript" charset="utf8" src="DataTables/datatables.js"></script>
<!-- <script type="text/javascript" charset="utf8" src="DataTables/dataTables.select.min.js"></script> -->
<link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="dist/js/datepicker.js"></script>

<link href="indexStyle.css" rel="stylesheet" type="text/css">
<script src="MainScript.js"></script>
<link href="prettycheckbox.css" rel="stylesheet" type="text/css"/>  
</head>
<body>

<div class="LoginBackground" id="LoginFrame" style="display: none;">
<div class="LoginBox">
<table class="LoginBoxTable">

<tr class="LBHeader">
<td>
<span class="LBHeaderTxt">Вход</span>
<a href="#" onclick="ToggleLoginFrame();" class="CloseButton">x</a>
</td>
</tr>

<tr>
<td>
<div class="loginboxinputL loginboxinputLV">
<span class="loginboxinputLS">Логин:</span>
<input class="loginboxinputLB" type="text" id="username" placeholder="Логин">
</div>

<div class="loginboxinputL loginboxinputLV">
<span class="loginboxinputLS">Пароль:</span>
<input class="loginboxinputLB" type="password" id="password" placeholder="Пароль">
</div>

<div>
<button class="LoginButtonConfirm" onclick="LoginAuth();">
Войти
</button>
</div>
</td>
</tr>

</table>
<div class="outputlogin" style="display: none;" id="outputlogin">
<span id="outputlogintxt">Неверный логин и пароль!</span>
</div>
</div>
</div>

<?php
	echo "
	<div class=\"HeaderMenu\">
	<div class=\"LoginField\">
	";
if($_SESSION["Username"]==null || $_SESSION["Username"]=="guest") {
	echo "
	<span class=\"LinkHeader\" onclick=\"ToggleLoginFrame();\">Вход</span>
	";
} else {
	echo "
<div id=\"MapSwitch\" onclick=\"ShowOrHideGraphicMap();\" class=\"pretty p-switch p-fill\">
<input type=\"checkbox\" />
<div class=\"state\">
<label>Графическое представление</label>
</div>
</div>
<span>Вы вошли как </span><span class=\"LinkHeader\" onclick=\"MyWindow=window.open('/denwer/profile.php?id=".$_SESSION["UserID"]."','MyWindow','width=800,height=350'); return false;\">".$_SESSION["Username"]."</span><span class=\"SplitterH\">|</span><span class=\"LinkHeader\" onclick=\"Logout();\">Выйти</span>
	";
}
echo "
	</div>
	</div>
	";
?>

<table width="600" cellpadding="1" cellspacing="1" align="center">
<tr>

<td colspan="2" align="center" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">

<tr>
<td align="center" valign="top">
<h2>Дата начала</h2>
</td>
<td align="center" valign="top">
<h2>Дата окончания</h2>
</td>
</tr>

<tr>
<td align="center" valign="top">
<input id="StartDatepickerText" class="inputtime" type="text" readonly size="13"/>
</td>
<td align="center" valign="top">
<input id="EndDatepickerText" class="inputtime" type="text" readonly size="13"/>
</td>
</tr>

<tr>
<td align="center" valign="top">
<div class="datepicker-here" id="StartDatepicker">
</div>
</td>
<td align="center" valign="top">
<div class="datepicker-here" id="EndDatepicker">
</div>
</td>
</tr>

</table>
</td>

</tr>

<tr>
<td colspan=2>

<div class="radioline">
    <input type="radio" id="allschedule" name="select_type" checked>
    <label for="allschedule">все занятия</label>
</div>

</td>
</td>
</tr>

<tr>
<td colspan=2>

<div class="radiolineother">
    <input type="radio" id="prepodschedule" name="select_type">
    <label for="prepodschedule">по преподавателю</label>
	<select name="prepod" class="prepodselector select" id="prepod">
		<?php require 'PrepodSelectorOptions.php';?>
	</select>
    <div class="select_arrow">
    </div>
</div>

</td>
</td>

</tr>

<tr>
<td colspan=2>

<div class="radiolineother">
    <input type="radio" id="podrazschedule" name="select_type">
    <label for="podrazschedule">по подразделению</label>
	<select name="podraz" class="prepodselector select" id="podraz" onchange="getGroups()">
		<?php require 'PodrazSelectorOptions.php';?>
	</select>
    <div class="select_arrow">
    </div>
</div>

</td>


</td>
</tr>

<tr>
<td colspan=2>

<div class="radiolineotherlast">
	<select name="group" class="prepodselector select" id="group">
		<?php 
		require 'GroupsSelectorOptions.php';
		?>
	</select>
    <div class="select_arrow lastarrow">
    </div>
</div>

</td>


</td>
</tr>

<tr valign="middle">
<td colspan="2" align="center">
<div class="buttonline">
<input type="button" class="SheduleButton" id="ShowSheduleBtn" value="Вывести расписание" onclick="ShowSchedule();"/>
</div>
</td>
</tr>
</table>

<table width="600" cellpadding="1" cellspacing="1" align="center">
<tr>
<td colspan="2" id="MapTableROW" style="display: none;">

<div class="MapHeader">
Графическая карта
</div>

<div class="underheaderfilters">
<label for="MapFilterDateText">Интересующая дата и время</label>
<input size=12 type='text' data-timepicker="true" id="MapFilterDateText" data-date-format="yyyy-mm-dd" onpaste="ApplyMapTimeFilter(this.value);" readonly="readonly"/>
<span class="SplitterH">|</span>
<?php
if($_SESSION["GroupID"]!=NULL && $_SESSION["GroupID"]>1) {
echo '
<label for="MapFilterRoomType">Тип аудитории</label>
<select id="MapFilterRoomType" onchange="ApplyRoomTypeFilter();">
	<option value="-1" selected>Любая</option>;
	<option value="0">Простая аудитория</option>;
	<option value="4">Компьютерный класс</option>;
	<option value="5">Аудитория с проектором</option>;
</select>
<span class="SplitterH">|</span>';
}
?>
<label for="MapFilterGroup">Группа</label>
<select id="MapFilterGroup" onchange="ApplyGroupFilter();">
	<?php require 'GroupsSelectorOptionsFilter.php';?>
</select>
</div>
<div class="Map">
<img style="-webkit-user-select: none;cursor: zoom-in;" src="roomsdrawer.php?size=2&lvl=1" width="973" height="483" id="MapImg">
</div>

<div class="MapTopFooterLegend">

<table>
<tr>

<td class="legendbox nonactiveroomst">
</td>
<td class="legendcell">
<label>Без фильтра</label>
<span class="SplitterH">|</span>
</td>

<td class="legendbox serviceroomst">
</td>
<td class="legendcell">
<label>Техническая</label>
<span class="SplitterH">|</span>
</td>

<td class="legendbox freeroomst">
</td>
<td class="legendcell">
<label>Свободная</label>
<span class="SplitterH">|</span>
</td>

<td class="legendbox occupiedroomst">
</td>
<td class="legendcell">
<label>Занятая</label>
<span class="SplitterH">|</span>
</td>

<td class="legendbox grouproomst">
</td>
<td class="legendcell">
<label>Занятая группой</label>
<span class="SplitterH">|</span>
</td>

<td class="legendbox disabledroomst">
</td>
<td class="legendcell">
<label>Игнорируемый тип</label>
</td>


</tr>
</table>

</div>

<div class="MapFooter">

<table class="MFTable">
	<tr>
		<td>
			<input type="button" class="lvlinprl" value="◄" onclick="levelnavigate(false);"/>
			<div class="lvlinp" data-level='1' id="levelbox">
			Этаж 1
			</div>
			<input type="button" class="lvlinprb" value="►" onclick="levelnavigate(true);"/>
		</td>
	</tr>
</table>

</div>
</td>
</tr>

<tr>
<td colspan="2">
<div id="shedule_table" class="sheduletable">
</div>
</td>
</tr>

</table>
</body>
</html>