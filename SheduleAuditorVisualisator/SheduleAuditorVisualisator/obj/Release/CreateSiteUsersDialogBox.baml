   M S B A M L   `   `   `  ����   SheduleAuditorVisualisator9    3SheduleAuditorVisualisator.CreateSiteUsersDialogBox   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$5  /Регистрация пользователя��$��296.71��$��306.461�� � 
ResizeMode$ NoResize=� � WindowStartupLocation$ CenterOwner=� � WindowStyle$ ThreeDBorderWindow=�.��� $��0,0,0,0q�.+��� $��
Логин��$��	10,10,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -    ��Name$ LoginBox��$��26��$��	0,10,12,0q� �� TextWrapping$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��141���� -    ��Name$ AcceptButton��$��Создать��$
��Left=�$��10,0,0,10.4q�$��Bottom=�$	��131������  �� Triggers ��  �� Binding �� 	 �� ElementName$	 LoginBox��
 �� Path$
 Text.Length� �� Value 0.a���  �� Property � {� �� Value .  ��  �� $	 PasswordBox��$
 Text.Length� 0.a���  � {� .  ��  �� $	 NameBox��$
 Text.Length� 0.a���  � {� .  ��  �� $	 GroupBox��$
 SelectedIndex� -1.a���  � {� .  �� -   $ CancelButton��$��Отмена��$��Right=�$��0,0,10,10.4q�$	��131��$��19��$��Bottom=��� $+��%Группа пользователя��$��
10,141,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -    ��Name$ GroupBox��$��
0,140,12,0q�$	��Top=�$��Right=�$	��141��$��27���� $��Пароль��$��	10,36,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -   $ PasswordBox��$��26��$��	0,36,12,0q�$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��141���� $��Имя��$��	10,62,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -   $ NameBox��$��26��$��	0,62,12,0q�$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��141���� $��Фамилия��$��	10,88,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -   $ Name2Box��$��26��$��	0,88,12,0q�$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��141���� $��Отчество��$��
10,114,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -   $ Name3Box��$��26��$��
0,114,12,0q�$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��141���� $��Телефон��$��
10,167,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -	   $ PhoneBox��$��26��$��
0,167,12,0q�$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��141���� $��e-mail��$��
10,193,0,0q�$	��Top=�$��26��$
��Left=�$	��137���� -
   $ EmailBox��$��26��$��
0,193,12,0q�$
 Wrap=�$	��Top=�$��Center=�$��Right=�$	��141��