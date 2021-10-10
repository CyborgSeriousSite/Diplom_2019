using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Security.Cryptography;
using System.IO;
using SheduleAuditorVisualisator.FileSystemClasses;

namespace SheduleAuditorVisualisator
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public bool ServerBoxEmpty = true;
        public bool LoginBoxEmpty = true;
        public bool PasswordBoxEmpty = true;
        public MySqlConnection connection;
        public string KeepConnectionString;

        public bool sheduleExist = false;

        private readonly BackgroundWorker worker = new BackgroundWorker();
        private const string initEncrKey = "pemgail9uzpgzl88";
        private const int keysize = 256;

        public RememberMeClass currentData;

        public string StartingFilePath = @"" + System.AppDomain.CurrentDomain.BaseDirectory + "MWLData.rmf";

        public MainWindow()
        {
            InitializeComponent();
            worker.DoWork += worker_DoWork;
            worker.RunWorkerCompleted += worker_RunWorkerCompleted;
        }

        private void worker_DoWork(object sender, DoWorkEventArgs e)
        {
            List<object> argumentList = e.Argument as List<object>; //acquires the passed in arguments
            string argument1 = (string) argumentList [0];
            string argument2 = (string) argumentList [1];
            string argument3 = (string) argumentList [2];

            string connectionString = "SERVER=" + argument1 + ";UID=" + argument2 + ";" + "PASSWORD=" + argument3 + ";";

            connection = new MySqlConnection(connectionString);
            try
            {
                connection.Open();
                string connectionString2 = "SELECT * FROM information_schema.tables WHERE table_schema = 'shedulebase2'";
                MySqlCommand cmd = new MySqlCommand(connectionString2, connection);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read().Equals("True"))
                    {
                        sheduleExist = true;
                    }
                    else
                    {
                        sheduleExist = false;
                    }
                    e.Result = "Open";
                }
            }
            catch (MySqlException ex)
            {
                e.Result = "Closed";
            }
        }

        private void worker_RunWorkerCompleted(object sender,
                                               RunWorkerCompletedEventArgs e)
        {
            if (e.Result.ToString().Equals("Open"))
            {
                int iMode = -1;
                bool bAdmMode = false;
                string connectionString2 = "SHOW GRANTS FOR '"+LoginBox.Text+"'@'"+ServerBox.Text+"';";
                MySqlCommand cmd = new MySqlCommand(connectionString2, connection);
                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        if (rdr.GetValue(0).ToString().StartsWith("GRANT ALL PRIVILEGES ON *.* TO"))
                        {
                            iMode = 1;
                            break;
                        }
                        if (rdr.GetValue(0).ToString().StartsWith("GRANT SELECT, INSERT, UPDATE, DELETE, DROP ON `shedulebase`.`shedule`"))
                        {
                            iMode = 0;
                            break;
                        }
                    }
                }

                if (iMode == -1)
                {
                    AuthButton.IsEnabled = true;
                    MainGrid.Effect = null;
                    MainGrid.IsEnabled = true;
                    LoadingIcon.Visibility = Visibility.Hidden;
                    LoginWindow.Height = 325.522f;
                    ErrorLabel.Visibility = Visibility.Visible;
                    ErrorLabel.Text = "Произошла ошибка. Введенный пользователь не имеет достаточных прав для пользования программой.";
                    return;
                }
                else if (iMode == 1)
                {
                    bAdmMode = true;
                }

                Console.Out.WriteLine("AdminMode=" + bAdmMode);

                this.Hide();
                AfterLoginWindow aflWindow = new AfterLoginWindow(KeepConnectionString, sheduleExist, bAdmMode);
                aflWindow.Show();
                this.Close();
            }
            else
            {
                AuthButton.IsEnabled = true;
                MainGrid.Effect = null;
                MainGrid.IsEnabled = true;
                LoadingIcon.Visibility = Visibility.Hidden;
                LoginWindow.Height = 325.522f;
                ErrorLabel.Visibility = Visibility.Visible;
                ErrorLabel.Text = "Произошла ошибка. Сервер не отвечает, либо был введен неправильный логин или пароль.";
            }
        }

        private void LoginTextBoxFocus(object sender, RoutedEventArgs e)
        {
            TextBox txtBox = (TextBox)sender;
            Grid eGrid = (Grid)VisualTreeHelper.GetParent(txtBox);
            Border eBorder = (Border)VisualTreeHelper.GetParent(eGrid);
            eBorder.Background = new SolidColorBrush(Colors.Blue) { Opacity = 0.1 };
            ((GridSplitter)VisualTreeHelper.GetChild(eGrid, 1)).Background = System.Windows.Media.Brushes.Blue;
            eBorder.BorderBrush = System.Windows.Media.Brushes.Blue;
            if (txtBox.Name.Equals("ServerBox"))
            {
                if (ServerBoxEmpty)
                {
                    txtBox.Text = "";
                }
            } else if (txtBox.Name.Equals("LoginBox")) {
                if (LoginBoxEmpty)
                {
                    txtBox.Text = "";
                }
            }
        }

        private void LoginTextBoxFocusLoose(object sender, RoutedEventArgs e)
        {
            TextBox txtBox = (TextBox)sender;
            Grid eGrid = (Grid)VisualTreeHelper.GetParent(txtBox);
            Border eBorder = (Border)VisualTreeHelper.GetParent(eGrid);
            eBorder.Background = new SolidColorBrush(Colors.White) { Opacity = 0 };
            ((GridSplitter)VisualTreeHelper.GetChild(eGrid, 1)).Background = System.Windows.Media.Brushes.Black;
            eBorder.BorderBrush = System.Windows.Media.Brushes.Black;
            if(txtBox.Text == "") {
                if (txtBox.Name.Equals("ServerBox")) {
                    ServerBoxEmpty = true;
                }   else if (txtBox.Name.Equals("LoginBox")) {
                    LoginBoxEmpty = true;
                }
            }
            else
            {
                if (txtBox.Name.Equals("ServerBox"))
                {
                    ServerBoxEmpty = false;
                }
                else if (txtBox.Name.Equals("LoginBox"))
                {
                    LoginBoxEmpty = false;
                }
            }
        }

        private void LoginPasswordBoxFocus(object sender, RoutedEventArgs e)
        {
            PasswordBox pswBox = (PasswordBox)sender;
            Grid eGrid = (Grid)VisualTreeHelper.GetParent(pswBox);
            Border eBorder = (Border)VisualTreeHelper.GetParent(eGrid);
            eBorder.Background = new SolidColorBrush(Colors.Blue) { Opacity = 0.1 };
            ((GridSplitter)VisualTreeHelper.GetChild(eGrid, 1)).Background = System.Windows.Media.Brushes.Blue;
            eBorder.BorderBrush = System.Windows.Media.Brushes.Blue;
        }

        private void LoginPasswordBoxFocusLoose(object sender, RoutedEventArgs e)
        {
            PasswordBox pswBox = (PasswordBox)sender;
            Grid eGrid = (Grid)VisualTreeHelper.GetParent(pswBox);
            Border eBorder = (Border)VisualTreeHelper.GetParent(eGrid);
            eBorder.Background = new SolidColorBrush(Colors.White) { Opacity = 0 };
            ((GridSplitter)VisualTreeHelper.GetChild(eGrid, 1)).Background = System.Windows.Media.Brushes.Black;
            eBorder.BorderBrush = System.Windows.Media.Brushes.Black;
        }

        private void StartAuth(object sender, RoutedEventArgs e)
        {
            if (RememberMeCheckbox.IsChecked.Value)
            {
                currentData = new RememberMeClass() { strUserLogin = EncryptString(LoginBox.Text, "PZSISFB97"), strUserPassword = EncryptString(PassBox.Password, "PZSISFB97"), strUserServer = ServerBox.Text, bRememberMeChecked = RememberMeCheckbox.IsChecked.Value };
            }
            else
            {
                currentData = new RememberMeClass() { strUserLogin = "", strUserPassword = "", strUserServer = ServerBox.Text, bRememberMeChecked = RememberMeCheckbox.IsChecked.Value };
            }
            using (Stream stream = File.Open(StartingFilePath, FileMode.Create))
            {
                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                bformatter.Serialize(stream, currentData);
            }

            ((Button)sender).IsEnabled = false;
            MainGrid.Effect = new System.Windows.Media.Effects.BlurEffect
            {
                Radius = 5
            };
            MainGrid.IsEnabled = false;
            LoadingIcon.Visibility = Visibility.Visible;

            LoginWindow.Height = 283.122f;
            ErrorLabel.Visibility = Visibility.Hidden;

            List<object> warguments = new List<object>();
            warguments.Add(ServerBox.Text);
            warguments.Add(LoginBox.Text);
            warguments.Add(PassBox.Password);
            KeepConnectionString = "SERVER=" + ServerBox.Text + ";UID=" + LoginBox.Text + ";" + "PASSWORD=" + PassBox.Password + ";";
            if (worker.IsBusy != true)
            {
                worker.RunWorkerAsync(warguments);
            }
        }

        //Шифровка
        public static string EncryptString(string plainText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initEncrKey);
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
            cryptoStream.FlushFinalBlock();
            byte[] cipherTextBytes = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            return Convert.ToBase64String(cipherTextBytes);
        }

        //Расшифровка
        public static string DecryptString(string cipherText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initEncrKey);
            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream(cipherTextBytes);
            CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
            byte[] plainTextBytes = new byte[cipherTextBytes.Length];
            int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
            memoryStream.Close();
            cryptoStream.Close();
            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
        }

        private void LoginWindow_Loaded(object sender, RoutedEventArgs e)
        {
            if (File.Exists(StartingFilePath))
            {
                using (Stream stream = File.Open(StartingFilePath, FileMode.Open))
                {
                    var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                    currentData = (RememberMeClass)bformatter.Deserialize(stream);
                }

                ServerBox.Text = currentData.strUserServer;
                ServerBoxEmpty = false;
                if (currentData.strUserLogin.Length > 0)
                {
                    LoginBox.Text = DecryptString(currentData.strUserLogin, "PZSISFB97");
                    LoginBoxEmpty = false;
                }
                if (currentData.strUserPassword.Length > 0)
                {
                    PassBox.Password = DecryptString(currentData.strUserPassword, "PZSISFB97");
                    PasswordBoxEmpty = false;
                }
                RememberMeCheckbox.IsChecked = currentData.bRememberMeChecked;
            }
            else
            {
                currentData = new RememberMeClass() { strUserLogin = "", strUserPassword = "", strUserServer = "" };
                using (Stream stream = File.Open(StartingFilePath, FileMode.Create))
                {
                    var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                    bformatter.Serialize(stream, currentData);
                }
            }
        }
    }
}
