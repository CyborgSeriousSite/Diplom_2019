function getGroups(){
	
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      document.getElementById("group").innerHTML=this.responseText;
    }
  }
  xmlhttp.open("GET","GroupsSelectorOptions.php?pid="+document.getElementById("podraz").options[document.getElementById("podraz").selectedIndex].value,true);
  xmlhttp.send();
}
function ToggleLoginFrame(){
  var e = document.getElementById("LoginFrame");
  if (e.style.display === "none") {
    e.style.display = "block";
  } else {
    e.style.display = "none";
  }
  DataTableAssign();
}
function LoginAuth() {
  var strlog = document.getElementById("username").value;
  var strpas = document.getElementById("password").value;
  
  var opElement = document.getElementById("outputlogin");
  opElement.style.display = "none";
  
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
	  if(this.responseText.length!=0) {
		document.getElementById("outputlogintxt").innerHTML=this.responseText;
		var opElement = document.getElementById("outputlogin");
		opElement.style.display = "block";
	  } else {
		location.reload();
	  }
    }
  }
  xmlhttp.open("GET","Login.php?l="+strlog+"&p="+strpas,true);
  xmlhttp.send();
}
function Logout(){
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
		location.reload();
    }
  }
  xmlhttp.open("GET","Logout.php",true);
  xmlhttp.send();
}
function ShowSchedule(){
  var iType=-1;
  if (document.getElementById('allschedule').checked) {
	iType = 0;
  } else if (document.getElementById('prepodschedule').checked) {
	iType = 1;
  } else if (document.getElementById('podrazschedule').checked) {
	iType = 2;
  }
  
  if(iType==-1) {return;}
  
  if (window.XMLHttpRequest) {
	// code for IE7+, Firefox, Chrome, Opera, Safari
	xmlhttp=new XMLHttpRequest();
  } else {  // code for IE6, IE5
	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
  if (this.readyState==4 && this.status==200) {
	document.getElementById("shedule_table").innerHTML=this.responseText;
	//$('#scheduletable').DataTable({"order": [[ 0, "asc" ], [ 1, "asc" ], [ 2, "asc" ]]});//Старый вариант сортировки. Мультисортировка

	var table = $('#scheduletable').DataTable({
	   fnInitComplete : function() {
		  if ($(this).find('tbody tr').length<=1) {
			 $(this).parent().hide();
		  }
	   },
       "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Russian.json"
       }//,
	   //select: true
	});
	
    /*var events = $('#events');
 
    table
        .on( 'select', function ( e, dt, type, indexes ) {
            var rowData = table.rows(indexes).data().toArray();
			var rowStrForSplit = rowData.toString();
			var splittedStringOfObjects = rowStrForSplit.split(",");
			
			var dString = splittedStringOfObjects[0] + " " + splittedStringOfObjects[1];
			var startSchedD = new Date(dString);
			
			var fDate = startSchedD.getFullYear()+"-"+(startSchedD.getDate()>9?"":"0")+startSchedD.getDate()+"-"+(startSchedD.getMonth()>=9?"":"0")+(startSchedD.getMonth()+1)+" "+startSchedD.getHours()+":"+startSchedD.getMinutes();
			alert(startSchedD.getFullYear()+"-"+(startSchedD.getDate()>9?"":"0")+startSchedD.getDate()+"-"+(startSchedD.getMonth()>=9?"":"0")+(startSchedD.getMonth()+1)+" "+startSchedD.getHours()+":"+startSchedD.getMinutes());
			$('#MapFilterDateText').datepicker().children('input').val(startSchedD);
            //events.prepend( '<div><b>'+type+' selection</b> - '+JSON.stringify( rowData )+'</div>' );
        } )
        .on( 'deselect', function ( e, dt, type, indexes ) {
            var rowData = table.rows( indexes ).data().toArray();
			
            //events.prepend( '<div><b>'+type+' <i>de</i>selection</b> - '+JSON.stringify( rowData )+'</div>' );
        } );*/
	
  }
  }
  switch(iType) {
	case 0:
	  xmlhttp.open("GET","Schedule.php?ds="+document.getElementById("StartDatepickerText").value+"&"+"de="+document.getElementById("EndDatepickerText").value+"&all",true);
	  xmlhttp.send();
	  break;
	case 1:
	  xmlhttp.open("GET","Schedule.php?ds="+document.getElementById("StartDatepickerText").value+"&"+"de="+document.getElementById("EndDatepickerText").value+"&tch="+document.getElementById("prepod").value,true);
	  xmlhttp.send();
	  break;
	case 2:
	  xmlhttp.open("GET","Schedule.php?ds="+document.getElementById("StartDatepickerText").value+"&"+"de="+document.getElementById("EndDatepickerText").value+"&grp="+document.getElementById("group").value,true);
	  xmlhttp.send();
	  break;
  }
  /*xmlhttp.open("GET","Schedule.php",true);
  xmlhttp.send();*/
};
function levelnavigate(bForwardMode){
	var eElem = document.getElementById("levelbox");
	var iLevel = eElem.getAttribute('data-level');
	
	if(bForwardMode==true) {
		iLevel++;
	} else {
		iLevel--;
	}
	if(iLevel<=0) {
		iLevel = 4;
	} else if(iLevel>4) {
		iLevel = 1;
	}
	eElem.setAttribute('data-level',iLevel);
	eElem.innerHTML = 'Этаж ' + iLevel;
	RedrawRooms();
};
function RedrawRooms() {
  var eElem = document.getElementById("levelbox");
  var iLevel = eElem.getAttribute('data-level');
  
  var eElemMap = document.getElementById("MapImg");
  var additionalTags = "";
  if(eElemMap.getAttribute('FilterDate')!=null) {
	var dDate = new Date(eElemMap.getAttribute('FilterDate'));
	additionalTags += "&date=" + ((dDate.getTime()/1000)-3600);
  }
  if(eElemMap.getAttribute('FilterRoom')!=null) {
	additionalTags += "&room=" + eElemMap.getAttribute('FilterRoom');
  }
  if(eElemMap.getAttribute('FilterGroup')!=null) {
	additionalTags += "&grp=" + eElemMap.getAttribute('FilterGroup');
  }
  
  document.getElementById("MapImg").src="roomsdrawer.php?size=2&lvl="+iLevel+additionalTags;
}
function ApplyMapTimeFilter(dSelectedDate) {
  var eElem = document.getElementById("MapImg");
  eElem.setAttribute('FilterDate',dSelectedDate);
  RedrawRooms();
}
$(document).ready(function() {
    $("#MapFilterDateText").datepicker({
        altField: '#sheet',
        onSelect: function(date) {
            ApplyMapTimeFilter(date);
        },
    });
});
function ApplyRoomTypeFilter() {
  var eRSel = document.getElementById("MapFilterRoomType").value;
  var eElem = document.getElementById("MapImg");
  if(eRSel==-1) {
	  if(eElem.getAttribute('FilterRoom')!=null) {
		eElem.removeAttribute('FilterRoom');
	  }
      RedrawRooms();
	  return;
  }
  eElem.setAttribute('FilterRoom',eRSel);
  RedrawRooms();
}
function ApplyGroupFilter() {
  var eRSel = document.getElementById("MapFilterGroup").value;
  var eElem = document.getElementById("MapImg");
  if(eRSel==-1) {
	  if(eElem.getAttribute('FilterGroup')!=null) {
		eElem.removeAttribute('FilterGroup');
	  }
      RedrawRooms();
	  return;
  }
  eElem.setAttribute('FilterGroup',eRSel);
  RedrawRooms();
}
function ShowOrHideGraphicMap() {
  if (document.getElementById('MapSwitch').checked) {
	document.getElementById("MapSwitch").checked = false;
	document.getElementById("MapTableROW").style.display = "none";
  } else {
	document.getElementById("MapSwitch").checked = true;
	document.getElementById("MapTableROW").style.display = "table-row";
  }
}
function ApplyFilterFromSchedule(flDate, selGrp) {
  if (document.getElementById('MapSwitch') != null) {
	  if (document.getElementById('MapSwitch').checked) {
		  
		  
		  
	  }
  }
}