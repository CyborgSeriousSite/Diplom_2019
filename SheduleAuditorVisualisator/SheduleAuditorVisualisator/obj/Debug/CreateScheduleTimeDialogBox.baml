   M S B A M L   `   `   `  ����  SheduleAuditorVisualisator<    6SheduleAuditorVisualisator.CreateScheduleTimeDialogBox   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   X TXceed.Wpf.Toolkit, Version=3.5.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   	     � Title$2  ,Добавление времени пары��5   	   $��187.478��6)   $��306.461��6:    � 
ResizeMode$ NoResize=�6J    � WindowStartupLocation$ CenterOwner=�6`    � WindowStyle$ ThreeDBorderWindow=�6�   .��5      � $��0,0,0,0q�6   .+�5   
   �� $'��!Наименование пары��6   $��	10,10,0,0q�6,   $	��Top=�6?   $��26��6W   $
��Left=�6c   $	��137��6~   �� 5   
   -   5         ��Name$ DescriptionBOX��5      $��26��6*   $��	0,10,12,0q�66    �� TextWrapping$
 Wrap=�6I   $	��Top=�6]   $��Center=�6u   $��Right=�6�   $	��141��6�   �� 5	   
   -   5         ��Name$ AcceptButton��5	      $��Создать��6'   $
��Left=�69   $��10,0,0,10.6q�6T   $	��131��6i   $��19��6�   $��Bottom=�6�   ��5
      �� 5       �� Triggers 5      �� 5       �� Binding 6&   �� *Text.Length+	 �� ElementName$	 DescriptionBOX��
 �� Value
 06c   .a�5      ��  �� Property � {� �� Value .  6D   5      �� 5       6&   �� *Text+$	 edtSTIME��
  6V   .a�5      ��  � {� .  6D   5      �� 5       6&   �� *Text+$	 edtETIME��
  6V   .a�5      ��  � {� .  6D   5      5      5      �� 5   
   -   5        $ CancelButton��5      $��Отмена��6'   $��Right=�68   $��0,0,12,10.6q�6T   $	��131��6i   $��19��6�   $��Bottom=�6�   "  Xceed.Wpf.Toolkit.TimePicker  5   
   -   5          Name$ edtSTIME��5      $��	0,41,12,0q�6,   $��Right=�6?   $	��141��6[   $��27��6g   $	��Top=�6s   ,  &Xceed.Wpf.Toolkit.Primitives.InputBase   Text$  ��6�     5   
   -   5        $ edtETIME��5      $��	0,73,12,0q�6,   $��Right=�6?   $	��141��6[   $��27��6g   $	��Top=�6s   $  ��6�   �� 5   
   $��Время начала��6   $��	10,41,0,0q�6'   $	��Top=�6:   $��26��6R   $
��Left=�6^   $	��137��6y   �� 5   
   $#��Время окончания��6   $��	10,73,0,0q�6*   $	��Top=�6=   $��26��6U   $
��Left=�6a   $	��137��6|   5      5       