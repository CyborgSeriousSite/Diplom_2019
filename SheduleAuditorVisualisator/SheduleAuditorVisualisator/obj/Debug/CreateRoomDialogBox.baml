   M S B A M L   `   `   `  ����  SheduleAuditorVisualisator4    .SheduleAuditorVisualisator.CreateRoomDialogBox   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$)  #Создание аудитории��5   	   $��127.777��6$   $��209.261��65    � 
ResizeMode$ NoResize=�6E    � WindowStartupLocation$ CenterOwner=�6[    � WindowStyle$ ThreeDBorderWindow=�6   .��5      � $��0,0,0,0q�6   .+�5   
   �� $#��Номер аудитории��6   $��
10,10,67,0q�6*   $	��Top=�6>   $��26��6V   �� 5   
   -   5         ��Name$ ROOMNUMBERBOX��5      $��26��6)   $��126,10,12.8,0q�65    �� TextWrapping$
 Wrap=�6L   $	��Top=�6`   $��Center=�6�   �� 5   
   -   5         ��Name$ AcceptButton��5      $��Создать��6'   $
��Left=�69   $��	10,56,0,0q�6T   $	��Top=�6g   $��75��6   ��5	      �� 5
       �� Triggers 5      �� 5       �� Binding 6&   �� 	 �� ElementName$	 ROOMNUMBERBOX��
 �� Path$
 Text.Length� �� Value 06g   .a�5      ��  �� Property � {� �� Value .  6A   5      5      5      �� 5   
   -   5        $ CancelButton��5      $��Отмена��6'   $
��Left=�68   $��
105,56,0,0q�6S   $	��Top=�6g   $��75��6   6�   5      5      