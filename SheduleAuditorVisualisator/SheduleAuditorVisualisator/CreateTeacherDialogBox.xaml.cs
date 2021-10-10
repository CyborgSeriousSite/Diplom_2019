using SheduleAuditorVisualisator.DBClasses;
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

namespace SheduleAuditorVisualisator
{
    public partial class CreateTeacherDialogBox : Window
    {
        public List<TeachersBaseClass> PrepodDB;

        public TeachersBaseClass sNewItem;
        public CreateTeacherDialogBox(List<TeachersBaseClass> tbcl)
        {
            InitializeComponent();
            PrepodDB = tbcl;
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var Techr in PrepodDB.OrderBy(i => i.iID))
            {
                if (Techr.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            sNewItem = new TeachersBaseClass() { iID = iFreeID, strFIO = FIOBox.Text };

            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
