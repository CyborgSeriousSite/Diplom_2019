   M S B A M L   `   `   `  ����   SheduleAuditorVisualisator4    .SheduleAuditorVisualisator.CreateRoomDialogBox   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$)  #Создание аудитории��$��127.777��$��209.261�� � 
ResizeMode$ NoResize=� � WindowStartupLocation$ CenterOwner=� � WindowStyle$ ThreeDBorderWindow=�.��� $��0,0,0,0q�.+��� $#��Номер аудитории��$��
10,10,67,0q�$	��Top=�$��26���� -    ��Name$ ROOMNUMBERBOX��$��26��$��126,10,12.8,0q� �� TextWrapping$
 Wrap=�$	��Top=�$��Center=��� -    ��Name$ AcceptButton��$��Создать��$
��Left=�$��	10,56,0,0q�$	��Top=�$��75������  �� Triggers ��  �� Binding �� 	 �� ElementName$	 ROOMNUMBERBOX��
 �� Path$
 Text.Length� �� Value 0.a���  �� Property � {� �� Value .  �� -   $ CancelButton��$��Отмена��$
��Left=�$��
105,56,0,0q�$	��Top=�$��75��