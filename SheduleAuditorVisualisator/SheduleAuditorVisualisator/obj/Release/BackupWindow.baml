   M S B A M L   `   `   `  ����   SheduleAuditorVisualisator-    'SheduleAuditorVisualisator.BackupWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -     �Name$  BackupControlWindow�� � Title$9 3Работа с резервными копиями��$��353.387��$��430.933�� � 
ResizeMode$ NoResize=� � WindowStartupLocation$ CenterOwner=�.���  � RowDefinitions �� $
��109* ��� $	��50* �.+��� -    ��Name$ 
BackupTBox��$��0,0,9.4,68.6q� �� TextWrapping$
 Wrap=�$��Center=�$��Right=�$	��197��$��26��$��Bottom=�$��1���� $4��.Название резервной копии��$��10,0,0,68.6q�$��Center=�$
��Left=�$	��165��$��1��$��26��$��Bottom=��� $<��6Существующие резервные копии��$��10,10,9.6,9.6q�.��� $��0,10,-13.2,-22.2q�.+��� -    ��Name$ ExistBackups��$��	1,0,13,24q� �� SelectedValuePath$ strName��	 �� SelectedValue	 �� *	strName+
 �� Mode$
 TwoWay=����� .R��� ��`�  �� StringFormat$ 	{0} ({1})��.1���  �� Path$ strName��� $ 
backupTime��� -    ��Name$ CancelButton��$��Закрыть��$��219,74.2,0,0q�$	��Top=�$��1q�$��1��$��19��$
��Left=�$	��189���� -   $ 	SoRButton��$2��,Создать резервную копию��$��10,50.2,0,0q�$	��Top=�$��1q�$��1��$��19��$
��Left=�$	��197������  �� Triggers ��  �� Binding ��  �� ElementName$ 
BackupTBox��$ Text.Length� �� Value 0.a���  �� Property � {� �� Value .  �� -   $ DeleteBackup��$2��,Удалить резервную копию��$��219,50.2,0,0q�$	��Top=�$��1q�$��1��$��19��$
��Left=�$	��189������  ��  �� $ ExistBackups��$ SelectedIndex� -1.a���  � {� .  �� -   $ LoadBackupButton��$6��0Загрузить резервную копию��$��10,74.2,0,0q�$��1q�$��1��$��19��$	��Top=�$
��Left=�$	��197������  ��  �� $ ExistBackups��$ SelectedIndex� -1.a���  � {� .  