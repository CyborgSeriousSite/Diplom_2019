   M S B A M L   `   `   `  ����  SheduleAuditorVisualisator7    1SheduleAuditorVisualisator.CreateSubjectDialogBox   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$+  %Создание дисциплины��5   	   $��127.777��6%   $��306.461��66    � 
ResizeMode$ NoResize=�6F    � WindowStartupLocation$ CenterOwner=�6\    � WindowStyle$ ThreeDBorderWindow=�6�   .��5      � $��0,0,0,0q�6   .+�5   
   �� $+��%Название дисциплины��6   $��
10,10,67,0q�6.   $	��Top=�6B   $��26��6Z   �� 5   
   -   5         ��Name$ SubjectNameBox��5      $��26��6*   $��147,10,12.4,0q�66    �� TextWrapping$
 Wrap=�6M   $	��Top=�6a   $��Center=�6y   �� 5   
   -   5         ��Name$ AcceptButton��5      $��Создать��6'   $
��Left=�69   $��	10,56,0,0q�6T   $	��Top=�6g   $	��131��6   ��5	      �� 5
       �� Triggers 5      �� 5       �� Binding 6&   �� 	 �� ElementName$	 SubjectNameBox��
 �� Path$
 Text.Length� �� Value 06h   .a�5      ��  �� Property � {� �� Value .  6A   5      5      5      �� 5   
   -   5        $ CancelButton��5      $��Отмена��6'   $��Right=�68   $��	0,56,10,0q�6T   $	��Top=�6g   $	��131��6   6�   5      5      