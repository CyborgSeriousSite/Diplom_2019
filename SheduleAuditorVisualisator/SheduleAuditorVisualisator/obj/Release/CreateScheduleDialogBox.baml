   M S B A M L   `   `   `  ����   SheduleAuditorVisualisator8    2SheduleAuditorVisualisator.CreateScheduleDialogBox   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     X TXceed.Wpf.Toolkit, Version=3.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit    � Title$)  #Назначение занятия��$��499.2��$��333.6�� � 
ResizeMode$ NoResize=�.��� -    � ColumnDefinitions �� $��1* ��� $��1* � � RowDefinitions �� $
��313* ��� $
��117* ��� $	��40* �.+��� $��Группа��$
��Left=�$��
10,7.2,0,0q�$	��Top=�$	��143��$��26��$��1���� $ ��Преподаватель��$
��Left=�$��10,33.2,0,0q�$	��Top=�$��26��$	��143��$��1���� $��Дисциплина��$
��Left=�$��10,59.2,0,0q�$	��Top=�$	��143��$��26��$��1���� $��Аудитория��$
��Left=�$��10,85.2,0,0q�$	��Top=�$	��143��$��26��$��1��&   System.Windows.Controls.Calendar  -     Name$ CalendarSched��$��
0,31,0.2,0q�$	��Top=�$	��166��   FirstDayOfWeek$ Monday=�   IsTodayHighlighted .  $��2���� $+��%Дата и время занятия��$	��Top=�$��26��$��100,3,99.2,0q�$��Center=�$	��128��$��2���� $	��104��$��10,202,10.2,0q�$	��Top=�$��2��.@��� $)��#Упрощенный вариант��.��� ���	#FFE5E5E5.+��� $��Время занятия��$��	10,26,0,0q�$	��Top=�$��28��$
��Left=�$��94���� -    ��Name$ edtTime��$��
0,26,9.6,0q�$	��Top=�$��28��$��Right=�$	��176���� $+��%Расширенный вариант��.��� ���	#FFE5E5E5.+��� $,��&Время начала занятия��$	��Top=�$��28��$
��Left=�$	��132��$��9,6,0,0q�"  Xceed.Wpf.Toolkit.TimePicker  -     Name$ pStartTimespanbox��$��	0,6,9.6,0q�$��Right=�$	��129��$��28��$	��Top=��� $2��,Время окончания занятия��$��9,39,139.6,0q�$	��Top=�$��29��  -   $ pEndTimespanbox��$��
0,40,9.6,0q�$��Right=�$	��129��$��28��$	��Top=��� -   $ edtGroup��$��0,10.2,10.2,0q�$��1��$	��Top=�$��1��$��22��$��Right=�$	��144���� -   $ 
edtTeacher��$��0,37.2,10.2,0q�$��1��$	��Top=�$��1��$��22��$��Right=�$	��144���� -   $ 
edtSubject��$��0,63.2,10.2,0q�$��1��$	��Top=�$��1��$��22��$��Right=�$	��144���� -	   $ edtRoom��$��0,89.2,10.2,0q�$��1��$	��Top=�$��1��$��22��$��Right=�$	��144���� -
   	 ��Name$	 AcceptButton��$��Назначить��$
��Left=�$��10,10.4,0,0q�$	��Top=�$	��143��$��2���� -   $	 CancelButton��$��Отмена��$��0,10.4,10.2,0q�$	��Top=�$��2��$��1��$��Right=�$	��144��