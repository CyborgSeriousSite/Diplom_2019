   M S B A M L   `   `   `  ����  SheduleAuditorVisualisator9    3SheduleAuditorVisualisator.CreatePodrazdelDialogBox   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$1  +Создание подразделения��5   	   $��127.777��6(   $��383.261��69    � 
ResizeMode$ NoResize=�6I    � WindowStartupLocation$ CenterOwner=�6_    � WindowStyle$ ThreeDBorderWindow=�6�   .��5      � $��0,0,0,0q�6   .+�5   
   �� $1��+Название подразделения��6   $��	10,10,0,0q�61   $	��Top=�6D   $��26��6\   $
��Left=�6h   $	��166��6�   �� 5   
   -   5         ��Name$ PodrazdelNameBox��5      $��26��6,   $��
0,10,9.8,0q�68    �� TextWrapping$
 Wrap=�6L   $	��Top=�6`   $��Center=�6x   $��Right=�6�   $	��191��6�   �� 5   
   -   5         ��Name$ AcceptButton��5      $��Создать��6'   $
��Left=�69   $��	10,56,0,0q�6T   $	��Top=�6g   $	��166��6   ��5	      �� 5
       �� Triggers 5      �� 5       �� Binding 6&   �� 	 �� ElementName$	 PodrazdelNameBox��
 �� Path$
 Text.Length� �� Value 06j   .a�5      ��  �� Property � {� �� Value .  6A   5      5      5      �� 5   
   -   5        $ CancelButton��5      $��Отмена��6'   $��Right=�68   $��
0,56,9.8,0q�6T   $	��Top=�6h   $	��166��6�   6�   5      5      