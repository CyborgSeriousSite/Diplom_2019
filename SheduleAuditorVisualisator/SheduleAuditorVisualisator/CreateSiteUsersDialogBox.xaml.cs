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
    public partial class CreateSiteUsersDialogBox : Window
    {
        public List<SiteUsersBaseClass> SiteUsersDB;
        public List<SiteGroupsBaseClass> SiteGroupsDB;

        public SiteUsersBaseClass sNewItem;

        public CreateSiteUsersDialogBox(List<SiteUsersBaseClass> subcl, List<SiteGroupsBaseClass> sgbcl)
        {
            InitializeComponent();
            SiteUsersDB = subcl;
            SiteGroupsDB = sgbcl;

            GroupBox.ItemsSource = SiteGroupsDB;
            GroupBox.DisplayMemberPath = "strName";
            GroupBox.SelectedValuePath = "iID";
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var susers in SiteUsersDB.OrderBy(i => i.iID))
            {
                if (susers.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            sNewItem = new SiteUsersBaseClass() { iID = iFreeID, ULogin = LoginBox.Text, UPassword = PasswordBox.Text, strName = NameBox.Text, strName2 = Name2Box.Text, strName3 = Name3Box.Text, iGroup = (int)GroupBox.SelectedValue, strEmail = EmailBox.Text, strNumber = PhoneBox.Text };

            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
