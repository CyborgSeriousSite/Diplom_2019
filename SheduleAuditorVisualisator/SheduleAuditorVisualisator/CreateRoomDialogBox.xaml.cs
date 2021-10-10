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
using System.Windows.Shapes;
using SheduleAuditorVisualisator.DBClasses;

namespace SheduleAuditorVisualisator
{
    /// <summary>
    /// Interaction logic for CreateRoomDialogBox.xaml
    /// </summary>
    public partial class CreateRoomDialogBox : Window
    {
        public List<ClassRoomsBaseClass> ClassRoomsDB;
        public int iNumberResult = -1;
        public int iFreeID = -1;
        public CreateRoomDialogBox()
        {
            InitializeComponent();
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            bool bCanceled = false;

            if (ClassRoomsDB != null)
            {
                iFreeID = 0;
                //Сначала найдем свободный ID
                foreach (var Room in ClassRoomsDB.OrderBy(i => i.iID))
                {
                    if (Room.iID == iFreeID)
                    {
                        iFreeID++;
                    }
                    else
                    {
                        break;
                    }
                }
                //Затем проверяем БД на наличие аудитории с существующим номером
                foreach (var Room in ClassRoomsDB)
                {
                    if (Room.iNumber == Int16.Parse(ROOMNUMBERBOX.Text))
                    {
                        string messageBoxText = "Создаваемая вами аудитория с номером " + ROOMNUMBERBOX.Text + " уже существует! Вы уверены что хотите продолжить?";
                        string caption = "Предупреждение";
                        MessageBoxButton button = MessageBoxButton.OKCancel;
                        MessageBoxImage icon = MessageBoxImage.Warning;
                        MessageBoxResult result = MessageBox.Show(messageBoxText, caption, button, icon);

                        switch (result)
                        {
                            case MessageBoxResult.OK:
                                iNumberResult = Int16.Parse(ROOMNUMBERBOX.Text);
                                break;
                            case MessageBoxResult.Cancel:
                                iNumberResult = -1;
                                bCanceled = true;
                                break;
                        }

                        break;
                    }
                }
                if (!bCanceled)
                {
                    iNumberResult = Int16.Parse(ROOMNUMBERBOX.Text);
                }
            }
            else
            {
                bCanceled = true;
            }

            if (!bCanceled)
            {
                this.Close();
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ROOMNUMBERBOX_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true;
            }
        }
    }
}
