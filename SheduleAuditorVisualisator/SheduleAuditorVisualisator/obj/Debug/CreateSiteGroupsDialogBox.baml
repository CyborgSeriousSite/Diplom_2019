   M S B A M L   `   `   `  ����  SheduleAuditorVisualisator:    4SheduleAuditorVisualisator.CreateSiteGroupsDialogBox   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$!  Создать группу��5   	   $��127.777��6    $��383.261��61    � 
ResizeMode$ NoResize=�6A    � WindowStartupLocation$ CenterOwner=�6W    � WindowStyle$ ThreeDBorderWindow=�6{   .��5      � $��0,0,0,0q�6   .+�5   
   �� $#��Название группы��6   $��	10,10,0,0q�6*   $	��Top=�6=   $��26��6U   $
��Left=�6a   $	��166��6|   �� 5   
   -   5         ��Name$ GroupNameBox��5      $��26��6(   $��
0,10,9.8,0q�64    �� TextWrapping$
 Wrap=�6H   $	��Top=�6\   $��Center=�6t   $��Right=�6�   $	��191��6�   �� 5   
   -   5         ��Name$ AcceptButton��5      $��Создать��6'   $
��Left=�69   $��	10,56,0,0q�6T   $	��Top=�6g   $	��166��6   ��5	      �� 5
       �� Triggers 5      �� 5       �� Binding 6&   �� 	 �� ElementName$	 GroupNameBox��
 �� Path$
 Text.Length� �� Value 06f   .a�5      ��  �� Property � {� �� Value .  6A   5      5      5      �� 5   
   -   5        $ CancelButton��5      $��Отмена��6'   $��Right=�68   $��
0,56,9.8,0q�6T   $	��Top=�6h   $	��166��6�   6�   5      5      