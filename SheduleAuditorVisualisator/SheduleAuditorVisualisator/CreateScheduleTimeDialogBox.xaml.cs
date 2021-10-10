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
    public partial class CreateScheduleTimeDialogBox : Window
    {
        public List<ScheduleTimeBaseClass> ScheduleTimeDB;

        public ScheduleTimeBaseClass sNewItem;

        public CreateScheduleTimeDialogBox(List<ScheduleTimeBaseClass> stbcl)
        {
            InitializeComponent();
            ScheduleTimeDB = stbcl;
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var scheTime in ScheduleTimeDB.OrderBy(i => i.iID))
            {
                if (scheTime.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            TimeSpan newStartDate = new TimeSpan(edtSTIME.Value.Value.Hour, edtSTIME.Value.Value.Minute, 0);
            TimeSpan newEndDate = new TimeSpan(edtETIME.Value.Value.Hour, edtETIME.Value.Value.Minute, 0);
            sNewItem = new ScheduleTimeBaseClass() { iID = iFreeID, strDescription = DescriptionBOX.Text, dStartTime = newStartDate, dEndTime = newEndDate};

            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
