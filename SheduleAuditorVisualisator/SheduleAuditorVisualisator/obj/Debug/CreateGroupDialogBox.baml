   M S B A M L   `   `   `  ����  SheduleAuditorVisualisator5    /SheduleAuditorVisualisator.CreateGroupDialogBox   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$#  Создание группы��5   	   $��147.51��6!   $��306.461��61    � 
ResizeMode$ NoResize=�6A    � WindowStartupLocation$ CenterOwner=�6W    � WindowStyle$ ThreeDBorderWindow=�6{   .��5      � $��0,0,0,0q�6   .+�5   
   �� $#��Название группы��6   $��	10,10,0,0q�6*   $	��Top=�6=   $��26��6U   $
��Left=�6a   $	��137��6|   �� 5   
   -   5         ��Name$ GroupNameBox��5      $��26��6(   $��	0,10,12,0q�64    �� TextWrapping$
 Wrap=�6G   $	��Top=�6[   $��Center=�6s   $��Right=�6�   $	��141��6�   �� 5   
   -   5         ��Name$ AcceptButton��5      $��Создать��6'   $
��Left=�69   $��10,0,0,10.4q�6T   $��Bottom=�6i   $	��131��6�   ��5	      �� 5
       �� Triggers 5      �� 5       �� Binding 6&   �� 	 �� ElementName$	 GroupNameBox��
 �� Path$
 Text.Length� �� Value 06f   .a�5      ��  �� Property � {� �� Value .  6A   5      �� 5       6&   �� $	 PodrazdelBox��$
 SelectedIndex� -16h   .a�5      ��  � {� .  6A   5      5      5      �� 5   
   -   5        $ CancelButton��5      $��Отмена��6'   $��Right=�68   $��0,0,10,10.4q�6T   $	��131��6i   $��19��6�   $��Bottom=�6�   �� 5   
   $ ��Подразделение��6   $��	10,36,0,0q�6(   $	��Top=�6;   $��26��6S   $
��Left=�6_   $	��137��6z   �� 5   
   -   5         ��Name$ PodrazdelBox��5      $��	0,40,12,0q�6)   $	��Top=�6<   $��Right=�6T   $	��141��6p   5      5      