   M S B A M L   `   `   `  ����  SheduleAuditorVisualisator7    1SheduleAuditorVisualisator.CreateTeacherDialogBox   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$5  /Добавление преподавателя��5   	   $��127.777��6*   $��306.461��6;    � 
ResizeMode$ NoResize=�6K    � WindowStartupLocation$ CenterOwner=�6a    � WindowStyle$ ThreeDBorderWindow=�6�   .��5      � $��0,0,0,0q�6   .+�5   
   �� $'��!ФИО преподавателя��6   $��	10,10,0,0q�6,   $	��Top=�6?   $��26��6W   $
��Left=�6c   $	��137��6~   �� 5   
   -   5         ��Name$ FIOBox��5      $��26��6"   $��	0,10,12,0q�6.    �� TextWrapping$
 Wrap=�6A   $	��Top=�6U   $��Center=�6m   $��Right=�6�   $	��141��6�   �� 5   
   -   5         ��Name$ AcceptButton��5      $��Создать��6'   $
��Left=�69   $��	10,56,0,0q�6T   $	��Top=�6g   $	��131��6   ��5	      �� 5
       �� Triggers 5      �� 5       �� Binding 6&   �� 	 �� ElementName$	 FIOBox��
 �� Path$
 Text.Length� �� Value 06`   .a�5      ��  �� Property � {� �� Value .  6A   5      5      5      �� 5   
   -   5        $ CancelButton��5      $��Отмена��6'   $��Right=�68   $��	0,56,10,0q�6T   $	��Top=�6g   $	��131��6   6�   5      5      