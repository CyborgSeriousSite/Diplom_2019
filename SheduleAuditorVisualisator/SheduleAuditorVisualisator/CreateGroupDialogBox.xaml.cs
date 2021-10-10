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
    public partial class CreateGroupDialogBox : Window
    {

        public List<GroupsBaseClass> GroupsDB;
        public List<PodrazdelBaseClass> PodrazdelDB;

        public GroupsBaseClass sNewItem;

        public CreateGroupDialogBox(List<GroupsBaseClass> gbcl, List<PodrazdelBaseClass> pbcl)
        {
            InitializeComponent();
            GroupsDB = gbcl;
            PodrazdelDB = pbcl;

            PodrazdelBox.ItemsSource = PodrazdelDB;
            PodrazdelBox.DisplayMemberPath = "strName";
            PodrazdelBox.SelectedValuePath = "iID";
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var grp in GroupsDB.OrderBy(i => i.iID))
            {
                if (grp.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            sNewItem = new GroupsBaseClass() { iID = iFreeID, strName = GroupNameBox.Text, iPodrazID = (int)PodrazdelBox.SelectedValue };

            this.Close();
        }
    }
}
