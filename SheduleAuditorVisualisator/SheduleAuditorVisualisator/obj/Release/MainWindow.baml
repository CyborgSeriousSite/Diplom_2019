   M S B A M L   `   `   `  ���� M  ISystem, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089M3clr-namespace:System.ComponentModel;assembly=SystemSystem.ComponentModel   SheduleAuditorVisualisator+   %SheduleAuditorVisualisator.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     J FWpfAnimatedGif, Version=1.4.18.0, Culture=neutral, PublicKeyToken=null,gif"http://wpfanimatedgif.codeplex.com  <cm3clr-namespace:System.ComponentModel;assembly=System  -     �Name$  LoginWindow��$��283.122��$	��338�� � 
ResizeMode$ CanMinimize=� � Title$% Окно авторизации�� � WindowStartupLocation$ CenterScreen=�$��8(�$��4q�.��� -    �Name$ 
GlobalGrid��.+��� -    ��Name$ LoadingIcon��"  WpfAnimatedGif.ImageBehavior   AnimatedSource$/ )pack://application:,,,/Images/Loading.gif��$/��)pack://application:,,,/Images/Loading.gif��   RepeatBehavior$ Forever��$��Center=�$��34��$��0q�$��Center=�$��34��$y�Hidden=�� -   $ MainGrid��.+��� $��Авторизация��$
��Left=�$	��Top=�$��46��$	��336��$��25(�$��16,0,0,0q��� -    ��Name$ 
ErrorLabel��$��WrapWithOverflow=�$��Center=�$��
-3,240,0,0q�$��Center=�$��55��$	��336�����	#FFE3E3E3$��Italic$�$
��Bold"�
���  ��	 K� ZIndex$	 -4��$��Ошибка��
 �� Padding$
 	12,7,12,3q�$��12(�$y�Hidden=��� 
���   �$��1q�$
��Left=�$��43��$��	10,51,0,0q�$	��Top=�$	��300�� �� CornerRadius$ 	20,0,0,20��._�� .+��� $
��Left=�$��6,4,0,0q�$��38��$2��,pack://application:,,,/Images/ServerIcon.png��$��33��$	��Top=��� $
��Left=�$��42��$��42,0,0,-0.4q�$	��Top=�$��1��
���   ��� -    ��Name$ 	ServerBox�� �� TextWrapping$
 Wrap=�$��Адрес сервера��$��51,0,0.2,-1.4q�$��43��$��29(� �� TextAlignment$
 Left=�$��0q����	#00000000���	#FF5B5B5B �� 
CaretBrush
 �   ��� 
���   �$��1q�$
��Left=�$��43��$��
10,101,0,0q�$	��Top=�$	��300��$ 	20,0,0,20��._�� .+��� $
��Left=�$��5,5,0,0q�$��38��$1��+pack://application:,,,/Images/LoginIcon.png��$��33��$	��Top=��� $
��Left=�$��42��$��42,0,0,-0.4q�$	��Top=�$��1��
���   ��� -   $ LoginBox��$
 Wrap=�$��
Логин��$��51,0,0.2,-1.4q�$��43��$��29(�$
 Left=�$��0q����	#00000000���	#FF5B5B5B
 �   ��� 
���   �$��1q�$
��Left=�$��43��$��
10,151,0,0q�$	��Top=�$	��300��$ 	20,0,0,20��._�� .+��� $
��Left=�$��7,4,0,0q�$��38��$4��.pack://application:,,,/Images/PasswordIcon.png��$��33��$	��Top=��� $
��Left=�$��42��$��42,0,0,-0.4q�$	��Top=�$��1��
���   �G� -    G�Name$ PassBox��$��51,0,0.2,-1.4q�$��43��$��29(�$��0q����	#00000000���	#FF5B5B5B G� SelectionOpacity$ -1Q� G� 
CaretBrush
 �   ��� -	    ��Name$ 
AuthButton��$��
Войти��$
��Left=�$��204,199,0,0q�$	��Top=�$	��106��$��36��$��23(�$��1,1,12,1q��� -
    ��Name$ RememberMeCheckbox��$!��Запомнить меня��$
��Left=�$��52.612,199,0,0q�$	��Top=�$��36��$��151.388�� � UseLayoutRounding .  $��Center=�$��16(�