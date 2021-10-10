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
    public partial class CreateSiteGroupsDialogBox : Window
    {
        public List<SiteGroupsBaseClass> SiteGroupsDB;

        public SiteGroupsBaseClass sNewItem;

        public CreateSiteGroupsDialogBox(List<SiteGroupsBaseClass> sgbcl)
        {
            InitializeComponent();
            SiteGroupsDB = sgbcl;
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var sgrup in SiteGroupsDB.OrderBy(i => i.iID))
            {
                if (sgrup.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            sNewItem = new SiteGroupsBaseClass() { iID = iFreeID, strName = GroupNameBox.Text};

            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
