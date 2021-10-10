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
    public partial class CreatePodrazdelDialogBox : Window
    {
        public List<PodrazdelBaseClass> PodrazdelDB;

        public PodrazdelBaseClass sNewItem;

        public CreatePodrazdelDialogBox(List<PodrazdelBaseClass> pbcl)
        {
            InitializeComponent();
            PodrazdelDB = pbcl;
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var podrz in PodrazdelDB.OrderBy(i => i.iID))
            {
                if (podrz.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            sNewItem = new PodrazdelBaseClass() { iID = iFreeID, strName = PodrazdelNameBox.Text};

            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
