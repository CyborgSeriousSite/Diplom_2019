   M S B A M L   `   `   `  ����M  ISystem, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089M3clr-namespace:System.ComponentModel;assembly=SystemSystem.ComponentModel  5   	    SheduleAuditorVisualisator+   %SheduleAuditorVisualisator.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   J FWpfAnimatedGif, Version=1.4.18.0, Culture=neutral, PublicKeyToken=null,gif"http://wpfanimatedgif.codeplex.com  5   	   <cm3clr-namespace:System.ComponentModel;assembly=System  5   	   -   5          �Name$  LoginWindow��5   	   $��283.122��5   @   $	��338��6Q    � 
ResizeMode$ CanMinimize=�6]    � Title$% Окно авторизации��6v    � WindowStartupLocation$ CenterScreen=�6�   $��8(�5   H   $��4q�6U   .��5      � -   5         �Name$ 
GlobalGrid��5      .+�5   
   �� -   5         ��Name$ LoadingIcon��5      "  WpfAnimatedGif.ImageBehavior   AnimatedSource$/ )pack://application:,,,/Images/Loading.gif��6%   $/��)pack://application:,,,/Images/Loading.gif��6r      RepeatBehavior$ Forever��6�   $��Center=�6�   $��34��6�   $��0q�6�   $��Center=�6  $��34��6  $y�Hidden=�6*  � 5	   
   -   5        $ MainGrid��5	      .+�5
      �� $��Авторизация��6   $
��Left=�6*   $	��Top=�6E   $��46��6]   $	��336��6i   $��25(�6u   $��16,0,0,0q�6�   �� 5      -   5         ��Name$ 
ErrorLabel��5   8   $��WrapWithOverflow=�6   $��Center=�6L   $��
-3,240,0,0q�6i   $��Center=�6}   $��55��6�   $	��336��6�   ���	#FFE3E3E3$��Italic$�6�   $
��Bold"�6�   
���  ��	 K� ZIndex$	 -4��6�   $��Ошибка��6  
 �� Padding$
 	12,7,12,3q�6  $��12(�61  $y�Hidden=�6?  �� 5      
���   �$��1q�6)   $
��Left=�6=   $��43��6X   $��	10,51,0,0q�6d   $	��Top=�6w   $	��300��6�    �� CornerRadius$ 	20,0,0,20��6�   ._�5      � .+�5      �� $
��Left=�6   $��6,4,0,0q�67   $��38��6H   $2��,pack://application:,,,/Images/ServerIcon.png��6S   $��33��6�   $	��Top=�6�   �� 5      $
��Left=�6#   $��42��6>   $��42,0,0,-0.4q�6J   $	��Top=�6_   $��1��6w   
���   �6�   �� 5      -   5         ��Name$ 	ServerBox��5       �� TextWrapping$
 Wrap=�61   $��Адрес сервера��6E   $��51,0,0.2,-1.4q�6Z   $��43��6q   $��29(�6}    �� TextAlignment$
 Left=�6�   $��0q�6�   ���	#00000000���	#FF5B5B5B �� 
CaretBrush
 �   �6"  5      5      �� 5      
���   �$��1q�6)   $
��Left=�6=   $��43��6X   $��
10,101,0,0q�6d   $	��Top=�6x   $	��300��6�   $ 	20,0,0,20��6�   ._�5      � .+�5      �� $
��Left=�6   $��5,5,0,0q�67   $��38��6H   $1��+pack://application:,,,/Images/LoginIcon.png��6S   $��33��6�   $	��Top=�6�   �� 5      $
��Left=�6#   $��42��6>   $��42,0,0,-0.4q�6J   $	��Top=�6_   $��1��6w   
���   �6�   �� 5      -   5        $ LoginBox��5      $
 Wrap=�60   $��
Логин��6D   $��51,0,0.2,-1.4q�6Q   $��43��6h   $��29(�6t   $
 Left=�6�   $��0q�6�   ���	#00000000���	#FF5B5B5B
 �   �6  5      5      �� 5      
���   �$��1q�6)   $
��Left=�6=   $��43��6X   $��
10,151,0,0q�6d   $	��Top=�6x   $	��300��6�   $ 	20,0,0,20��6�   ._�5      � .+�5      �� $
��Left=�6   $��7,4,0,0q�67   $��38��6H   $4��.pack://application:,,,/Images/PasswordIcon.png��6S   $��33��6�   $	��Top=�6�   �� 5      $
��Left=�6#   $��42��6>   $��42,0,0,-0.4q�6J   $	��Top=�6_   $��1��6w   
���   �6�   G� 5      -   5         G�Name$ PassBox��5   "   $��51,0,0.2,-1.4q�63   $��43��6J   $��29(�6V   $��0q�6d   ���	#00000000���	#FF5B5B5B G� SelectionOpacity$ -1Q�6�    G� 
CaretBrush
 �   �6  5      5       �� 5!      -	   5         ��Name$ 
AuthButton��5!      $��
Войти��6)   $
��Left=�69   $��204,199,0,0q�6T   $	��Top=�6i   $	��106��6�   $��36��6�   $��23(�6�   $��1,1,12,1q�6�   6�   �� 5"      -
   5         ��Name$ RememberMeCheckbox��5"      $!��Запомнить меня��63   $
��Left=�6L   $��52.612,199,0,0q�6g   $	��Top=�6   $��36��6�   $��151.388��6�    � UseLayoutRounding .  $��Center=�6�   $��16(�6�   5#      5$      5%      