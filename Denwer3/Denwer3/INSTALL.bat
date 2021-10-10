@echo off    
:
:
:           #######################################################
:           ## �� � ��� �� ��� ������, ��������� ��� ��������?.. ##
:           #######################################################
:           ## �� � �� �� ��� ���뫨, �������� ��� �����?.. ##
:           #######################################################
:           ##    Hey, what are you taking to do here, dude?     ##
:           #######################################################
:                                          
:



















































































:##
:##  ������, ��� ���-�� ��� ������, �������� ��� ���������.
:##  �०��, 祬 ��-� ��� ������, ������� ࠧ ���㬠��.
:##













































































:##
:##  ��� ���-���� ��������, �� �������� ��� ��������� ������ DOS-���������.
:##  ��� ��-⠪� �訫���, � �ਤ���� ��� �������� ���� DOS-����஢��.
:##

cls


:##
:## ���砫� �஢������ ����稥 Perl.
:##

if not exist .\usr\local\miniperl\miniperl.exe goto NoPerl


:##
:## �� ᢥ�����, � Windows Me (� ��������, � � ��㣨� ������)
:## ������ ���� � C:\Windows\Command ��࠭�� ��ࠧ�� ���������
:## � ��६����� ���㦥��� PATH. ��� ��室� ⠪�� ���権 �
:## �।�����祭 ᫥���騩 ���. ��宦�, ⠪�� ���室 - �����⢥��� 
:## ᯮᮡ �஢���� ����㯭���� �⨫��� start (������� start>nul, 
:## ���४� ��������, �� �������� errorlevel, � ������� 
:## start>some_file, ����� ⮣�, �⮡� ��७��ࠢ��� �뢮� � 䠩��, 
:## ���⠥� �� �� ���᮫�; ���� �஢������� � Windows 95).
:##

echo �஢��塞 ����㯭���� �⨫�� ��������� ��ப� Windows.
echo ��������, ��������. �஢�ઠ �⨫��� "start"...

:## �������� START! ���� ᮧ������, �᫨ ᬮ� ����������.
start /min /wait usr\local\miniperl\miniperl -e "open(F,'>ok.dat')"
if not exist ok.dat goto NoStart

:## �६���� 䠩� ��� �஢�ન 㤠�����.
del ok.dat >nul


:##
:## ����⢥���, ��. ������ ����᪠�� ᠬ ���⠫����.
:##

echo �⨫��� ����㯭�, �த������ ��⠭����.
cls
start "�ணࠬ�� ��⠭���� ������ " usr\local\miniperl\miniperl.exe -x -S "%0"
exit


:##
:## � ��� ��� �㤥� ��ࠡ��뢠�� �訡�� (����-����).
:##

:NoStart
echo.       
echo ��������������������������������������������������������������������ͻ
echo � ��� ����᪠ ������ ����室���, �⮡� � ��६����� ���㦥���  PATH �
echo � �� �ய�ᠭ ���� � �⨫�⠬ ��������� ��ப� Windows (� ⮬ �᫥ �
echo � � start.exe). ��� ⮣� �⮡� �������� ��� ����, ����室���:       �
echo � � Windows 9x:                                                      �
echo �   � 䠩� C:\autoexec.bat (ᮧ����, �᫨ ��� ���) �������� �����: �
echo �   PATH C:\Windows\Command;%%PATH%%                                   �
echo �   ��⥬ ��१���㧨�� ��������.                                   �
echo � � Windows NT/2000/XP:                                              �
echo �   �� �訡�� ����������.                                           �
echo ��������������������������������������������������������������������ͼ
echo �����������������������Ŀ                                              
echo � ������ ���� ������� �                                              
echo �������������������������                                              
pause>nul                                                                   
exit


:NoPerl
echo.
echo ������������������������������������������������������������������������������ͻ
echo � ��� ����᪠ �⮩ �ணࠬ�� ����室�� 䠩� .\usr\local\miniperl\miniperl.exe. �
echo � ��������, �������� ��⠭���� �� �����.                                       �
echo ������������������������������������������������������������������������������ͼ
echo �����������������������Ŀ
echo � ������ ���� ������� �
echo �������������������������
pause>nul
exit











































































:##
:## ��� �� � � ���ࠫ���? ������⭮� 㯮��⢮...
:##

#!perl -w
#line 340
##############################################################
## �।���� ���窠 ������ ���� �筮 350-�, ���� ����. ##
## �஢��塞 ������� ��������.                             ##
##############################################################
## +-------------------------------------------------------------------------+
## | �������������� ����� Web-������������                                   |
## | ������: ������-3 2007-11-01                                             |
## +-------------------------------------------------------------------------+
## | Copyright (C) 2001-2007 ������� �������.                                |
## +-------------------------------------------------------------------------+
## | ������ ���� �������� ������ ��������� �������� "������-3". �� �� ������ |
## | ������������  ��� � ������������  �����.  ������� ������ ����������� �� |
## | �������������.  ���� �� ������ ������ ��������� � �������� ���,  ������ |
## | ����� ���� �������� �� ��� ����������� � ���������. �������� ������!    |
## +-------------------------------------------------------------------------+
## | �������� ��������: http://denwer.ru                                     |
## | ��������: http://forum.dklab.ru/denwer                                  |
## +-------------------------------------------------------------------------+

# Temporarily.
BEGIN {
	open(local *F, ">" . (my $fn = "DENWER_INSTALL.html")) or return;
	print F qq{
		<html>
		<head>
			<title>����������� �������</title>
			<meta http-equiv="Content-type" content="text/html; charset=windows-1251">
		</head>
		<body bgcolor="white">
			<img src="http://www.denwer.ru/logo.gif?i" style="float:right; margin-right: 1em">
			<h1>����������� �������</h1>
			<p>
			<em>�������������� ����� Web-������������</em> (��.�.w.�, �������� �������) � 
			  ������ <a href="http://dmitry.moikrug.ru" target="_blank">�������&nbsp;��������</a>, ����� 
			  ������������� (Apache, PHP, MySQL, Perl � �.�.) � ����������� ��������, ������������ Web-�������������� ��� 
			  ���������� ������ �� "��������" (���������) Windows-������ ��� 
			  ������������� ������ � ��������. ������� ����������� ������� � �������� ��� ��������� 
			  ������ ����� ��� ������������ ������������ ��������� � ����������� ���������� �� Flash-����������.
	  		<p>������ ����� ������� �����������, ������� ������� ��� ���������� ������ �� ���������.
			<br><br><br><br>
			<center><h1>��� ����������� ���� ������ ��������� �������� ��� ����</h1></center>
		</body></html>
	};
	close F;
	local $^W = 0;
	print "�ਢ���⢨�... ��� �த������� ���ன� ��㧥�.\n";
	system('start /wait "" iexplore "' . Win32::GetCwd() . '/' . $fn . '"');
	unlink($fn);
}

$| = 1;
print "�஢��塞 ����稥 ����室���� ��������⮢...\n";
while(defined($_=<DATA>)) {
	s/^#.*|^\s+|\s+$//sg; next if $_ eq "";
	next if -e $_;
	print "�訡��!\n";
	print "�� ���� ���� ".(m{/$}?"��४���":"䠩�")." $_.\n";
	print "�஢����, �ࠢ��쭮 �� �� ࠧ���㫨 ��娢.\n";
	print "������ Enter... ";
	<>; exit(1);
}	
print "�� 䠩�� �� ����. �த������...\n\n";


#
# ������砥� ��४��� � ������⥪���.
#
BEGIN { unshift @INC, "./denwer/scripts/lib" }
#
# ������砥� ������⥪�. ��易⥫쭮 � eval-�!
# 
sub out($); sub try($); sub found($); sub message($); sub error($); sub ask($&);
use Interface;
use Tools;
use Installer;
use ParseHosts;

#
# ����� ���� ⥪�� ���⠫����.
###############################################################################

$defSubst       = "subst";
$defSubstDir    = "C:\\WebServers";
$defSubstDirCreated = "";
$defDriveLetter = "Z";
$dirDenwer      = "denwer";
$fileBoot       = "$dirDenwer\\Boot.exe";
$fileStart      = "$dirDenwer\\Run.exe";
$icoStart       = "$dirDenwer\\utils\\run.ico";
$fileStop       = "$dirDenwer\\Stop.exe";
$icoStop        = "$dirDenwer\\utils\\stop.ico";
$fileRestart    = "$dirDenwer\\Restart.exe";
$icoRestart     = "$dirDenwer\\utils\\restart.ico";
$fileLnkTempl   = "$dirDenwer\\utils\\template.lnk";
$distrib        = "http://www.denwer.ru/dis";
$maxSubstDirLen = 50;


hello();
checkDrivers();
checkBadFiles();
prepareHosts();
setupDiscZ();
exit;


# void hello()
# �ਢ���⢨�.
sub hello {
	initialMessage qq{
		��� �ਢ������ �ணࠬ�� ��⠭���� �������c�
		"�����쬥�᪨� ����� Web-ࠧࠡ��稪�".
	};
	initialMessage qq{
		�� �ணࠬ�� ������� ��� ��⠭����� � ����ந�� ���������� Web-�ࢥ�,
		����室��� ��� ࠡ���. ��������, �����⥫쭮 �⢥砩� �� �� ������,
		��������� �ணࠬ���. �� ����� ��ࢠ�� �믮������ �ணࠬ�� � ��
		������, ����� Ctrl+Break.
	};
	waitEnter();
}


# void setupDiscZ()
# ���⠫���� ����㠫쭮�� ��᪠.
sub setupDiscZ {
	while(1) {
		# Read directory to install.
		$defSubstDir = readSubstDir();
		if ($defSubstDir =~ m{^(\w:)[\\/]*$}s) {
			$defDriveLetter = '';
			last;
		}

		# Determine subst drive letter.
		$defDriveLetter = readSubstDrive();
		if (!testSubst()) {
			message qq{
				���஡�� �� ࠧ, ����� ��㣨� ��ࠬ����.
			};
			rmdir($defSubstDir) if $defSubstDirCreated eq $defSubstDir;
			redo;
		}
	} continue { last }

	copyAll();
	addToAutorun();
	createShortcuts();

	showSuccess("Base", "������", qq{
		�⮡� ����� �ᯮ�짮���� ������, �த����� ᫥���騥 ����⢨�:
		<ol>
		<li>������� ������, ��ᯮ�짮������ ��몮� <b>Start Denwer</b> �� ����祬 �⮫�. �᫨ �� �� ᮧ������
		��모, � ����� �������� ������ �� ������� <tt>$defSubstDir/$fileStart</tt>.
		<li>��ன� ��㧥� � ��३��� �� ����� <a href="http://localhost">http://localhost</a>.
		<li>�� ������ 㢨���� ������� ��࠭��� ������.
		<li>�᫨ ��᫥ ����᪠ ������ 
		<a href="http://localhost">http://localhost</a>
		�� ���뢠����, �஢����, �� ���������� �� ������ ��訬 ��⨢���ᮬ ��� 䠥ࢮ���. ���ਬ��, �뫨 
		����祭� �஡���� � NOD32 � Windows XP (� ��� �㦭� �������� ����� 
		$defDriveLetter:/usr/local/apache/bin/httpd.exe � ᯨ᮪ �᪫�祭��, �� ����� ᤥ���� � ���� 
		IMON/����ன��/������/�᪫�祭��).
		</ol>

		<p style="color:red; font-size: 150%">��������: �᫨ �� �ᯮ���� <b style="color:green">Skype</b>, 㡥�����, �� 
		�� �� �������� ����� 80 � 443, ����室��� ��� ࠡ��� Apache � ������ (<b>"�����㬥��� - ����ன�� 
		- �������⥫쭮 - ���������� - �ᯮ�짮���� ����� 80 � 443 � ����⢥ �室��� ����ୠ⨢���"</b> <span style="color:green">������ ���� �⪫�祭�</span>).</p>
	});
}


# bool isSubst($fname)
# �஢����, ���� �� 㪠����� 䠩� �ணࠬ��� subst.
sub isSubst
{	my ($fname,$runOnly)=@_; 
	$runOnly=1 if !defined $runOnly;
	# �஡㥬 �������� - ��������, �� � �����
	try "�ணࠬ�� \"$fname\" ��宦� �� subst, �஡㥬 ��������...";
	getComOutput("$fname");
	if($?) {
		error "���, �� �� �, �� �㦭�.";
		return;
	} else {
		return 1;
	}
}


# string findSubst()
# �����頥� ��� �⨫��� subst.
sub findSubst() {
	if (isSubst($defSubst)) {
		found "�⨫�� subst �����㦥��.";
		return $defSubst;
	}
	error qq{
		�⨫�� subst (䠩� subst.exe) �� ������� �⠭������ ��४���� ��. 
		����⭮, ���䨣���� ��襩 ��⥬� �ᯮ�祭�, ���� �� � ��� ��⠭������
		�ࠧ� ��� ���ᨨ Windows, ���䫨����騥 ��� � ��㣮�. 
	};
	message qq{
		���祬, �� ����� ���஡����� ���⠫��஢��� ������ � �������� ��⠫�� 
		������-����� ��᪠, 㪠��� ����� ����� ��४�ਨ ��-� �த� "C:",
		� �⮬ ��砥 subst �� �㦭�.
	};
	waitEnter();
	showDebug();
	exit(10);
}


# string readSubstDir()
# ����騢��� ���짮��⥫�, ����� ��४��� �⠭�� ��୥��� 
# ��� ����㠫쭮�� ��᪠.
sub readSubstDir {
	message qq {
		������ ��� ��४�ਨ, � ������ �� ��� ��⠭����� ������.
		
		�᫨ �� ��⠭�������� ������ �� ���-������⥫�, � 㤮���� �ᥣ�
		㪠���� ����� ���� ��� ��᪠ � ����⢥ ��� ��⠭���� (��� ��४�ਨ).
		� �⮬ ��砥 ������ �� "�ਢ�뢠����" � �㪢� ��᪠, � �� ᬮ���
		�ࠧ� �� ��� �ᯮ�짮����, ���� ��⠢�� ������⥫� � �� ��������.

		������ ����� ���� � ��४�ਨ (��� �㪢� ��᪠, �᫨ ��⠭��������
		�� ���-������⥫�). ���� �� ���� ������ Enter, �⮡� �ਭ��� �⠭�����
		���� - $defSubstDir.
	};
	$defSubstDirCreated = "";
	eval {
		while(1) {
			$dir = ask "��� ��४�ਨ ��� �㪢� ���-������⥫� [$defSubstDir]:", sub { trim(scalar(<STDIN>)||'') };
			$dir =~ s{[/\\]+$}{}sg;
			$dir = $defSubstDir if $dir eq "";
			if($dir!~/^[a-z]:/i) {
				message "�� ������ ������ ��᮫��� ���� (� �㪢�� ��᪠)!";
				next;
			}
			my $maxlen=$maxSubstDirLen-length($fileBoot)-1;
			if(length($dir)>$maxlen) {
				error qq{
					�� ����� ᫨誮� ������� ��� (����� $maxlen ᨬ�����).
					�ணࠬ�� �� ����� ��� ��ࠡ����. ������ ����� ���⪨� ����.
				};
				next;
			}
			if(!-e $dir) {
				if(ask "��⠭����� � ��४��� $dir (y/n)?", sub { readYesNo() }) {
					if(!mkdir($dir, 0777)) {
						error "�� ���� ᮧ���� ��४��� � ������ $dir. ���஡�� ��.";
						next;
					} else {
						$defSubstDirCreated = $dir;	
						return $dir;
					}
				} else {
					message "���஡�� �� ࠧ.";
				}
			} else {
				opendir(local *D,$dir);
				my @d=readdir(D);
				return $dir if @d<=2;
				message qq{
					��४��� $dir 㦥 ᮤ�ন� �����-� 䠩�� (� ���� ��祣� ��
					������, �� ��-⠪� ���� ������客�����).
				};
				return $dir if ask
					"�� �筮 㢥७�, �� ��� ࠧ������ � ��� ������ (y/n)? ",
					sub { readYesNo() };
			}
		}
	}; die $@ if $@;
	$dir=~s{/}{\\}sg;
	found "��४��� ��� �����㬥����: $dir.";
	return $dir;
}



# string readSubstDrive()
# �����頥� �㪢� ��᪠, ��������� ���짮��⥫� (��� �������).
sub readSubstDrive {
	message qq{
		������ ���⠫���� ᮧ���� �⤥��� ����㠫�� ���, ����� ����室��
		��� �㭪樮��஢����  ���  ��������⮢  ��⥬�.  �⤥��� ��� ᨫ쭮 
		��頥� ࠡ��� � Web-�����㬥��ਥ�, �������� ���ந�� �� ��設� ���� 
		�த� "�����쪮�� Unix". 
	};
	message qq{
		����㠫�� ��� - �� ���� ᨭ���� ��� ����� �� ��४�਩ �� ��襬 
		��᪥. ��᫥ ⮣� ��� �� �㤥� ᮧ���, ��� ࠡ�� � ����㠫�� ��᪮� 
		�㤥� � ����⢨⥫쭮�� �ந�室��� �  㪠������  ����  ������. �⮡� 
		ᮧ���� ���, ����室��� �⨫�� subst, �室��� � Windows.
	};
	waitEnter();
	
	try qq{
		���� �⨫��� subst...
	};
	$defSubst = findSubst();

	message qq {
		��।������ � ������ ������ ��᪠. ��� ��⨬���� ��ਠ�� �।�������� 
		��� Z: - ��������⭮, �� �� � ��� 㦥 �����. ���祬, �� ����� 
		����� � ���� ����� �㪢� ��᪠, ����� �� �� �����. ����뢠�� 
		�������騥 ��᪨ ����饭�.
	};
	my $d = eval {
		while(1) {
			my $d = ask "������ �㪢� ���饣� ����㠫쭮�� ��᪠ [$defDriveLetter]:", sub { uc trim(scalar(<STDIN>)||'') };
			$d = $defDriveLetter if $d eq "";
			if ($d!~/^([a-z]):?$/i) {
				message "�� �� ��� ��᪠. ���஡�� ��.";
				next;
			}
			$d=uc $1;
			if(-d "$d:\\") {
				message qq{
					�訡��: ��� $d: 㦥 ����� � ��⥬�.
					�� ������ ����� ᢮����� ���. ���஡�� �� ࠧ.
				};
				next;
			}
			return $d;
		}
	}; die $@ if $@;
	found "��� ����㠫쭮�� ��᪠: $d.";
	return $d;
}


# void copyAll()
# ������� ����ਡ�⨢ � 㪠������ ���� � ����� �� ����室���� 
# ��������� � 䠩��.
sub copyAll {
	message qq{
		����� �㤥� �ந������� ����஢���� 䠩��� � ��४���
		$defSubstDir. ��� �⬥�� ������ Ctrl+Break.
	};
	waitEnter();

	try qq {
		���������� 䠩��, ����...
	};
	Installer::copyTree(".", $defSubstDir, sub {
		my ($msg)=@_;
		return 0 unless ask "$msg. ������� (y/n)?", sub { readYesNo() };
		return 1;
	});
	# ����塞 ���⠫���� �� ����� ��४�ਨ - ��� ⠬ ��祣� ������.
	unlink "$defSubstDir/INSTALL.bat";

	try qq {
		������塞 ��ࠬ���� ���䨣��樨...
	};
	$CNF{subst_drive} = $defDriveLetter? "$defDriveLetter:" : "?:";
	setConfigDir("$defSubstDir/$dirDenwer");
	saveConfig();
}


# void testSubst()
# �஢����, 㤠���� �� ᮧ���� � 㤠���� ����㠫�� ���.
sub testSubst {
	try qq{
		���⮢� ����� subst...
	};
	getComOutput("$defSubst $defDriveLetter: \"$defSubstDir\""); 
	if (!-d "$defDriveLetter:\\") {
		error qq{
			�� �������⭮� ��稭� �� 㤠���� ᮧ���� ����㠫�� ���.
		};
		waitEnter(); 
		showDebug();
		return 0;
	}
	try qq{
		OK, ��� ᮧ�����, ��⥬� ࠡ�⠥�. �����㥬...
	};
	for (my $i = 0; $i < 2 && -d "$defDriveLetter:\\"; $i++) {
		getComOutput("$defSubst $defDriveLetter: /d"); 
		sleep(1);
	}
	if (-d "$defDriveLetter:\\") {
		error qq{
			�� �������⭮� ��稭� �� 㤠���� �⪫���� ����㠫�� ���.
			�� �� ���� �⠫쭮� �訡���: ��� �㤥� �⪫�祭 ��᫥ ��१���㧪�.
		};
		waitEnter();
	} else {
		found qq{
			����㠫�� ��� ᮧ������ � �⪫�砥��� ��� �訡��.
		};
	}
	return 1;
}


# �஢���� ����稥 ��� ����室���� �ࠩ��஢.
sub checkDrivers {
	try qq{
		�஢��塞 ����稥 ����室���� �ࠩ��஢. �� ����� ������ �����஥ �६�...
	};
	
	my @PATH = map { s/^\s+|\s+$//sg; $_? ($_) : () } split(/\s*;\s*/, $ENV{PATH}||"");

	my $msgPath = q{
		����⭮, ���䨣���� ��⥬� �ᯮ�祭�. ��� ⮣� �⮡� ���࠭��� �訡��, 
		������� ����� ���� � ��४�ਨ Windows � ��६����� ���㦥��� PATH:
	} . (($ENV{OS}||"") !~ /nt/i
		? q{
			  - ��ன� 䠩� C:\\AUTOEXEC.BAT 
			  - ����� � ����� (�� � ��砫�!) ������� �����:
			    PATH %PATH%;C:\\WINDOWS;C:\\WINDOWS\\COMMAND
			  (�᫨ Windows �ᯮ������ � ��㣮� ��४�ਨ, 㪠��� ��)
		} : q{
			  - ��� -> ����ன�� -> ������ �ࠢ����� -> ���⥬� -> �������⥫쭮 ->
			    ��६���� �।� -> ���⥬�� ��६���� -> PATH -> ��������;
			  - ������� ��� C:\\%WINDIR% � (��易⥫쭮!) C:\\%WINDIR%\\SYSTEM32 
			    �१ ��� � ����⮩ ";" (������� %WINDIR% �� ��� ��४�ਨ 
			    Windows!).
		}
	) . q{
		��� ��������� ��१���㧨� ��設�.
	};
	my $msgPathContains = qq{
		\n����� ��६����� ���㦥��� PATH ᮤ�ন� ᫥���騥 ���祭��:
		$ENV{PATH}
	};

	my $windir = undef;
	{{{{
	# Try to find Windows dir in PATH
	my $found = undef;
	foreach my $dir (@PATH) {
		if(dirLikeWindows($dir)) {
			$found = $dir;
			last;
		}
	}
	if (!$found) {
		error qq{
			�� 㤠���� ����� Windows-��४��� � �⠭������ ����� ���᪠ (��६�����
			���㦥��� PATH). ��� �⮩ ��४�ਨ � ����� ������� ���������� ��⥬�
			(Apache, PHP � �.�.) ����� ࠡ���� ���ࠢ��쭮.
		};
		out $msgPathContains;
		message $msgPath;
		waitEnter(); 
		showDebug();
		exit(30);
	}
	found qq{
		��४��� Windows �����㦥��: $found
	};
	$windir = $found;
	}}}
	
	{{{
	# Try to find cmd.
	my $cmd = undef;
	CMD: foreach my $c ("cmd.exe", "command.com") {	
		foreach my $dir (@PATH) {
			$dir =~ s{\\+$}{}sg;
			if (-f "$dir/$c") {
				$cmd = "$dir/$c";
				last CMD;
			}
		}
	}
	if (!$cmd) {
		error qq{
			�� 㤠���� ����� �������� �������� (cmd.exe ��� command.com) 
			� �⠭������ ����� ���᪠ (��६����� ���㦥��� PATH).
		};
		out $msgPathContains;
		message $msgPath;
		waitEnter(); 
		showDebug();
		exit(35);
	}
	found qq{
		�������� �������� �����㦥�: $cmd
		��६����� ���㦥��� PATH � ���浪�.
	};
	}}}}
	
	{{{{
	# Try PING.
	my $ping = getComOutput("ping localhost -n 1 -w 100");
	$ping =~ s/^\s+|\s+$//sg;
	if ($ping eq "") {
		error qq{
			�⨫��   PING.EXE  ��  �������  ���  ��  ࠡ�⠥�.  ����⭮,  㪠���
			���ࠢ����  ����  �  Windows-��४�ਨ  �  �⠭������ ����� ���᪠
			(��६����� ���㦥��� PATH). �த������� ࠡ��� ����������.
		};
		out $msgPathContains;
		message $msgPath;
		waitEnter(); 
		showDebug();
		exit(40);
	}
	if (
		$ping !~ /\(\s*0%/s &&  # Win9x+
		$ping !~ /TTL=/s        # WinNT 4.0
	) {
		error qq{
			�⨫�� PING.EXE �������, ������ �� 㤠���� �믮����� �������:
			  
			  ping localhost
			  
			��������,   ���ࠢ��쭮   ����஥��   �ࠩ����  ��.   �믮����  ��
			४������樨  ��  ����  "��⠭��������  ������  ��������" �� �����
			http://denwer.ru/base.html
			
			������ �訡��  ⠪�� �����  ��������� �  ��砥, �᫨ �  ��襩 ��⥬�
			ࠡ�⠥� 䠥ࢮ� (�࠭������, ����⥢�� �࠭, firewall), ��������騩
			��⮪�� ICMP. �⪫��� �����஢���� ICMP �� �६� ��⠭���� ������.
		};			
		my $yn = ask 
			"���� ���஡����� �த������, ��ᬮ��� �� ��� �訡�� (y/n)?",
			sub { readYesNo() };
		if (!$yn) {
			message qq{
				��⠭���� ��ࢠ��.
			};
			exit;
		}
	} else {
		found qq{
			�⨫�� PING.EXE ࠡ�⠥�, �⥢� ��⮪��� � ���浪�.
		};
	}
	}}}}

	# For drivers search.
	push @PATH, ("$windir\\system32", "$windir\\system");
	
	{{{{
	# Try to find DCOM
	my @files = qw(ole32.dll oleaut32.dll);
	my $found = undef;
	foreach my $dir (@PATH) {
		my @nf = Installer::getNotFoundFiles($dir, \@files);
		if(!@nf) { $found = $dir; last; }
	}
	if (!$found) {
		error qq{
			������⥪� DCOM �� �������. �த������� ࠡ��� ����������.
		};
		message qq{
			�� 㤠���� ���� ����室��� ������⥪� � ��⠢� DCOM:
			  @{[join ", ", @files]}
			����⭮, DCOM �� ��⠭�����. ���砩� � ��⠭���� ���, �ᯮ���� ����:
			��� Windows 95:
			  http://www.microsoft.com/com/dcom/dcom95/download.asp
			��� Windows 98:
			  http://www.microsoft.com/com/dcom/dcom98/download.asp
		};			
		waitEnter(); 
		exit;
	}
	found qq{
		����室��� �ࠩ���� DCOM �����㦥��.
	};
	}}}}
	
	{{{{
	# Try to find WinSock2
	my @files = qw(ws2_32.dll wsock32.dll);
	my $found = undef;
	foreach my $dir (@PATH) {
		my @nf = Installer::getNotFoundFiles($dir, \@files);
		if(!@nf) { $found = $dir; last; }
	}
	if (!$found) {
		error qq{
			�ࠩ��� WinSock2 �� ������. �த������� ࠡ��� ����������.
		};
		message qq{
			�� 㤠���� ���� ����室��� ������⥪� � ��⠢� WinSock2:
			  @{[join ", ", @files]}
			����⭮, WinSock2 �� ��⠭�����. ���砩� � ��⠭���� ���, �ᯮ����:
			��� Windows 95:
			  $distrib/other/W95ws2setup.exe
			��� Windows 98:
			  �ࠩ��� �� �ॡ����; ����⭮, � ��� ���� �ᯮ�祭� ��⥬� -
			  ���쬨� 䠩�� � �����-����� ��㣮� ��設�
		};			
		waitEnter(); 
		exit;
	}
	found qq{
		�ࠩ��� WinSock2 �����㦥�.
	};
	}}}}

	{{{{
	# Try to find ODBC
	my @files = qw(odbc32.dll);
	my $found = undef;
	foreach my $dir (@PATH) {
		my @nf = Installer::getNotFoundFiles($dir, \@files);
		if(!@nf) { $found = $dir; last; }
	}
	if (!$found) {
		error qq{
			�ࠩ���� ODBC �� ������. �த������� ࠡ��� ����������.
		};
		message qq{
			PHP �ॡ�� ������ � ��⥬� �������� �ࠩ��஢ ��� ࠡ��� � 
			ࠧ���묨 ���� (ODBC). ���⠫����� �� 㤠���� ���� ����室��� 
			������⥪�:
			  @{[join ", ", @files]}
			��� ��⠭���� �ࠩ��஢ ODBC �� �����. 
			  - ��⠭����� Microsoft Office �� ���ᨨ;
			  - ��⠭����� MS Internet Explorer 5.0 ��� ����;		
              - �ᯮ�짮���� �।�⢠ �� ��� - ����ன�� - ������ �ࠢ�����.
		};			
		waitEnter(); 
		exit;
	}
	found qq{
		�ࠩ���� ODBC �����㦥��.
	};
	}}}}
}


# �஢���� ����稥 ���� my.ini � php.ini � �।������ 㤠����.
sub checkBadFiles {
	my $windir = findWindows();
	try qq{
		���� ���䫨���� 䠩���...
	};
	my @del = ();
	if(-e (my $f="$windir/my.ini"))  { push @del, $f }
	if(-e (my $f="$windir/my.cnf"))  { push @del, $f }
	if(-e (my $f="$windir/php.ini")) { push @del, $f }
	foreach (split(/\s*;\s*/, $ENV{PATH}||""), "$windir/system", "$windir/system32", "$windir") {
		s/^\s+|\s+$//sg; next if !$_;
		if (-e (my $f="$_/php4ts.dll"))   { push @del, $f }		
		if (-e (my $f="$_/php4ts.lib"))   { push @del, $f }		
		if (-e (my $f="$_/php5ts.dll"))   { push @del, $f }		
		if (-e (my $f="$_/libmysql.dll")) { push @del, $f }		
	}

	# Unique pathes.
	s{\\}{/}sg foreach @del;
	my %hDel; @hDel{@del} = (); @del = sort { $a cmp $b } keys %hDel;
	
	if(@del) {
		my $del = join(", ", @del);
		message qq{
			��������! �����㦥�� ᫥���騥 ���䫨��� 䠩��:
			  $del
			����⭮, ��� ��⠫��� �� �।��饩 "��筮�" ��⠭���� �ࢥ஢.
			��� ���४⭮� ࠡ��� �� ��� ����室��� ����������. �।��������
			��६������� �������� 䠩�� � *.bak. �  ��⨢��� ��砥 �ࢥ�
			�� ���������!
		};
		foreach my $f (@del) {
			if(ask "��२�������� $f -> $f.bak (y/n)?", sub { readYesNo() } ) {
				if (!rename($f, "$f.bak")) {
					message "��㤠筮: $!";
				}
			} else {
			}
		}
	}
}


sub prepareHosts {
	if (!makeHostsWritable(0)) {
		error qq{
			��⠭���� �த��������, ������ ��-�� ������������ ���������� 䠩�� hosts
			�㤥� ࠡ���� ⮫쪮 ���� http://localhost.
		};
	}
}


sub deinstallFiles {
	message qq{
		������ ���⠫��஢�� ���筮. ��� 㤠����� ��譨� 䠩���
		�㦭� ������ ��४��� $defSubstDir.
	};
	waitEnter();
}


sub makeSimpleLink
{	my ($from,$to,$ico)=@_;
	makeLink("$defSubstDir\\$fileLnkTempl",$to,$from,$ico);
}


sub addToAutorun {
	# �ਢ�뢠���� � ���䨣��樨.
	setConfigDir("$defSubstDir/denwer");
	reloadConfig();

	message qq{
		������ ����� ����᪠���� � ���� ०����:
		1. ����㠫�� ��� ᮧ������ ��� �������� ��. ����� �ࢥ஢ 
		   �����⢫���� � ������� ��몠 �� ����祬 �⮫�. �� �����襭�� 
		   ࠡ��� ������ ����㠫�� ��� �� �⪫�砥���.
		     * ��� ०�� ४��������� �ᯮ�짮����, �᫨ �� ᮡ�ࠥ��� 
		     * �ᯮ�짮���� ����㠫�� ���, �� ����᪠� �ࢥ஢ (���ਬ��, 
		     * ��� ����᪠�� Perl-�ਯ�� �� ⮫쪮 �� ��㧥�, �� � �� 
		     * ��������� ��ப�).
		2. �� ����㧪� �� ����㠫�� ��� �� ᮧ������. �� ����祬 �⮫�
		   ⠪��, ��� � � �. 1, ᮧ������ ��모 ��� ����᪠ � ��⠭��� �ࢥ஢.
		   �� ����᪥ �ࢥ஢ ���砫� ᮧ������ ����㠫�� ���, ��᫥ 
		   ��⠭��� - ��� �⪫�砥���. 
		     * ����室��� �������, �� � �⮬ ०��� �� ����⨢��� ������ �� 
		     * �㤥� ����㯠 � ����㠫쭮�� ���� (� ��⭮��, � Perl).
		     * �஬� ⮣�,  ������� ���ᨨ Windows �� 㬥�� �ࠢ��쭮 �⪫����
		     * ����㠫�� ��� (�ॡ���� ��१���㧪�).

		������������ ����� ��ਠ�� 1, ��⮬� �� �� �������� 㤮���. 
	}; 


	my $choise=readChoise("������ 1 ��� 2", "1", ("1", "2"));
	if($choise eq "1") {
		$CNF{runlevel} = "main";
	} else {
		# �����塞 ��ࠬ��� runlevel � ���䨣��樨.
		$CNF{runlevel} = "reserve";
	}
}


sub createShortcuts {
	if(ask "������� ��모 �� ����祬 �⮫� ��� ����᪠ ������ (y/n)?", sub { readYesNo() }) {
		try qq{
			������� ��모 �� ����祬 �⮫�...
		};
		my $desk=findDesktop();
		my $auto=findAutorun();
		makeSimpleLink("$defSubstDir\\$fileStart",   "$desk/Start Denwer.lnk",   "$defSubstDir\\$icoStart");	
		makeSimpleLink("$defSubstDir\\$fileStop",    "$desk/Stop Denwer.lnk",    "$defSubstDir\\$icoStop");	
		makeSimpleLink("$defSubstDir\\$fileRestart", "$desk/Restart Denwer.lnk", "$defSubstDir\\$icoRestart");	
		makeSimpleLink("$defSubstDir\\$fileBoot",    "$auto/Create virtual drive for Denwer.lnk");
    	found qq{
			��모 ᮧ����.
		};		
	} else {
		message qq{
			��모 �� ����祬 �⮫� �� ᮧ����. ��� ����᪠ ������ �ᯮ����
			������� $defSubstDir\\etc\\Run.exe.
		};
	}
}


###############################################################################
__DATA__
#
# ���᮪ 䠩���, ����稥 ������ �������� ����� � �஢������ ��।
# ��⠭�����. ����稢��� ��४�ਨ ᨬ����� "/".
#
./denwer/.no_overwrite
./denwer/Boot.exe
./denwer/CONFIGURATION.txt
./denwer/README.txt
./denwer/Restart.exe
./denwer/Run.exe
./denwer/Stop.exe
./denwer/SwitchOff.exe
./denwer/scripts/Control.bat
./denwer/scripts/Control.pl
./denwer/scripts/README.txt
./denwer/scripts/init.d/!test.pl
./denwer/scripts/init.d/_stub.pl
./denwer/scripts/init.d/apache.pl
./denwer/scripts/init.d/hosts.pl
./denwer/scripts/init.d/mysql.pl
./denwer/scripts/init.d/sendmail.pl
./denwer/scripts/init.d/vdisk.pl
./denwer/scripts/lib/Carp/Heavy.pm
./denwer/scripts/lib/Carp.pm
./denwer/scripts/lib/ExeExportFunc.pm
./denwer/scripts/lib/Exporter/Heavy.pm
./denwer/scripts/lib/Exporter.pm
./denwer/scripts/lib/IO/Socket.pm
./denwer/scripts/lib/Installer.pm
./denwer/scripts/lib/Interface.pm
./denwer/scripts/lib/Net/MySQL8.pm
./denwer/scripts/lib/Net/MySQL9.pm
./denwer/scripts/lib/Net/README.txt
./denwer/scripts/lib/ParseHosts.pm
./denwer/scripts/lib/StartManager.pm
./denwer/scripts/lib/Tools.pm
./denwer/scripts/lib/VhostTemplate.pm
./denwer/scripts/lib/constant.pm
./denwer/scripts/lib/exe/AllowToModifyVirtualHosts.exe
./denwer/scripts/lib/exe/apachesignal.exe
./denwer/scripts/lib/exe/getpath.exe
./denwer/scripts/lib/exe/ps.exe
./denwer/scripts/lib/exe/terminate.exe
./denwer/scripts/lib/strict.pm
./denwer/scripts/lib/vars.pm
./denwer/scripts/lib/warnings.pm
./denwer/scripts/main/README.txt
./denwer/scripts/main/boot/00_cleanhosts
./denwer/scripts/main/boot/10_vdisk
./denwer/scripts/main/restart/10_hosts
./denwer/scripts/main/restart/20_mysql
./denwer/scripts/main/restart/30_apache
./denwer/scripts/main/restart/35_sendmail
./denwer/scripts/main/start/00_vdisk
./denwer/scripts/main/start/10_hosts
./denwer/scripts/main/start/20_mysql
./denwer/scripts/main/start/30_apache
./denwer/scripts/main/start/35_sendmail
./denwer/scripts/main/stop/10_hosts
./denwer/scripts/main/stop/20_mysql
./denwer/scripts/main/stop/30_apache
./denwer/scripts/main/stop/35_sendmail
./denwer/scripts/main/switchoff/00_vdisk
./denwer/scripts/main/switchoff/50_inherited
./denwer/scripts/reserve/README.txt
./denwer/scripts/reserve/boot/50_inherited
./denwer/scripts/reserve/restart/50_inherited
./denwer/scripts/reserve/start/50_inherited
./denwer/scripts/reserve/stop/00_vdisk
./denwer/scripts/reserve/stop/50_inherited
./denwer/scripts/reserve/switchoff/50_inherited
./denwer/tools/sendmail/README.txt
./denwer/tools/sendmail/common.pm
./denwer/tools/sendmail/sendmail.exe
./denwer/tools/sendmail/sendmail.pl
./denwer/tools/sendmail/sendmail_daemon.ico
./denwer/tools/sendmail/sendmail_daemon.pl
./denwer/tools/sendmail/sendmail_daemon_start.exe
./denwer/tools/sendmail/sendmail_daemon_stop.exe
./denwer/tools/sendmail/sendmail_stub.pl
./denwer/tools/sendmail/sendmail_stub_onefile.pl
./denwer/utils/restart.ico
./denwer/utils/run.ico
./denwer/utils/stop.ico
./denwer/utils/template.lnk
./denwer/www/denwer/Tools/addmuser/index.mysql3.php
./denwer/www/denwer/Tools/addmuser/index.php
./denwer/www/denwer/Tools/dnsearch/.htaccess
./denwer/www/denwer/Tools/dnsearch/Conf/DNSconf.pm
./denwer/www/denwer/Tools/dnsearch/Conf/archive.types
./denwer/www/denwer/Tools/dnsearch/Conf/mime.types
./denwer/www/denwer/Tools/dnsearch/README.TXT
./denwer/www/denwer/Tools/dnsearch/Tools.pm
./denwer/www/denwer/Tools/dnsearch/index.html
./denwer/www/denwer/Tools/dnsearch/search.pl
./denwer/www/denwer/Tools/dnsearch/templates/css.css
./denwer/www/denwer/Tools/dnsearch/templates/css.gif
./denwer/www/denwer/Tools/dnsearch/templates/error_footer.html
./denwer/www/denwer/Tools/dnsearch/templates/error_header.html
./denwer/www/denwer/Tools/dnsearch/templates/footer.html
./denwer/www/denwer/Tools/dnsearch/templates/form.html
./denwer/www/denwer/Tools/dnsearch/templates/header.html
./denwer/www/denwer/Tools/dnsearch/templates/help.html
./denwer/www/denwer/Tools/dnsearch/templates/js.js
./denwer/www/denwer/Tools/dnsearch/templates/pb.gif
./denwer/www/denwer/Tools/dnsearch/templates/search.html
./denwer/www/denwer/Tools/dnsearch/templates/search_footer.html
./denwer/www/denwer/Tools/dnsearch/templates/search_header.html
./denwer/www/denwer/Tools/dnsearch/templates/xhtml10.gif
./denwer/www/denwer/Tools/dnsearch/utils/README.txt
./denwer/www/denwer/Tools/dnsearch/viewer.pl
./denwer/www/denwer/Tools/sitelist/index.php
./denwer/www/denwer/_docsearch.htm
./denwer/www/denwer/_footer.php
./denwer/www/denwer/_header.php
./denwer/www/denwer/_lib.php
./denwer/www/denwer/_tests.php
./denwer/www/denwer/_tools.php
./denwer/www/denwer/errors/403.php
./denwer/www/denwer/errors/404.php
./denwer/www/denwer/errors/405.php
./denwer/www/denwer/errors/500.php
./denwer/www/denwer/errors/_pathes.php
./denwer/www/denwer/errors/phperror_js.php
./denwer/www/denwer/favicon.ico
./denwer/www/denwer/i/hosting-jino.gif
./denwer/www/denwer/i/hostland-adv.gif
./denwer/www/denwer/index.html
./home/cgi-glob/ssi_test.pl
./home/cgi-glob/test.pl
./home/custom/.htaccess
./home/custom/www/index.php
./home/localhost/cgi/test.php
./home/localhost/cgi/test.pl
./home/localhost/cgi-bin/test.pl
./home/localhost/subdomain/index.html
./home/localhost/subdomain/ssi_test.html
./home/localhost/subdomain/ssl.php
./home/localhost/www/Tests/PHP5/index.php5
./home/localhost/www/Tests/README.txt
./home/localhost/www/Tests/custom/index.html
./home/localhost/www/Tests/phpMyAdmin/index.html
./home/localhost/www/Tests/phpnotice/index.php
./home/localhost/www/Tests/sendmail/index.php
./home/localhost/www/Tests/ssl/index.html
./home/localhost/www/Tests/subdomain.localhost/index.html
./home/localhost/www/Tests/subdomain.test1.ru/index.html
./home/localhost/www/Tests/test1.ru/index.html
./home/localhost/www/Tools/README.txt
./home/localhost/www/Tools/phpmyadmin/ChangeLog
./home/localhost/www/Tools/phpmyadmin/Documentation.html
./home/localhost/www/Tools/phpmyadmin/Documentation.txt
./home/localhost/www/Tools/phpmyadmin/LICENSE
./home/localhost/www/Tools/phpmyadmin/README
./home/localhost/www/Tools/phpmyadmin/README.VENDOR
./home/localhost/www/Tools/phpmyadmin/RELEASE-DATE-3.5.1
./home/localhost/www/Tools/phpmyadmin/browse_foreigners.php
./home/localhost/www/Tools/phpmyadmin/bs_disp_as_mime_type.php
./home/localhost/www/Tools/phpmyadmin/bs_play_media.php
./home/localhost/www/Tools/phpmyadmin/changelog.php
./home/localhost/www/Tools/phpmyadmin/chk_rel.php
./home/localhost/www/Tools/phpmyadmin/config.inc.php
./home/localhost/www/Tools/phpmyadmin/config.sample.inc.php
./home/localhost/www/Tools/phpmyadmin/db_create.php
./home/localhost/www/Tools/phpmyadmin/db_datadict.php
./home/localhost/www/Tools/phpmyadmin/db_events.php
./home/localhost/www/Tools/phpmyadmin/db_export.php
./home/localhost/www/Tools/phpmyadmin/db_import.php
./home/localhost/www/Tools/phpmyadmin/db_operations.php
./home/localhost/www/Tools/phpmyadmin/db_printview.php
./home/localhost/www/Tools/phpmyadmin/db_qbe.php
./home/localhost/www/Tools/phpmyadmin/db_routines.php
./home/localhost/www/Tools/phpmyadmin/db_search.php
./home/localhost/www/Tools/phpmyadmin/db_sql.php
./home/localhost/www/Tools/phpmyadmin/db_structure.php
./home/localhost/www/Tools/phpmyadmin/db_tracking.php
./home/localhost/www/Tools/phpmyadmin/db_triggers.php
./home/localhost/www/Tools/phpmyadmin/docs.css
./home/localhost/www/Tools/phpmyadmin/enum_editor.php
./home/localhost/www/Tools/phpmyadmin/examples/config.manyhosts.inc.php
./home/localhost/www/Tools/phpmyadmin/examples/create_tables.sql
./home/localhost/www/Tools/phpmyadmin/examples/create_tables_drizzle.sql
./home/localhost/www/Tools/phpmyadmin/examples/openid.php
./home/localhost/www/Tools/phpmyadmin/examples/signon-script.php
./home/localhost/www/Tools/phpmyadmin/examples/signon.php
./home/localhost/www/Tools/phpmyadmin/examples/swekey.sample.conf
./home/localhost/www/Tools/phpmyadmin/examples/upgrade_tables_mysql_4_1_2+.sql
./home/localhost/www/Tools/phpmyadmin/export.php
./home/localhost/www/Tools/phpmyadmin/favicon.ico
./home/localhost/www/Tools/phpmyadmin/file_echo.php
./home/localhost/www/Tools/phpmyadmin/gis_data_editor.php
./home/localhost/www/Tools/phpmyadmin/import.php
./home/localhost/www/Tools/phpmyadmin/import_status.php
./home/localhost/www/Tools/phpmyadmin/index.php
./home/localhost/www/Tools/phpmyadmin/js/OpenStreetMap.js
./home/localhost/www/Tools/phpmyadmin/js/canvg/MIT-LICENSE.txt
./home/localhost/www/Tools/phpmyadmin/js/canvg/canvg.js
./home/localhost/www/Tools/phpmyadmin/js/canvg/flashcanvas.js
./home/localhost/www/Tools/phpmyadmin/js/canvg/flashcanvas.swf
./home/localhost/www/Tools/phpmyadmin/js/codemirror/LICENSE
./home/localhost/www/Tools/phpmyadmin/js/codemirror/lib/codemirror.js
./home/localhost/www/Tools/phpmyadmin/js/codemirror/mode/mysql/mysql.js
./home/localhost/www/Tools/phpmyadmin/js/common.js
./home/localhost/www/Tools/phpmyadmin/js/config.js
./home/localhost/www/Tools/phpmyadmin/js/cross_framing_protection.js
./home/localhost/www/Tools/phpmyadmin/js/date.js
./home/localhost/www/Tools/phpmyadmin/js/db_operations.js
./home/localhost/www/Tools/phpmyadmin/js/db_search.js
./home/localhost/www/Tools/phpmyadmin/js/db_structure.js
./home/localhost/www/Tools/phpmyadmin/js/dom-drag.js
./home/localhost/www/Tools/phpmyadmin/js/export.js
./home/localhost/www/Tools/phpmyadmin/js/functions.js
./home/localhost/www/Tools/phpmyadmin/js/get_image.js.php
./home/localhost/www/Tools/phpmyadmin/js/gis_data_editor.js
./home/localhost/www/Tools/phpmyadmin/js/highcharts/exporting.js
./home/localhost/www/Tools/phpmyadmin/js/highcharts/highcharts.js
./home/localhost/www/Tools/phpmyadmin/js/import.js
./home/localhost/www/Tools/phpmyadmin/js/indexes.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery-1.6.2.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery-ui-1.8.16.custom.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.cookie.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.event.drag-2.0.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.json-2.2.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.mousewheel.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.qtip-1.0.0-rc3.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.sortableTable.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.sprintf.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.svg.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/jquery.tablesorter.js
./home/localhost/www/Tools/phpmyadmin/js/jquery/timepicker.js
./home/localhost/www/Tools/phpmyadmin/js/keyhandler.js
./home/localhost/www/Tools/phpmyadmin/js/makegrid.js
./home/localhost/www/Tools/phpmyadmin/js/messages.php
./home/localhost/www/Tools/phpmyadmin/js/navigation.js
./home/localhost/www/Tools/phpmyadmin/js/openlayers/OpenLayers.js
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/blank.gif
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/cloud-popup-relative.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/drag-rectangle-off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/drag-rectangle-on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/east-mini.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/layer-switcher-maximize.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/layer-switcher-minimize.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/marker-blue.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/marker-gold.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/marker-green.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/marker.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/measuring-stick-off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/measuring-stick-on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/north-mini.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/panning-hand-off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/panning-hand-on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/slider.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/south-mini.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/west-mini.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/zoom-minus-mini.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/zoom-plus-mini.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/zoom-world-mini.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/img/zoombar.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/framedCloud.css
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/google.css
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/ie6-style.css
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/add_point_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/add_point_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/blank.gif
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/close.gif
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/drag-rectangle-off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/drag-rectangle-on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/draw_line_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/draw_line_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/draw_point_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/draw_point_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/draw_polygon_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/draw_polygon_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/editing_tool_bar.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/move_feature_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/move_feature_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/navigation_history.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/overview_replacement.gif
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/pan-panel-NOALPHA.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/pan-panel.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/pan_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/pan_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/panning-hand-off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/panning-hand-on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/remove_point_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/remove_point_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/ruler.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/save_features_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/save_features_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/view_next_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/view_next_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/view_previous_off.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/view_previous_on.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/zoom-panel-NOALPHA.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/img/zoom-panel.png
./home/localhost/www/Tools/phpmyadmin/js/openlayers/theme/default/style.css
./home/localhost/www/Tools/phpmyadmin/js/pmd/ajax.js
./home/localhost/www/Tools/phpmyadmin/js/pmd/history.js
./home/localhost/www/Tools/phpmyadmin/js/pmd/iecanvas.js
./home/localhost/www/Tools/phpmyadmin/js/pmd/move.js
./home/localhost/www/Tools/phpmyadmin/js/querywindow.js
./home/localhost/www/Tools/phpmyadmin/js/replication.js
./home/localhost/www/Tools/phpmyadmin/js/rte/common.js
./home/localhost/www/Tools/phpmyadmin/js/rte/events.js
./home/localhost/www/Tools/phpmyadmin/js/rte/routines.js
./home/localhost/www/Tools/phpmyadmin/js/rte/triggers.js
./home/localhost/www/Tools/phpmyadmin/js/server_plugins.js
./home/localhost/www/Tools/phpmyadmin/js/server_privileges.js
./home/localhost/www/Tools/phpmyadmin/js/server_status.js
./home/localhost/www/Tools/phpmyadmin/js/server_status_monitor.js
./home/localhost/www/Tools/phpmyadmin/js/server_synchronize.js
./home/localhost/www/Tools/phpmyadmin/js/server_variables.js
./home/localhost/www/Tools/phpmyadmin/js/sql.js
./home/localhost/www/Tools/phpmyadmin/js/tbl_change.js
./home/localhost/www/Tools/phpmyadmin/js/tbl_chart.js
./home/localhost/www/Tools/phpmyadmin/js/tbl_gis_visualization.js
./home/localhost/www/Tools/phpmyadmin/js/tbl_relation.js
./home/localhost/www/Tools/phpmyadmin/js/tbl_select.js
./home/localhost/www/Tools/phpmyadmin/js/tbl_structure.js
./home/localhost/www/Tools/phpmyadmin/js/tbl_zoom_plot.js
./home/localhost/www/Tools/phpmyadmin/js/update-location.js
./home/localhost/www/Tools/phpmyadmin/libraries/.htaccess
./home/localhost/www/Tools/phpmyadmin/libraries/Advisor.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Config.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Error.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Error_Handler.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/File.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Index.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/List.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/List_Database.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Message.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/PDF.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/PMA.php
./home/localhost/www/Tools/phpmyadmin/libraries/Partition.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/RecentTable.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/StorageEngine.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Table.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Theme.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Theme_Manager.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/Tracker.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/advisory_rules.txt
./home/localhost/www/Tools/phpmyadmin/libraries/auth/config.auth.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/auth/cookie.auth.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/auth/http.auth.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/auth/signon.auth.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/auth/swekey/authentication.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/auth/swekey/musbe-ca.crt
./home/localhost/www/Tools/phpmyadmin/libraries/auth/swekey/swekey.auth.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/auth/swekey/swekey.php
./home/localhost/www/Tools/phpmyadmin/libraries/bfShapeFiles/ShapeFile.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/blobstreaming.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/blowfish.php
./home/localhost/www/Tools/phpmyadmin/libraries/bookmark.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/build_html_for_db.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/charset_conversion.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/check_user_privileges.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/cleanup.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/common.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/common.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/ConfigFile.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/Form.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/FormDisplay.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/FormDisplay.tpl.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/config_functions.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/messages.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/setup.forms.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/user_preferences.forms.php
./home/localhost/www/Tools/phpmyadmin/libraries/config/validate.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/config.default.php
./home/localhost/www/Tools/phpmyadmin/libraries/config.values.php
./home/localhost/www/Tools/phpmyadmin/libraries/core.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/data_dictionary_relations.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/data_drizzle.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/data_mysql.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/database_interface.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/db_common.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/db_info.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/db_links.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/db_structure.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/db_table_exists.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/dbi/drizzle-wrappers.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/dbi/drizzle.dbi.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/dbi/mysql.dbi.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/dbi/mysqli.dbi.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_change_password.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_create_database.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_create_table.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_export.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_import.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_import_ajax.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_select_lang.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/display_tbl.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/bdb.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/berkeleydb.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/binlog.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/innobase.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/innodb.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/memory.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/merge.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/mrg_myisam.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/myisam.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/ndbcluster.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/pbms.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/engines/pbxt.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/error.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/codegen.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/csv.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/excel.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/htmlword.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/json.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/latex.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/mediawiki.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/ods.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/odt.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/pdf.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/php_array.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/sql.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/texytext.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/xml.php
./home/localhost/www/Tools/phpmyadmin/libraries/export/yaml.php
./home/localhost/www/Tools/phpmyadmin/libraries/file_listing.php
./home/localhost/www/Tools/phpmyadmin/libraries/footer.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_factory.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_geometry.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_geometrycollection.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_linestring.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_multilinestring.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_multipoint.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_multipolygon.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_point.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_polygon.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis/pma_gis_visualization.php
./home/localhost/www/Tools/phpmyadmin/libraries/gis_visualization.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/grab_globals.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/header.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/header_http.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/header_meta_style.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/header_printview.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/header_scripts.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/iconv_wrapper.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/README
./home/localhost/www/Tools/phpmyadmin/libraries/import/csv.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/docsql.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/ldi.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/ods.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/shp.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/sql.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/upload/apc.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/upload/noplugin.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/upload/uploadprogress.php
./home/localhost/www/Tools/phpmyadmin/libraries/import/xml.php
./home/localhost/www/Tools/phpmyadmin/libraries/import.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/information_schema_relations.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/ip_allow_deny.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/js_escape.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/kanji-encoding.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/language_stats.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/logging.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/mime.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/mult_submits.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/mysql_charsets.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/navigation_header.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/ob.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/opendocument.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/parse_analyze.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/php-gettext/gettext.inc
./home/localhost/www/Tools/phpmyadmin/libraries/php-gettext/gettext.php
./home/localhost/www/Tools/phpmyadmin/libraries/php-gettext/streams.php
./home/localhost/www/Tools/phpmyadmin/libraries/plugin_interface.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/pmd_common.php
./home/localhost/www/Tools/phpmyadmin/libraries/relation.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/relation_cleanup.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/replication.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/replication_gui.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_events.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_export.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_footer.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_list.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_main.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_routines.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_triggers.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/rte/rte_words.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/sanitizing.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/schema/Dia_Relation_Schema.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/schema/Eps_Relation_Schema.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/schema/Export_Relation_Schema.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/schema/Pdf_Relation_Schema.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/schema/Svg_Relation_Schema.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/schema/User_Schema.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/schema/Visio_Relation_Schema.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/select_lang.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/select_server.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/server_common.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/server_links.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/server_synchronize.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/server_variables_doc.php
./home/localhost/www/Tools/phpmyadmin/libraries/session.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/sql_query_form.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/sqlparser.data.php
./home/localhost/www/Tools/phpmyadmin/libraries/sqlparser.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/sqlvalidator.class.php
./home/localhost/www/Tools/phpmyadmin/libraries/sqlvalidator.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/string.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/string_mb.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/string_native.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/string_type_ctype.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/string_type_native.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/sysinfo.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/tbl_common.php
./home/localhost/www/Tools/phpmyadmin/libraries/tbl_info.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/tbl_links.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/tbl_properties.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/tbl_replace_fields.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/tbl_select.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/README
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/TEMPLATE
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/TEMPLATE_MIMETYPE
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/application_octetstream__download.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/application_octetstream__hex.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/generator.sh
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/global.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/image_jpeg__inline.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/image_jpeg__link.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/image_png__inline.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/template_generator.sh
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/template_generator_mimetype.sh
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__dateformat.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__external.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__formatted.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__imagelink.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__link.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__longToIpv4.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__sql.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations/text_plain__substr.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/transformations.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/url_generating.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/user_preferences.inc.php
./home/localhost/www/Tools/phpmyadmin/libraries/user_preferences.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/vendor_config.php
./home/localhost/www/Tools/phpmyadmin/libraries/zip.lib.php
./home/localhost/www/Tools/phpmyadmin/libraries/zip_extension.lib.php
./home/localhost/www/Tools/phpmyadmin/license.php
./home/localhost/www/Tools/phpmyadmin/locale/en_GB/LC_MESSAGES/phpmyadmin.mo
./home/localhost/www/Tools/phpmyadmin/locale/ru/LC_MESSAGES/phpmyadmin.mo
./home/localhost/www/Tools/phpmyadmin/main.php
./home/localhost/www/Tools/phpmyadmin/navigation.php
./home/localhost/www/Tools/phpmyadmin/phpinfo.php
./home/localhost/www/Tools/phpmyadmin/phpmyadmin.css.php
./home/localhost/www/Tools/phpmyadmin/pmd_display_field.php
./home/localhost/www/Tools/phpmyadmin/pmd_general.php
./home/localhost/www/Tools/phpmyadmin/pmd_pdf.php
./home/localhost/www/Tools/phpmyadmin/pmd_relation_new.php
./home/localhost/www/Tools/phpmyadmin/pmd_relation_upd.php
./home/localhost/www/Tools/phpmyadmin/pmd_save_pos.php
./home/localhost/www/Tools/phpmyadmin/prefs_forms.php
./home/localhost/www/Tools/phpmyadmin/prefs_manage.php
./home/localhost/www/Tools/phpmyadmin/print.css
./home/localhost/www/Tools/phpmyadmin/querywindow.php
./home/localhost/www/Tools/phpmyadmin/robots.txt
./home/localhost/www/Tools/phpmyadmin/schema_edit.php
./home/localhost/www/Tools/phpmyadmin/schema_export.php
./home/localhost/www/Tools/phpmyadmin/server_binlog.php
./home/localhost/www/Tools/phpmyadmin/server_collations.php
./home/localhost/www/Tools/phpmyadmin/server_databases.php
./home/localhost/www/Tools/phpmyadmin/server_engines.php
./home/localhost/www/Tools/phpmyadmin/server_export.php
./home/localhost/www/Tools/phpmyadmin/server_import.php
./home/localhost/www/Tools/phpmyadmin/server_plugins.php
./home/localhost/www/Tools/phpmyadmin/server_privileges.php
./home/localhost/www/Tools/phpmyadmin/server_replication.php
./home/localhost/www/Tools/phpmyadmin/server_sql.php
./home/localhost/www/Tools/phpmyadmin/server_status.php
./home/localhost/www/Tools/phpmyadmin/server_synchronize.php
./home/localhost/www/Tools/phpmyadmin/server_variables.php
./home/localhost/www/Tools/phpmyadmin/setup/config.php
./home/localhost/www/Tools/phpmyadmin/setup/frames/.htaccess
./home/localhost/www/Tools/phpmyadmin/setup/frames/config.inc.php
./home/localhost/www/Tools/phpmyadmin/setup/frames/form.inc.php
./home/localhost/www/Tools/phpmyadmin/setup/frames/index.inc.php
./home/localhost/www/Tools/phpmyadmin/setup/frames/menu.inc.php
./home/localhost/www/Tools/phpmyadmin/setup/frames/servers.inc.php
./home/localhost/www/Tools/phpmyadmin/setup/index.php
./home/localhost/www/Tools/phpmyadmin/setup/lib/.htaccess
./home/localhost/www/Tools/phpmyadmin/setup/lib/ConfigGenerator.class.php
./home/localhost/www/Tools/phpmyadmin/setup/lib/common.inc.php
./home/localhost/www/Tools/phpmyadmin/setup/lib/form_processing.lib.php
./home/localhost/www/Tools/phpmyadmin/setup/lib/index.lib.php
./home/localhost/www/Tools/phpmyadmin/setup/scripts.js
./home/localhost/www/Tools/phpmyadmin/setup/styles.css
./home/localhost/www/Tools/phpmyadmin/setup/validate.php
./home/localhost/www/Tools/phpmyadmin/show_config_errors.php
./home/localhost/www/Tools/phpmyadmin/sql.php
./home/localhost/www/Tools/phpmyadmin/tbl_addfield.php
./home/localhost/www/Tools/phpmyadmin/tbl_alter.php
./home/localhost/www/Tools/phpmyadmin/tbl_change.php
./home/localhost/www/Tools/phpmyadmin/tbl_chart.php
./home/localhost/www/Tools/phpmyadmin/tbl_create.php
./home/localhost/www/Tools/phpmyadmin/tbl_export.php
./home/localhost/www/Tools/phpmyadmin/tbl_get_field.php
./home/localhost/www/Tools/phpmyadmin/tbl_gis_visualization.php
./home/localhost/www/Tools/phpmyadmin/tbl_import.php
./home/localhost/www/Tools/phpmyadmin/tbl_indexes.php
./home/localhost/www/Tools/phpmyadmin/tbl_move_copy.php
./home/localhost/www/Tools/phpmyadmin/tbl_operations.php
./home/localhost/www/Tools/phpmyadmin/tbl_printview.php
./home/localhost/www/Tools/phpmyadmin/tbl_relation.php
./home/localhost/www/Tools/phpmyadmin/tbl_replace.php
./home/localhost/www/Tools/phpmyadmin/tbl_row_action.php
./home/localhost/www/Tools/phpmyadmin/tbl_select.php
./home/localhost/www/Tools/phpmyadmin/tbl_sql.php
./home/localhost/www/Tools/phpmyadmin/tbl_structure.php
./home/localhost/www/Tools/phpmyadmin/tbl_tracking.php
./home/localhost/www/Tools/phpmyadmin/tbl_triggers.php
./home/localhost/www/Tools/phpmyadmin/tbl_zoom_select.php
./home/localhost/www/Tools/phpmyadmin/themes/dot.gif
./home/localhost/www/Tools/phpmyadmin/themes/original/css/theme_left.css.php
./home/localhost/www/Tools/phpmyadmin/themes/original/css/theme_print.css.php
./home/localhost/www/Tools/phpmyadmin/themes/original/css/theme_right.css.php
./home/localhost/www/Tools/phpmyadmin/themes/original/img/ajax_clock_small.gif
./home/localhost/www/Tools/phpmyadmin/themes/original/img/arrow_ltr.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/arrow_rtl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_bookmark.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_browse.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_calendar.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_chart.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_close.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_comment.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_dbstatistics.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_deltbl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_docs.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_drop.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_edit.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_empty.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_engine.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_event_add.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_events.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_export.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_ftext.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_globe.gif
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_help.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_home.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_import.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_index.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_info.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_inline_edit.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_insrow.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_minus.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_more.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_newdb.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_newtbl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_nextpage.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_plus.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_primary.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_print.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_props.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_relations.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_routine_add.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_routines.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_save.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_sbrowse.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_search.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_selboard.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_select.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_snewtbl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_spatial.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_sql.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_sqlhelp.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_tblanalyse.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_tblexport.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_tblimport.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_tblops.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_tbloptimize.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_tipp.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_trigger_add.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_triggers.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_unique.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_usradd.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_usrcheck.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_usrdrop.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_usredit.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_usrlist.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_view.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/b_views.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_browse.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_deltbl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_drop.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_edit.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_empty.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_export.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_ftext.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_index.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_insrow.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_nextpage.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_primary.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_sbrowse.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_select.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_spatial.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/bd_unique.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/cleardot.gif
./home/localhost/www/Tools/phpmyadmin/themes/original/img/col_drop.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/col_pointer.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/col_pointer_ver.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/docs_menu_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/east-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/error.ico
./home/localhost/www/Tools/phpmyadmin/themes/original/img/eye.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/eye_grey.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/item_ltr.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/item_rtl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/logo_left.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/logo_right.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/more.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_data.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_data_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_data_selected.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_data_selected_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_struct.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_struct_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_struct_selected.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/new_struct_selected_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/north-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pause.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/play.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/1.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/2.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/2leftarrow.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/2leftarrow_m.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/2rightarrow.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/2rightarrow_m.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/3.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/4.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/5.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/6.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/7.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/8.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/FieldKey_small.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/Field_small.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/Field_small_char.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/Field_small_date.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/Field_small_int.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/Header.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/Header_Linked.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/and_icon.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/ang_direct.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/bord.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/bottom.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/def.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/display_field.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/downarrow1.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/downarrow2.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/downarrow2_m.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/exec.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/exec_small.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/favicon.ico
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/grid.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/help.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/help_relation.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/left_panel_butt.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/left_panel_tab.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/minus.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/or_icon.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/pdf.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/plus.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/query_builder.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/relation.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/reload.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/resize.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/rightarrow1.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/rightarrow2.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/save.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/small_tab.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/table.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/toggle_lines.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/top_panel.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/pmd/uparrow2_m.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_asc.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_asci.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_attention.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_cancel.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_cog.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_db.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_desc.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_error.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_error2.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_fulltext.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_host.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_info.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_lang.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_loggoff.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_notice.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_okay.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_partialtext.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_passwd.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_process.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_really.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_reload.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_replication.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_rights.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_sortable.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_status.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_success.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_sync.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_tbl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_theme.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_vars.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/s_views.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/south-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/spacer.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/sprites.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/toggle-ltr.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/toggle-rtl.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/vertical_line.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/west-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/window-new.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/zoom-minus-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/zoom-plus-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/original/img/zoom-world-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/original/info.inc.php
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_flat_0_aaaaaa_40x100.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_flat_75_ffffff_40x100.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_glass_55_fbf9ee_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_glass_65_ffffff_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_glass_75_dadada_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_glass_75_e6e6e6_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_glass_95_fef1ec_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-bg_highlight-soft_75_cccccc_1x100.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-icons_222222_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-icons_2e83ff_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-icons_454545_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-icons_888888_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/images/ui-icons_cd0a0a_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/original/jquery/jquery-ui-1.8.16.custom.css
./home/localhost/www/Tools/phpmyadmin/themes/original/layout.inc.php
./home/localhost/www/Tools/phpmyadmin/themes/original/screen.png
./home/localhost/www/Tools/phpmyadmin/themes/original/sprites.lib.php
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/css/theme_left.css.php
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/css/theme_print.css.php
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/css/theme_right.css.php
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/ajax_clock_small.gif
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/arrow_ltr.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/arrow_rtl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/asc_order.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_bookmark.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_browse.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_calendar.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_chart.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_close.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_comment.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_dbstatistics.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_deltbl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_docs.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_docsql.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_drop.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_edit.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_empty.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_engine.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_event_add.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_events.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_export.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_firstpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_ftext.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_globe.gif
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_help.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_home.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_import.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_index.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_info.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_inline_edit.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_insrow.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_lastpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_minus.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_more.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_newdb.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_newtbl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_nextpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_pdfdoc.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_plus.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_prevpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_primary.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_print.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_props.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_relations.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_routine_add.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_routines.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_save.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_sbrowse.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_sdb.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_search.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_selboard.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_select.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_snewtbl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_spatial.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_sql.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_sqldoc.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_sqlhelp.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_tblanalyse.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_tblexport.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_tblimport.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_tblops.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_tbloptimize.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_tipp.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_trigger_add.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_triggers.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_unique.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_usradd.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_usrcheck.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_usrdrop.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_usredit.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_usrlist.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_view.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/b_views.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_browse.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_deltbl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_drop.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_edit.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_empty.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_export.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_firstpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_ftext.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_index.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_insrow.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_lastpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_nextpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_prevpage.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_primary.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_sbrowse.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_select.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_spatial.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/bd_unique.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/body_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/col_drop.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/col_pointer.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/col_pointer_ver.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/database.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/database_list_li_hover.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/docs_menu_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/east-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/error.ico
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/eye.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/eye_grey.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/input_bg.gif
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/item.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/item_ltr.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/item_rtl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/left_nav_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/logo_left.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/logo_right.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/marked_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/more.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_data.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_data_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_data_selected.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_data_selected_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_struct.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_struct_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_struct_selected.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/new_struct_selected_hovered.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/north-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pause.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/php_sym.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/play.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pma_logo2.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/1.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/2.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/2leftarrow.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/2leftarrow_m.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/2rightarrow.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/2rightarrow_m.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/3.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/4.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/5.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/6.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/7.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/8.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/FieldKey_small.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/Field_small.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/Field_small_char.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/Field_small_date.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/Field_small_int.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/Header.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/Header_Linked.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/and_icon.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/ang_direct.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/bord.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/bottom.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/def.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/display_field.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/downarrow1.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/downarrow2.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/downarrow2_m.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/exec.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/exec_small.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/favicon.ico
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/grid.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/help.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/help_relation.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/left_panel_butt.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/left_panel_tab.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/minus.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/or_icon.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/pdf.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/plus.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/query_builder.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/relation.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/reload.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/resize.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/rightarrow1.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/rightarrow2.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/save.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/small_tab.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/table.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/toggle_lines.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/top_panel.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/pmd/uparrow2_m.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_asc.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_asci.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_attention.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_cancel.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_cancel2.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_cog.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_db.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_desc.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_error.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_error2.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_fulltext.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_host.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_info.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_lang.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_loggoff.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_notice.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_okay.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_partialtext.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_passwd.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_process.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_really.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_reload.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_replication.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_rights.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_sortable.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_status.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_success.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_sync.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_tbl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_theme.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_vars.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/s_views.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/south-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/spacer.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/sprites.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/tab_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/tab_hover_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/tabactive_bg.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/toggle-ltr.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/toggle-rtl.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/vertical_line.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/west-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/window-new.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/zoom-minus-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/zoom-plus-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/img/zoom-world-mini.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/info.inc.php
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_flat_0_aaaaaa_40x100.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_flat_75_ffffff_40x100.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_glass_55_fbf9ee_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_glass_65_ffffff_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_glass_75_dadada_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_glass_75_e6e6e6_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_glass_95_fef1ec_1x400.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-bg_highlight-soft_75_cccccc_1x100.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-icons_222222_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-icons_2e83ff_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-icons_454545_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-icons_888888_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/images/ui-icons_cd0a0a_256x240.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/jquery/jquery-ui-1.8.16.custom.css
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/layout.inc.php
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/screen.png
./home/localhost/www/Tools/phpmyadmin/themes/pmahomme/sprites.lib.php
./home/localhost/www/Tools/phpmyadmin/themes/sprites.css.php
./home/localhost/www/Tools/phpmyadmin/themes/svg_gradient.php
./home/localhost/www/Tools/phpmyadmin/themes.php
./home/localhost/www/Tools/phpmyadmin/transformation_overview.php
./home/localhost/www/Tools/phpmyadmin/transformation_wrapper.php
./home/localhost/www/Tools/phpmyadmin/url.php
./home/localhost/www/Tools/phpmyadmin/user_password.php
./home/localhost/www/Tools/phpmyadmin/view_create.php
./home/localhost/www/Tools/phpmyadmin/view_operations.php
./home/localhost/www/Tools/phpmyadmin/webapp.php
./home/localhost/www/favicon.ico
./home/localhost/www/index.php
./home/test1.ru/cgi/test.pl
./home/test1.ru/subdomain/index.html
./home/test1.ru/www/index.html
./tmp/README.txt
./usr/bin/php.exe
./usr/bin/php5.exe
./usr/bin/sendmail.exe
./usr/local/apache/LICENSE.txt
./usr/local/apache/README-win32.txt
./usr/local/apache/README.txt
./usr/local/apache/bin/Apache.ico
./usr/local/apache/bin/Microsoft.VC90.CRT.manifest
./usr/local/apache/bin/TrayApache.exe
./usr/local/apache/bin/ab.exe
./usr/local/apache/bin/httpd.exe
./usr/local/apache/bin/libapr-1.dll
./usr/local/apache/bin/libapriconv-1.dll
./usr/local/apache/bin/libaprutil-1.dll
./usr/local/apache/bin/libeay32.dll
./usr/local/apache/bin/libhttpd.dll
./usr/local/apache/bin/msvcr90.dll
./usr/local/apache/bin/ssleay32.dll
./usr/local/apache/bin/zlib1.dll
./usr/local/apache/conf/.no_overwrite
./usr/local/apache/conf/cert/privkey.pem
./usr/local/apache/conf/cert/server.crt
./usr/local/apache/conf/cert/server.csr
./usr/local/apache/conf/extra/httpd-autoindex.conf
./usr/local/apache/conf/extra/httpd-dav.conf
./usr/local/apache/conf/extra/httpd-default.conf
./usr/local/apache/conf/extra/httpd-info.conf
./usr/local/apache/conf/extra/httpd-languages.conf
./usr/local/apache/conf/extra/httpd-manual.conf
./usr/local/apache/conf/extra/httpd-mpm.conf
./usr/local/apache/conf/extra/httpd-multilang-errordoc.conf
./usr/local/apache/conf/extra/httpd-ssl.conf
./usr/local/apache/conf/extra/httpd-userdir.conf
./usr/local/apache/conf/extra/httpd-vhosts.conf
./usr/local/apache/conf/httpd.conf
./usr/local/apache/conf/magic
./usr/local/apache/conf/mime.types
./usr/local/apache/icons/README
./usr/local/apache/icons/README.html
./usr/local/apache/icons/a.gif
./usr/local/apache/icons/a.png
./usr/local/apache/icons/alert.black.gif
./usr/local/apache/icons/alert.black.png
./usr/local/apache/icons/alert.red.gif
./usr/local/apache/icons/alert.red.png
./usr/local/apache/icons/apache_pb.gif
./usr/local/apache/icons/apache_pb.png
./usr/local/apache/icons/apache_pb2.gif
./usr/local/apache/icons/apache_pb2.png
./usr/local/apache/icons/apache_pb2_ani.gif
./usr/local/apache/icons/back.gif
./usr/local/apache/icons/back.png
./usr/local/apache/icons/ball.gray.gif
./usr/local/apache/icons/ball.gray.png
./usr/local/apache/icons/ball.red.gif
./usr/local/apache/icons/ball.red.png
./usr/local/apache/icons/binary.gif
./usr/local/apache/icons/binary.png
./usr/local/apache/icons/binhex.gif
./usr/local/apache/icons/binhex.png
./usr/local/apache/icons/blank.gif
./usr/local/apache/icons/blank.png
./usr/local/apache/icons/bomb.gif
./usr/local/apache/icons/bomb.png
./usr/local/apache/icons/box1.gif
./usr/local/apache/icons/box1.png
./usr/local/apache/icons/box2.gif
./usr/local/apache/icons/box2.png
./usr/local/apache/icons/broken.gif
./usr/local/apache/icons/broken.png
./usr/local/apache/icons/burst.gif
./usr/local/apache/icons/burst.png
./usr/local/apache/icons/c.gif
./usr/local/apache/icons/c.png
./usr/local/apache/icons/comp.blue.gif
./usr/local/apache/icons/comp.blue.png
./usr/local/apache/icons/comp.gray.gif
./usr/local/apache/icons/comp.gray.png
./usr/local/apache/icons/compressed.gif
./usr/local/apache/icons/compressed.png
./usr/local/apache/icons/continued.gif
./usr/local/apache/icons/continued.png
./usr/local/apache/icons/dir.gif
./usr/local/apache/icons/dir.png
./usr/local/apache/icons/diskimg.gif
./usr/local/apache/icons/diskimg.png
./usr/local/apache/icons/down.gif
./usr/local/apache/icons/down.png
./usr/local/apache/icons/dvi.gif
./usr/local/apache/icons/dvi.png
./usr/local/apache/icons/f.gif
./usr/local/apache/icons/f.png
./usr/local/apache/icons/folder.gif
./usr/local/apache/icons/folder.open.gif
./usr/local/apache/icons/folder.open.png
./usr/local/apache/icons/folder.png
./usr/local/apache/icons/folder.sec.gif
./usr/local/apache/icons/folder.sec.png
./usr/local/apache/icons/forward.gif
./usr/local/apache/icons/forward.png
./usr/local/apache/icons/generic.gif
./usr/local/apache/icons/generic.png
./usr/local/apache/icons/generic.red.gif
./usr/local/apache/icons/generic.red.png
./usr/local/apache/icons/generic.sec.gif
./usr/local/apache/icons/generic.sec.png
./usr/local/apache/icons/hand.right.gif
./usr/local/apache/icons/hand.right.png
./usr/local/apache/icons/hand.up.gif
./usr/local/apache/icons/hand.up.png
./usr/local/apache/icons/icon.sheet.gif
./usr/local/apache/icons/icon.sheet.png
./usr/local/apache/icons/image1.gif
./usr/local/apache/icons/image1.png
./usr/local/apache/icons/image2.gif
./usr/local/apache/icons/image2.png
./usr/local/apache/icons/image3.gif
./usr/local/apache/icons/image3.png
./usr/local/apache/icons/index.gif
./usr/local/apache/icons/index.png
./usr/local/apache/icons/layout.gif
./usr/local/apache/icons/layout.png
./usr/local/apache/icons/left.gif
./usr/local/apache/icons/left.png
./usr/local/apache/icons/link.gif
./usr/local/apache/icons/link.png
./usr/local/apache/icons/movie.gif
./usr/local/apache/icons/movie.png
./usr/local/apache/icons/p.gif
./usr/local/apache/icons/p.png
./usr/local/apache/icons/patch.gif
./usr/local/apache/icons/patch.png
./usr/local/apache/icons/pdf.gif
./usr/local/apache/icons/pdf.png
./usr/local/apache/icons/pie0.gif
./usr/local/apache/icons/pie0.png
./usr/local/apache/icons/pie1.gif
./usr/local/apache/icons/pie1.png
./usr/local/apache/icons/pie2.gif
./usr/local/apache/icons/pie2.png
./usr/local/apache/icons/pie3.gif
./usr/local/apache/icons/pie3.png
./usr/local/apache/icons/pie4.gif
./usr/local/apache/icons/pie4.png
./usr/local/apache/icons/pie5.gif
./usr/local/apache/icons/pie5.png
./usr/local/apache/icons/pie6.gif
./usr/local/apache/icons/pie6.png
./usr/local/apache/icons/pie7.gif
./usr/local/apache/icons/pie7.png
./usr/local/apache/icons/pie8.gif
./usr/local/apache/icons/pie8.png
./usr/local/apache/icons/portal.gif
./usr/local/apache/icons/portal.png
./usr/local/apache/icons/ps.gif
./usr/local/apache/icons/ps.png
./usr/local/apache/icons/quill.gif
./usr/local/apache/icons/quill.png
./usr/local/apache/icons/right.gif
./usr/local/apache/icons/right.png
./usr/local/apache/icons/screw1.gif
./usr/local/apache/icons/screw1.png
./usr/local/apache/icons/screw2.gif
./usr/local/apache/icons/screw2.png
./usr/local/apache/icons/script.gif
./usr/local/apache/icons/script.png
./usr/local/apache/icons/small/back.gif
./usr/local/apache/icons/small/back.png
./usr/local/apache/icons/small/binary.gif
./usr/local/apache/icons/small/binary.png
./usr/local/apache/icons/small/binhex.gif
./usr/local/apache/icons/small/binhex.png
./usr/local/apache/icons/small/blank.gif
./usr/local/apache/icons/small/blank.png
./usr/local/apache/icons/small/broken.gif
./usr/local/apache/icons/small/broken.png
./usr/local/apache/icons/small/burst.gif
./usr/local/apache/icons/small/burst.png
./usr/local/apache/icons/small/comp1.gif
./usr/local/apache/icons/small/comp1.png
./usr/local/apache/icons/small/comp2.gif
./usr/local/apache/icons/small/comp2.png
./usr/local/apache/icons/small/compressed.gif
./usr/local/apache/icons/small/compressed.png
./usr/local/apache/icons/small/continued.gif
./usr/local/apache/icons/small/continued.png
./usr/local/apache/icons/small/dir.gif
./usr/local/apache/icons/small/dir.png
./usr/local/apache/icons/small/dir2.gif
./usr/local/apache/icons/small/dir2.png
./usr/local/apache/icons/small/doc.gif
./usr/local/apache/icons/small/doc.png
./usr/local/apache/icons/small/forward.gif
./usr/local/apache/icons/small/forward.png
./usr/local/apache/icons/small/generic.gif
./usr/local/apache/icons/small/generic.png
./usr/local/apache/icons/small/generic2.gif
./usr/local/apache/icons/small/generic2.png
./usr/local/apache/icons/small/generic3.gif
./usr/local/apache/icons/small/generic3.png
./usr/local/apache/icons/small/image.gif
./usr/local/apache/icons/small/image.png
./usr/local/apache/icons/small/image2.gif
./usr/local/apache/icons/small/image2.png
./usr/local/apache/icons/small/index.gif
./usr/local/apache/icons/small/index.png
./usr/local/apache/icons/small/key.gif
./usr/local/apache/icons/small/key.png
./usr/local/apache/icons/small/movie.gif
./usr/local/apache/icons/small/movie.png
./usr/local/apache/icons/small/patch.gif
./usr/local/apache/icons/small/patch.png
./usr/local/apache/icons/small/ps.gif
./usr/local/apache/icons/small/ps.png
./usr/local/apache/icons/small/rainbow.gif
./usr/local/apache/icons/small/rainbow.png
./usr/local/apache/icons/small/sound.gif
./usr/local/apache/icons/small/sound.png
./usr/local/apache/icons/small/sound2.gif
./usr/local/apache/icons/small/sound2.png
./usr/local/apache/icons/small/tar.gif
./usr/local/apache/icons/small/tar.png
./usr/local/apache/icons/small/text.gif
./usr/local/apache/icons/small/text.png
./usr/local/apache/icons/small/transfer.gif
./usr/local/apache/icons/small/transfer.png
./usr/local/apache/icons/small/unknown.gif
./usr/local/apache/icons/small/unknown.png
./usr/local/apache/icons/small/uu.gif
./usr/local/apache/icons/small/uu.png
./usr/local/apache/icons/sound1.gif
./usr/local/apache/icons/sound1.png
./usr/local/apache/icons/sound2.gif
./usr/local/apache/icons/sound2.png
./usr/local/apache/icons/sphere1.gif
./usr/local/apache/icons/sphere1.png
./usr/local/apache/icons/sphere2.gif
./usr/local/apache/icons/sphere2.png
./usr/local/apache/icons/tar.gif
./usr/local/apache/icons/tar.png
./usr/local/apache/icons/tex.gif
./usr/local/apache/icons/tex.png
./usr/local/apache/icons/text.gif
./usr/local/apache/icons/text.png
./usr/local/apache/icons/transfer.gif
./usr/local/apache/icons/transfer.png
./usr/local/apache/icons/unknown.gif
./usr/local/apache/icons/unknown.png
./usr/local/apache/icons/up.gif
./usr/local/apache/icons/up.png
./usr/local/apache/icons/uu.gif
./usr/local/apache/icons/uu.png
./usr/local/apache/icons/uuencoded.gif
./usr/local/apache/icons/uuencoded.png
./usr/local/apache/icons/world1.gif
./usr/local/apache/icons/world1.png
./usr/local/apache/icons/world2.gif
./usr/local/apache/icons/world2.png
./usr/local/apache/logs/README.txt
./usr/local/apache/modules/Microsoft.VC90.CRT.manifest
./usr/local/apache/modules/mod_actions.so
./usr/local/apache/modules/mod_alias.so
./usr/local/apache/modules/mod_asis.so
./usr/local/apache/modules/mod_auth_basic.so
./usr/local/apache/modules/mod_authn_default.so
./usr/local/apache/modules/mod_authn_file.so
./usr/local/apache/modules/mod_authz_default.so
./usr/local/apache/modules/mod_authz_groupfile.so
./usr/local/apache/modules/mod_authz_host.so
./usr/local/apache/modules/mod_authz_user.so
./usr/local/apache/modules/mod_autoindex.so
./usr/local/apache/modules/mod_cgi.so
./usr/local/apache/modules/mod_dir.so
./usr/local/apache/modules/mod_env.so
./usr/local/apache/modules/mod_imagemap.so
./usr/local/apache/modules/mod_include.so
./usr/local/apache/modules/mod_isapi.so
./usr/local/apache/modules/mod_log_config.so
./usr/local/apache/modules/mod_mime.so
./usr/local/apache/modules/mod_negotiation.so
./usr/local/apache/modules/mod_rewrite.so
./usr/local/apache/modules/mod_setenvif.so
./usr/local/apache/modules/mod_ssl.so
./usr/local/apache/modules/mod_userdir.so
./usr/local/bin/php.exe
./usr/local/bin/php5.exe
./usr/local/bin/sendmail.exe
./usr/local/miniperl/README.txt
./usr/local/miniperl/miniperl.exe
./usr/local/miniperl/miniperl_test.bat
./usr/local/mysql-5.5/COPYING
./usr/local/mysql-5.5/bin/mysql.exe
./usr/local/mysql-5.5/bin/mysql_upgrade.exe
./usr/local/mysql-5.5/bin/mysqlcheck.exe
./usr/local/mysql-5.5/bin/mysqld.exe
./usr/local/mysql-5.5/data/.no_overwrite
./usr/local/mysql-5.5/data/README.txt
./usr/local/mysql-5.5/data/mysql/columns_priv.MYD
./usr/local/mysql-5.5/data/mysql/columns_priv.MYI
./usr/local/mysql-5.5/data/mysql/columns_priv.frm
./usr/local/mysql-5.5/data/mysql/db.MYD
./usr/local/mysql-5.5/data/mysql/db.MYI
./usr/local/mysql-5.5/data/mysql/db.frm
./usr/local/mysql-5.5/data/mysql/event.MYD
./usr/local/mysql-5.5/data/mysql/event.MYI
./usr/local/mysql-5.5/data/mysql/event.frm
./usr/local/mysql-5.5/data/mysql/func.MYD
./usr/local/mysql-5.5/data/mysql/func.MYI
./usr/local/mysql-5.5/data/mysql/func.frm
./usr/local/mysql-5.5/data/mysql/general_log.CSM
./usr/local/mysql-5.5/data/mysql/general_log.CSV
./usr/local/mysql-5.5/data/mysql/general_log.frm
./usr/local/mysql-5.5/data/mysql/help_category.MYD
./usr/local/mysql-5.5/data/mysql/help_category.MYI
./usr/local/mysql-5.5/data/mysql/help_category.frm
./usr/local/mysql-5.5/data/mysql/help_keyword.MYD
./usr/local/mysql-5.5/data/mysql/help_keyword.MYI
./usr/local/mysql-5.5/data/mysql/help_keyword.frm
./usr/local/mysql-5.5/data/mysql/help_relation.MYD
./usr/local/mysql-5.5/data/mysql/help_relation.MYI
./usr/local/mysql-5.5/data/mysql/help_relation.frm
./usr/local/mysql-5.5/data/mysql/help_topic.MYD
./usr/local/mysql-5.5/data/mysql/help_topic.MYI
./usr/local/mysql-5.5/data/mysql/help_topic.frm
./usr/local/mysql-5.5/data/mysql/host.MYD
./usr/local/mysql-5.5/data/mysql/host.MYI
./usr/local/mysql-5.5/data/mysql/host.frm
./usr/local/mysql-5.5/data/mysql/ndb_binlog_index.MYD
./usr/local/mysql-5.5/data/mysql/ndb_binlog_index.MYI
./usr/local/mysql-5.5/data/mysql/ndb_binlog_index.frm
./usr/local/mysql-5.5/data/mysql/plugin.MYD
./usr/local/mysql-5.5/data/mysql/plugin.MYI
./usr/local/mysql-5.5/data/mysql/plugin.frm
./usr/local/mysql-5.5/data/mysql/proc.MYD
./usr/local/mysql-5.5/data/mysql/proc.MYI
./usr/local/mysql-5.5/data/mysql/proc.frm
./usr/local/mysql-5.5/data/mysql/procs_priv.MYD
./usr/local/mysql-5.5/data/mysql/procs_priv.MYI
./usr/local/mysql-5.5/data/mysql/procs_priv.frm
./usr/local/mysql-5.5/data/mysql/proxies_priv.MYD
./usr/local/mysql-5.5/data/mysql/proxies_priv.MYI
./usr/local/mysql-5.5/data/mysql/proxies_priv.frm
./usr/local/mysql-5.5/data/mysql/servers.MYD
./usr/local/mysql-5.5/data/mysql/servers.MYI
./usr/local/mysql-5.5/data/mysql/servers.frm
./usr/local/mysql-5.5/data/mysql/slow_log.CSM
./usr/local/mysql-5.5/data/mysql/slow_log.CSV
./usr/local/mysql-5.5/data/mysql/slow_log.frm
./usr/local/mysql-5.5/data/mysql/tables_priv.MYD
./usr/local/mysql-5.5/data/mysql/tables_priv.MYI
./usr/local/mysql-5.5/data/mysql/tables_priv.frm
./usr/local/mysql-5.5/data/mysql/time_zone.MYD
./usr/local/mysql-5.5/data/mysql/time_zone.MYI
./usr/local/mysql-5.5/data/mysql/time_zone.frm
./usr/local/mysql-5.5/data/mysql/time_zone_leap_second.MYD
./usr/local/mysql-5.5/data/mysql/time_zone_leap_second.MYI
./usr/local/mysql-5.5/data/mysql/time_zone_leap_second.frm
./usr/local/mysql-5.5/data/mysql/time_zone_name.MYD
./usr/local/mysql-5.5/data/mysql/time_zone_name.MYI
./usr/local/mysql-5.5/data/mysql/time_zone_name.frm
./usr/local/mysql-5.5/data/mysql/time_zone_transition.MYD
./usr/local/mysql-5.5/data/mysql/time_zone_transition.MYI
./usr/local/mysql-5.5/data/mysql/time_zone_transition.frm
./usr/local/mysql-5.5/data/mysql/time_zone_transition_type.MYD
./usr/local/mysql-5.5/data/mysql/time_zone_transition_type.MYI
./usr/local/mysql-5.5/data/mysql/time_zone_transition_type.frm
./usr/local/mysql-5.5/data/mysql/user.MYD
./usr/local/mysql-5.5/data/mysql/user.MYI
./usr/local/mysql-5.5/data/mysql/user.frm
./usr/local/mysql-5.5/data/performance_schema/cond_instances.frm
./usr/local/mysql-5.5/data/performance_schema/db.opt
./usr/local/mysql-5.5/data/performance_schema/events_waits_current.frm
./usr/local/mysql-5.5/data/performance_schema/events_waits_history.frm
./usr/local/mysql-5.5/data/performance_schema/events_waits_history_long.frm
./usr/local/mysql-5.5/data/performance_schema/events_waits_summary_by_instance.frm
./usr/local/mysql-5.5/data/performance_schema/events_waits_summary_by_thread_by_event_name.frm
./usr/local/mysql-5.5/data/performance_schema/events_waits_summary_global_by_event_name.frm
./usr/local/mysql-5.5/data/performance_schema/file_instances.frm
./usr/local/mysql-5.5/data/performance_schema/file_summary_by_event_name.frm
./usr/local/mysql-5.5/data/performance_schema/file_summary_by_instance.frm
./usr/local/mysql-5.5/data/performance_schema/mutex_instances.frm
./usr/local/mysql-5.5/data/performance_schema/performance_timers.frm
./usr/local/mysql-5.5/data/performance_schema/rwlock_instances.frm
./usr/local/mysql-5.5/data/performance_schema/setup_consumers.frm
./usr/local/mysql-5.5/data/performance_schema/setup_instruments.frm
./usr/local/mysql-5.5/data/performance_schema/setup_timers.frm
./usr/local/mysql-5.5/data/performance_schema/threads.frm
./usr/local/mysql-5.5/data/phpmyadmin/db.opt
./usr/local/mysql-5.5/data/phpmyadmin/pma_bookmark.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_bookmark.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_bookmark.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_column_info.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_column_info.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_column_info.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_designer_coords.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_designer_coords.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_designer_coords.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_history.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_history.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_history.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_pdf_pages.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_pdf_pages.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_pdf_pages.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_recent.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_recent.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_recent.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_relation.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_relation.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_relation.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_coords.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_coords.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_coords.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_info.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_info.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_info.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_uiprefs.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_uiprefs.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_table_uiprefs.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_tracking.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_tracking.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_tracking.frm
./usr/local/mysql-5.5/data/phpmyadmin/pma_userconfig.MYD
./usr/local/mysql-5.5/data/phpmyadmin/pma_userconfig.MYI
./usr/local/mysql-5.5/data/phpmyadmin/pma_userconfig.frm
./usr/local/mysql-5.5/my.ini
./usr/local/mysql-5.5/share/charsets/Index.xml
./usr/local/mysql-5.5/share/charsets/README
./usr/local/mysql-5.5/share/charsets/armscii8.xml
./usr/local/mysql-5.5/share/charsets/ascii.xml
./usr/local/mysql-5.5/share/charsets/cp1250.xml
./usr/local/mysql-5.5/share/charsets/cp1251.xml
./usr/local/mysql-5.5/share/charsets/cp1256.xml
./usr/local/mysql-5.5/share/charsets/cp1257.xml
./usr/local/mysql-5.5/share/charsets/cp850.xml
./usr/local/mysql-5.5/share/charsets/cp852.xml
./usr/local/mysql-5.5/share/charsets/cp866.xml
./usr/local/mysql-5.5/share/charsets/dec8.xml
./usr/local/mysql-5.5/share/charsets/geostd8.xml
./usr/local/mysql-5.5/share/charsets/greek.xml
./usr/local/mysql-5.5/share/charsets/hebrew.xml
./usr/local/mysql-5.5/share/charsets/hp8.xml
./usr/local/mysql-5.5/share/charsets/keybcs2.xml
./usr/local/mysql-5.5/share/charsets/koi8r.xml
./usr/local/mysql-5.5/share/charsets/koi8u.xml
./usr/local/mysql-5.5/share/charsets/latin1.xml
./usr/local/mysql-5.5/share/charsets/latin2.xml
./usr/local/mysql-5.5/share/charsets/latin5.xml
./usr/local/mysql-5.5/share/charsets/latin7.xml
./usr/local/mysql-5.5/share/charsets/macce.xml
./usr/local/mysql-5.5/share/charsets/macroman.xml
./usr/local/mysql-5.5/share/charsets/swe7.xml
./usr/local/mysql-5.5/share/english/errmsg.sys
./usr/local/php5/Microsoft.VC90.CRT.manifest
./usr/local/php5/ext/Microsoft.VC90.CRT.manifest
./usr/local/php5/ext/php_curl.dll
./usr/local/php5/ext/php_gd2.dll
./usr/local/php5/ext/php_mbstring.dll
./usr/local/php5/ext/php_mysql.dll
./usr/local/php5/ext/php_mysqli.dll
./usr/local/php5/ext/php_pdo_mysql.dll
./usr/local/php5/ext/php_pdo_sqlite.dll
./usr/local/php5/ext/php_soap.dll
./usr/local/php5/ext/php_sqlite3.dll
./usr/local/php5/ext/php_xdebug-2.2.0-5.3-vc9.dll
./usr/local/php5/ext/php_xsl.dll
./usr/local/php5/libeay32.dll
./usr/local/php5/license.txt
./usr/local/php5/msvcr90.dll
./usr/local/php5/php-cgi.exe
./usr/local/php5/php.exe
./usr/local/php5/php.ini
./usr/local/php5/php5apache2_2.dll
./usr/local/php5/php5ts.dll
./usr/local/php5/ssleay32.dll
./usr/local/sbin/php.exe
./usr/local/sbin/php5.exe
./usr/local/sbin/sendmail.exe
./usr/sbin/php.exe
./usr/sbin/php5.exe
./usr/sbin/sendmail.exe
./INSTALL.bat
./README.txt
