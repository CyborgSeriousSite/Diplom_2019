   M S B A M L   `   `   `  ����   SheduleAuditorVisualisator9    3SheduleAuditorVisualisator.CreatePodrazdelDialogBox   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$1  +Создание подразделения��$��127.777��$��383.261�� � 
ResizeMode$ NoResize=� � WindowStartupLocation$ CenterOwner=� � WindowStyle$ ThreeDBorderWindow=�.��� $��0,0,0,0q�.+��� $1��+Название подразделения��$��	10,10,0,0q�$	��Top=�$��26��$
��Left=�$	��166���� -    ��Name$ PodrazdelNameBox��$��26��$��
0,10,9.8,0q� �� TextWrapping$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��191���� -    ��Name$ AcceptButton��$��Создать��$
��Left=�$��	10,56,0,0q�$	��Top=�$	��166������  �� Triggers ��  �� Binding �� 	 �� ElementName$	 PodrazdelNameBox��
 �� Path$
 Text.Length� �� Value 0.a���  �� Property � {� �� Value .  �� -   $ CancelButton��$��Отмена��$��Right=�$��
0,56,9.8,0q�$	��Top=�$	��166��