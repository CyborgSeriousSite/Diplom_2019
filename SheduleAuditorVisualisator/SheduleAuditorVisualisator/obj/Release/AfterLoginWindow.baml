   M S B A M L   `   `   `  ���� C  ?Dragablz, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null5(clr-namespace:Dragablz;assembly=DragablzDragablz  W SMicrosoft.CSharp, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3aiFclr-namespace:Microsoft.CSharp.RuntimeBinder;assembly=Microsoft.CSharpMicrosoft.CSharp.RuntimeBinder  SheduleAuditorVisualisator1   +SheduleAuditorVisualisator.AfterLoginWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     =dragablz(clr-namespace:Dragablz;assembly=Dragablz     X TXceed.Wpf.Toolkit, Version=3.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  J	 FWpfAnimatedGif, Version=1.4.18.0, Culture=neutral, PublicKeyToken=null,gif"http://wpfanimatedgif.codeplex.com 	 :d2http://schemas.microsoft.com/expression/blend/2008 	 Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006 	 ZRuntimeBinderFclr-namespace:Microsoft.CSharp.RuntimeBinder;assembly=Microsoft.CSharp 	 -     �Name$  
MainWindow�� � Title$# Schedule Auditor Visualizator�� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ CanResizeWithGrip=�$	��640�� � DataContext ��  �� RelativeSource �� *Self+.��� $��0,0,0,0q�.+�� -    �Name$ MainWindowGrid��$��
0,0,-0.4,0q� � RowDefinitions �� $
��auto ��� $��* �.+�o� .@�m� $��Файл��.@�m� -    m�Name$ MenuBackupButton��$9��3Работа с резервными копиями��	 m� InputGestureText$	 Ctrl+B���� m� -   $ PreferencesButton��$-��'Настройки приложения��$	 Ctrl+P��{�.  �� m� -   $ MenuDisconnectButton��$0��*Отключиться от сервера��$	 Ctrl+D��m� -   $ MenuExitButton��$��
Выход��m� $"��Редактирование��.@�m� 
 m� Command$
 ApplicationCommands.Undo��$��Отменить��m� $
 ApplicationCommands.Redo��$��Повторить���� m� $
 ApplicationCommands.Cut��$��Вырезать��m� $
 ApplicationCommands.Copy��$��Копировать��m� $
 ApplicationCommands.Paste��$��Вставить���� m� $ 
 ApplicationCommands.Delete��$��Удалить��m� $��Сервер��.@�m� -   $ UpdateServerTableButton��$	 F6��$/��)Обновить БД на сервере��m� -   $ LoadServerTableButton��$7��1Перезагрузить БД с сервера��$	 F9��   Dragablz.TabablzControl  -	     Name$ TabsControlElement��$��10,9.6,9.6,10q�$��1�� � UseLayoutRounding .   J� RenderTransformOrigin$ 0.5,0.5&�z�V� .~��� �� �� T�    InterTabController !   Dragablz.InterTabController  .@��� -
    ��Name$ ClassRoomsTab��$��Аудитории��.��� -    � ColumnDefinitions �� $
��166* ��� $
��101* �.+�&   System.Windows.Controls.DataGrid  -     Name$ ClassRoomsDatagrid��   AutoGenerateColumns .  $��	0,0,8,0.4q�   CanUserResizeColumns .     CanUserReorderColumns .     ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ *    CanUserResizeRows .     CanUserAddRows .     Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ ID��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *iID+  $ 
Номер�� �� *	iNumber+  $ X�� �� *	iCoordX+  $ Y�� �� *	iCoordY+  $ Ширина�� �� *iWidth+  $ Высота�� �� *	iHeight+  $  Разновидность�� �� *iType+�� -    ��Name$ 	ParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$	��232��$	��Top=�.��� $��0,10,-2.8,-2.4q� �� �� .+��� $��0,0,6.2,0.4q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��
Номер��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Координата X��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Координата Y��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Ширина��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Высота��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $ ��Разновидность��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��0.2,0,5.6,10q�$��1��.+��� -    ��Name$ edtIDRM��$��27�� �� TextWrapping$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+ �� ElementName$ ClassRoomsDatagrid�� �� Mode$ TwoWay=��� -   $ edtRoomNumber��$��27��$
 Wrap=�$��
0,0,-0.6,0q����� *SelectedItem.iNumber+$ ClassRoomsDatagrid��$ TwoWay=��� -   $ edtRoomCoordX��$��27��$
 Wrap=�$��
0,0,-0.6,0q����� *SelectedItem.iCoordX+$ ClassRoomsDatagrid��$ TwoWay=��� -   $ edtRoomCoordY��$��27��$
 Wrap=�$��
0,0,-0.6,0q����� *SelectedItem.iCoordY+$ ClassRoomsDatagrid��$ TwoWay=��� -   $ edtRoomWidth��$��27��$
 Wrap=�$��
0,0,-0.6,0q����� *SelectedItem.iWidth+$ ClassRoomsDatagrid��$ TwoWay=��� -   $ edtRoomHeight��$��27��$
 Wrap=�$��
0,0,-0.6,0q����� *SelectedItem.iHeight+$ ClassRoomsDatagrid��$ TwoWay=��� -     ��Name$  edtRoomType��$��27��$��	0,0,0.4,0q�! �� 
IsReadOnly! . " �� SelectedValuePath$	" Tag��# �� SelectedValue# �� *SelectedItem.iType+$ ClassRoomsDatagrid��$ TwoWay=�.@��� $'��!Простая аудитория��
$ � Tag$$ 0���� $+��%Техническая комната��$$ 3���� $)��#Компьютерный класс��$$ 4���� $0��*Аудитория с проектором��$$ 5���� -   % ��Name$% DeleteEntryButtonRM��$'��!Удалить аудиторию��$��1��$��4,261,10.8,0q�& � ToolTip$�& �Удаляет выбранную аудиторию из базы данных. Можно также активировать хоткеем (Delete)��$��19��$	��Top=����� ' �� Triggers' �� ( �� Binding( �� $ ClassRoomsDatagrid��) �� Path$) SelectedIndex�* �� Value* -1.a��� + �� Property+ � {�, �� Value, .  �� -   $% VisualEditorButton��$2��,К визуальному редактору��$��1��$��4,285,10.8,0q�$�& �Кнопка для переключения между режимами редактирования. Можно также активировать хоткеем (C)��$��20��$	��Top=�� -   $ VisualFieldGrid�� �� $
��384* ��� $	��31* �.+��� -   - ��Name$- CanvasField��$��	0,0,8,0.2q�
�������}�. $y�Hidden=�a� -   . a�Name$. VisualEditorToolbar��$��	0,0,8,0.4q�$��31��$��Bottom=�$��2��$y�Hidden=�.+�c� $��31��.@��� -   $% PrevLevelButton��$��<��$��
0,0,0,-2.4q�$��28���� -   $ LevelTextBox��$��1��$��
0,0,0,-2.4q�$��59��
�������$��Center=�$��Center=�/ �� 	MaxLength$/ 1��$��Center=�$��Center=��� -   $% NextLevelButton��$��>��$��
0,0,0,-2.4q�$��28���� �� -   $#��Создать комнату��$��24��$��
0,2,0,-0.4q�$	��108���� -   $% CreateEntryButtonRM��$'��!Создать аудиторию��$��1��$��4,237,10.8,0q�$�& �Создать новую аудиторию в базе данных. Можно также активировать хоткеем (Insert)��$��19��$	��Top=��� -   $ ScheduleTab��$��Расписание��.���  �� $
��166* ��� $
��101* �.+�  -    $ SheduleDatagrid�� .  $��	0,0,8,0.4q� .   .  $ *  .   .     $ ID�� �� *iID+4  .System.Windows.Controls.DataGridComboBoxColumn  0   DisplayMemberPath$0 strName��1   SelectedValuePath$	1 iID��$ Группа��2   SelectedValueBinding2 �� *
iGroupID+3   ElementStyle3 �� 4 �� 
TargetType"4 ��.��� + � ��, �� $) DataContext.GroupsDB_CBOX� �� 5 �� AncestorType"5 �6   EditingElementStyle6 �� "4 ��.��� + � ��, �� $) DataContext.GroupsDB_CBOX� �� "5 �  $0 strName��$	1 iID��$ Дисциплина��2 �� *
iSubjectID+3 �� "4 ��.��� + � ��, �� $!) DataContext.SubjectsDB_CBOX� �� "5 �6 �� "4 ��.��� + � ��, �� $!) DataContext.SubjectsDB_CBOX� �� "5 �  $ Время начала�� �� *
dStartTime+  $ Время конца�� �� *
dEndTime+  $0 iNumber��$	1 iID��$ Аудитория��2 �� *iClassRoomID+3 �� "4 ��.��� + � ��, �� $#) DataContext.ClassRoomsDB_CBOX� �� "5 �6 �� "4 ��.��� + � ��, �� $#) DataContext.ClassRoomsDB_CBOX� �� "5 �  $0 strFIO��$	1 iID��$  Преподаватель��2 �� *
iTeacherID+3 �� "4 ��.��� + � ��, �� $) DataContext.Prepod_CBOX� �� "5 �6 �� "4 ��.��� + � ��, �� $) DataContext.Prepod_CBOX� �� "5 ��� -!   $ ScheduleParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$	��173��$	��Top=�.��� $��0,10,-3.2,-12q� �� �� .+��� $��0,0,6.2,0.4q�.+��� -"   7 ��Name$7 IDSlabel��$��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Группа��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Аудитория��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Дисциплина��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $ ��Преподаватель��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��0.2,0,5.6,10q�$��1��.+��� -#   $ edtID��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ SheduleDatagrid��$ TwoWay=��� -$   $  edtGroup��$��27��$	" iID��# �� *SelectedItem.iGroupID+$ SheduleDatagrid��$ TwoWay=��� -%   $  edtRoom��$��27��$	" iID��# �� *SelectedItem.iClassRoomID+$ SheduleDatagrid��$ TwoWay=��� -&   $  
edtSubject��$��27��$	" iID��# �� *SelectedItem.iSubjectID+$ SheduleDatagrid��$ TwoWay=��� -'   $  
edtTeacher��$��27��$	" iID��# �� *SelectedItem.iTeacherID+$ SheduleDatagrid��$ TwoWay=��� -(   $ 
VariantBox��$2��,Особые параметры (Время)��$��6,178,8.8,0q�$��1��$��99��$	��Top=�.��� $��0,10,-3.2,-12.2q�.+��� $��0,0,0,10q�.+�� $��	0,0,0.4,0q�$��16��$	��Top=� �� �� .+�	� -)   8 	�Name$8 
rbSVariant��9 	� 	GroupName$9 VariantSelector��$)��#Упрощенный вариант��$��2��$��
0,0,-0.8,0q�: d� 	IsChecked$
: TrueY�	� -*   $8 
rbEVariant��$9 VariantSelector��$+��%Расширенный вариант��$��1��� -+   $ SimpleTimeBox��$��55��$	��Top=� �� �� .+��� $��Дата занятия��$��0,-2,0,0q�$	��Top=�$��28��(	  "System.Windows.Controls.DatePicker	  -,   ; 	 Name$; dpickerSimple��$��1��$	��Top=�$��26��< 	  IsTodayHighlighted< . �� $��Время занятия��$��
0,26,0,-28q�$	��Top=�$��28���� --   $  edtTime��$��1��$��0,26,0,0q�$	��Top=�$��28��� -.   $ ExtendedTimeBox��$��81��$	��Top=�$y�	Collapsed=� �� �� .+��� $��Дата занятия��$��0,-2,0,0q�$	��Top=�$��28��	  -/   $; dpickerExtended��$��1��$	��Top=�$��26��< . �� $,��&Время начала занятия��$��
0,26,0,-28q�$	��Top=�$��28��"
  Xceed.Wpf.Toolkit.TimePicker
  -0   = 
 Name$= pStartTimespanbox��$��1��$��	0,26,0,28q��� $2��,Время окончания занятия��$��
0,54,0,-27q�$	��Top=�$��28��
  -1   $= pEndTimespanbox��$��1��$��0,53,0,2q��� -2   $% CreateEntryButton��$'��!Назначить занятие��$��1��$��6,282,8.8,0q�$�& ~Создать занятие в базе данных. Можно также активировать хоткеем (Insert)��$��19��$	��Top=��� -3   $% DeleteEntryButton��$#��Удалить занятие��$��1��$��6,308,8.8,0q�$��19��$	��Top=����� ' �� ( �� $ SheduleDatagrid��$) SelectedIndex�* -1.a��� + � {�, .  �� -4   $ SubjectsTab��$��Дисциплины��.���  �� $
��166* ��� $
��101* �.+�  -5   $ SubjectsDatagrid�� .  $��	0,0,8,0.4q� .   .  $ *  .   .     $ ID�� �� *iID+  $ Название�� �� *	strName+�� -6   $ SubjectsParamBox��$��Параметры��$��
4,0,10.8,0q�$��1��$��94��$	��Top=�.��� $��0,10,-2.8,-2.4q� �� �� .+��� $��
0,0,8.6,11q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Название��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��1.4,0,5.6,10q�$��1��.+��� -7   $ edtIDSBJ��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ SubjectsDatagrid��$ TwoWay=��� -8   $ 
edtNameSBJ��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strName+$ SubjectsDatagrid��$ TwoWay=��� -9   $% CreateEntryButtonSBJ��$)��#Создать дисциплину��$��1��$��5,102,9.8,0q�$�& �Создать дисциплину в базе данных. Можно также активировать хоткеем (Insert)��$��19��$	��Top=��� -:   $% DeleteEntryButtonSBJ��$)��#Удалить дисциплину��$��1��$��5,126,9.8,0q�$��19��$	��Top=����� ' �� ( �� $ SubjectsDatagrid��$) SelectedIndex�* -1.a��� + � {�, .  �� -;   $ 	GroupsTab��$��Группы��.���  �� $
��166* ��� $
��101* �.+�  -<   $ GroupsDatagrid�� .  $��	0,0,8,0.4q� .   .  $ *  .   .     $ ID�� �� *iID+  $# Название группы�� �� *	strName+  $0 strName��$	1 iID��$  Подразделение��2 �� *	iPodrazID+3 �� "4 ��.��� + � ��, �� $") DataContext.PodrazdelDB_CBOX� �� "5 �6 �� "4 ��.��� + � ��, �� $") DataContext.PodrazdelDB_CBOX� �� "5 ��� -=   $ GroupsParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$	��121��$	��Top=�.��� $��0,10,-2.8,-2.4q� �� �� .+��� $��
0,0,8.6,11q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Название��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $ ��Подразделение��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��1.4,0,5.6,10q�$��1��.+��� ->   $ 	edtIDGRPS��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ GroupsDatagrid��$ TwoWay=��� -?   $ edtNameGRPS��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strName+$ GroupsDatagrid��$ TwoWay=��� -@   $  edtPodrazGRPS��$��27��$	" iID��# �� *SelectedItem.iPodrazID+$ GroupsDatagrid��$ TwoWay=��� -A   $% CreateEntryButtonGRPS��$!��Создать группу��$��1��$��4,124,9.8,0q�$��19��$	��Top=��� -B   $% DeleteEntryButtonGRPS��$!��Удалить группу��$��1��$��4,148,9.8,0q�$��19��$	��Top=����� ' �� ( �� $ GroupsDatagrid��$) SelectedIndex�* -1.a��� + � {�, .  �� -C   $ TeachersTab��$ ��Преподаватели��.���  �� $
��166* ��� $
��101* �.+�  -D   $ PrepodDataGrid�� .  $��	0,0,8,0.4q� .   .  $ *  .   .     $ ID�� �� *iID+  $ ФИО�� �� *strFIO+�� -E   $ TeacherParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$��92��$	��Top=�.��� $��0,10,-2.4,-30.8q� �� �� .+��� $��0,0,4.8,10.2q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��ФИО��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��1.2,0,5.6,10.2q�$��1��.+��� -F   $ 	edtIDPREP��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ PrepodDataGrid��$ TwoWay=��� -G   $ edtNamePREP��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strFIO+$ PrepodDataGrid��$ TwoWay=��� -H   $% CreateEntryButtonPREP��$1��+Добавить преподавателя��$��1��$��
5,97,8.8,0q�$��19��$	��Top=��� -I   $% DeleteEntryButtonPREP��$-��'Убрать преподавателя��$��1��$��5,121,9.8,0q�$��19��$	��Top=����� ' �� ( �� $ PrepodDataGrid��$) SelectedIndex�* -1.a��� + � {�, .  �� -J   $ ScheduleTimeTab��$��Время занятий��.���  �� $
��166* ��� $
��101* �.+�  -K   $ SheduleTimeDatagrid�� .  $��	0,0,8,0.4q� .   .  $ *  .   .     $ ID�� �� *iID+  $ Название�� �� *strDescription+  $ Время начала�� �� *
dStartTime+  $# Время окончания�� �� *
dEndTime+�� -L   $ ScheduleTimeParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$	��147��$	��Top=�.��� $��0,10,-3.2,-22.8q� �� �� .+��� $��0,0,4.8,10.2q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Наименование��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Время начала��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $#��Время окончания��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��1.2,0,5.6,10.2q�$��1��.+��� -M   $ edtIDSD��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ SheduleTimeDatagrid��$ TwoWay=��� -N   $ 	edtDESCSD��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strDescription+$ SheduleTimeDatagrid��$ TwoWay=�
  -O   $= edtSTSD��$��27��$��	0,0,0.2,0q�
  -P   $= edtETSD��$��27��$��	0,0,0.2,0q��� -Q   $% CreateEntryButtonST��$*��$Добавить время пары��$��1��$��5,152,8.8,0q�$��19��$	��Top=��� -R   $% DeleteEntryButtonST��$(��"Удалить время пары��$��1��$��6,176,8.8,0q�$��19��$	��Top=����� ' �� ( �� $ SheduleTimeDatagrid��$) SelectedIndex�* -1.a��� + � {�, .  �� -S   $ PodrazdelTab��$ ��Подразделения��.���  �� $
��166* ��� $
��101* �.+�  -T   $ PodrazdelDataGrid�� .  $��	0,0,8,0.4q� .   .  $ *  .   .     $ ID�� �� *iID+  $ Название�� �� *	strName+�� -U   $ PodrazdelParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$��92��$	��Top=�.��� $��0,10,-2.4,-30.8q� �� �� .+��� $��0,0,4.8,10.2q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Название��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��1.2,0,5.6,10.2q�$��1��.+��� -V   $ 	edtIDPODR��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ PodrazdelDataGrid��$ TwoWay=��� -W   $ edtNamePODR��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strName+$ PodrazdelDataGrid��$ TwoWay=��� -X   $% CreateEntryButtonPODR��$/��)Создать подразделение��$��1��$��
5,97,8.8,0q�$��19��$	��Top=��� -Y   $% DeleteEntryButtonPODR��$/��)Удалить подразделение��$��1��$��5,121,9.8,0q�$��19��$	��Top=����� ' �� ( �� $ PodrazdelDataGrid��$) SelectedIndex�* -1.a��� + � {�, .  �� -Z   $ SiteUsersTab��$)��#Пользователи сайта��.���  �� $
��166* ��� $
��101* �.+�  -[   $ SiteUsersDataGrid�� .  $��	0,0,8,0.4q�>   FrozenColumnCount$> 4�� .   .  $ *  .   .     $ ID�� �� *iID+  $ 
Логин�� �� *ULogin+  $ Пароль�� �� *	UPassword+  $ Имя�� �� *	strName+  $ Фамилия�� �� *
strName2+  $ Отчество�� �� *
strName3+  $0 strName��$	1 iID��$+ %Группа пользователя��2 �� *iGroup+3 �� "4 ��.��� + � ��, �� $!) DataContext.SiteGroups_CBOX� �� "5 �6 �� "4 ��.��� + � ��, �� $!) DataContext.SiteGroups_CBOX� �� "5 �  $ Телефон�� �� *	strNumber+  $ e-mail�� �� *
strEmail+�� -\   $ SiteUsersParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$	��276��$	��Top=�.��� $��0,10,-3.2,-22.6q� �� �� .+��� $��0,0,4.8,10.2q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��
Логин��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Пароль��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Имя��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Фамилия��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Отчество��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $+��%Группа пользователя��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Телефон��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��e-mail��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��1.2,0,5.6,10.2q�$��1��.+��� -]   $ edtIDSU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ SiteUsersDataGrid��$ TwoWay=��� -^   $ 
edtLoginSU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.ULogin+$ SiteUsersDataGrid��$ TwoWay=��� -_   $ edtPasswordSU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.UPassword+$ SiteUsersDataGrid��$ TwoWay=��� -`   $ 	edtNameSU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strName+$ SiteUsersDataGrid��$ TwoWay=��� -a   $ 
edtName2SU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strName2+$ SiteUsersDataGrid��$ TwoWay=��� -b   $ 
edtName3SU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strName3+$ SiteUsersDataGrid��$ TwoWay=��� -c   $  
edtGroupSU��$��27��$	" iID��# �� *SelectedItem.iGroup+$ SiteUsersDataGrid��$ TwoWay=��� -d   $ 
edtPhoneSU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strNumber+$ SiteUsersDataGrid��$ TwoWay=��� -e   $ 	edtMailSU��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strEmail+$ SiteUsersDataGrid��$ TwoWay=��� -f   $% CreateEntryButtonSU��$?��9Зарегистрировать пользователя��$��1��$��3,281,10.8,0q�$��19��$	��Top=��� -g   $% DeleteEntryButtonSU��$-��'Удалить пользователя��$��1��$��3,305,10.8,0q�$��19��$	��Top=����� ' �� ( �� $ SiteUsersDataGrid��$) SelectedIndex�* -1.a��� + � {�, .  �� -h   $ SiteGroupsTab��$��Группы сайта��.���  �� $
��166* ��� $
��101* �.+�  -i   $ SiteGroupsDataGrid�� .  $��	0,0,8,0.4q� .   .  $ *  .   .     $ ID�� �� *iID+  $ Название�� �� *	strName+�� -j   $ SiteGroupsParamsBox��$��Параметры��$��
4,0,10.8,0q�$��1��$��92��$	��Top=�.��� $��0,10,-2.4,-30.8q� �� �� .+��� $��0,0,4.8,10.2q�.+��� $��ID��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��Название��$��27��$��	0,0,0.2,0q�$��2,1,3,1q���Z� �� $��1.2,0,5.6,10.2q�$��1��.+��� -k   $ 
edtIDSGRPS��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.iID+$ SiteGroupsDataGrid��$ TwoWay=��� -l   $ edtNameSGRPS��$��27��$
 Wrap=�$��	0,0,0.2,0q����� *SelectedItem.strName+$ SiteGroupsDataGrid��$ TwoWay=��� -m   $% CreateEntryButtonSGRPS��$!��Создать группу��$��1��$��
5,97,8.8,0q�$��19��$	��Top=��� -n   $% DeleteEntryButtonSGRPS��$!��Удалить группу��$��1��$��5,121,9.8,0q�$��19��$	��Top=����� ' �� ( �� $ SiteGroupsDataGrid��$) SelectedIndex�* -1.a��� + � {�, .  � -o   $ ProcessingGrid��$��
0,0,-0.4,0q�$y�	Collapsed=�.+��� ���	#BFCBCBCB
���   �$��0,0,0,0q��� -p   ? ��Name$? LoadingIcon��" 	 WpfAnimatedGif.ImageBehavior@   AnimatedSource$/@ )pack://application:,,,/Images/Loading.gif��$/��)pack://application:,,,/Images/Loading.gif��A   RepeatBehavior$A Forever��$��Center=�$��34��$��0q�$��Center=�$��34���� $-��'Применение изменений��$��10,10,0,327.4q�$��20(�$��Center=�$
��1008��$��Bottom=�$��Center=��� -q   $7 ProcessingDisplayingSteps��$	��...��$��10,322,10,10.4q�$��20(�$��Center=�$��Center=�$	��998��