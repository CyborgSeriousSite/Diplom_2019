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
    public partial class CreateSubjectDialogBox : Window
    {
        public List<SubjectsBaseClass> SubjectsDB = new List<SubjectsBaseClass>();
        public SubjectsBaseClass sNewItem;
        public CreateSubjectDialogBox(List<SubjectsBaseClass> sbcSubClass)
        {
            InitializeComponent();
            SubjectsDB = sbcSubClass;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var Subj in SubjectsDB.OrderBy(i => i.iID))
            {
                if (Subj.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            sNewItem = new SubjectsBaseClass() { iID = iFreeID, strName = SubjectNameBox.Text};

            this.Close();
        }
    }
}
