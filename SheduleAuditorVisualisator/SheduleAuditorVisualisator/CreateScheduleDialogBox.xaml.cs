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
using System.Collections.ObjectModel;

namespace SheduleAuditorVisualisator
{
    public partial class CreateScheduleDialogBox : Window
    {
        public List<ScheduleBaseClass> ScheduleDB;
        public List<GroupsBaseClass> GroupsDB;
        public List<ScheduleTimeBaseClass> ScheduleTimeDB;
        public List<SubjectsBaseClass> SubjectsDB;
        public List<ClassRoomsBaseClass> ClassRoomsDB;
        public List<TeachersBaseClass> PrepodDB;

        public ScheduleBaseClass sNewItem;

        public CreateScheduleDialogBox(List<ScheduleBaseClass> sbcl, List<ScheduleTimeBaseClass> stbcl, List<ClassRoomsBaseClass> crbcl, List<TeachersBaseClass> tbcl, List<SubjectsBaseClass> subcl, List<GroupsBaseClass> gbcl)
        {
            InitializeComponent();
            DataContext = this;
            ScheduleDB = sbcl;

            ScheduleTimeDB = stbcl;
            edtTime.ItemsSource = ScheduleTimeDB;
            edtTime.DisplayMemberPath = "strDescription";
            edtTime.SelectedValuePath = "iID";

            ClassRoomsDB = crbcl;
            edtRoom.ItemsSource = ClassRoomsDB;
            edtRoom.DisplayMemberPath = "iNumber";
            edtRoom.SelectedValuePath = "iID";

            PrepodDB = tbcl;
            edtTeacher.ItemsSource = PrepodDB;
            edtTeacher.DisplayMemberPath = "strFIO";
            edtTeacher.SelectedValuePath = "iID";

            SubjectsDB = subcl;
            edtSubject.ItemsSource = SubjectsDB;
            edtSubject.DisplayMemberPath = "strName";
            edtSubject.SelectedValuePath = "iID";

            GroupsDB = gbcl;
            edtGroup.ItemsSource = GroupsDB;
            edtGroup.DisplayMemberPath = "strName";
            edtGroup.SelectedValuePath = "iID";

        }

        private void edtTime_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (edtTime.SelectedIndex >= 0 && edtTime.IsKeyboardFocusWithin)
            {
                ScheduleTimeBaseClass sIt = (ScheduleTimeBaseClass)edtTime.SelectedItem;
                pStartTimespanbox.Text = sIt.dStartTime.ToString(@"hh\:mm");
                pEndTimespanbox.Text = sIt.dEndTime.ToString(@"hh\:mm");
            }
        }

        private void TimeSpanChanged()
        {
            if (pStartTimespanbox.Value == null || pEndTimespanbox.Value == null)
            {
                return;
            }

            foreach (var sheduletime in ScheduleTimeDB)
            {
                int iTimeHours = sheduletime.dStartTime.Hours;
                int iTimeMinutes = sheduletime.dStartTime.Minutes;

                int iTimeHoursEnd = sheduletime.dEndTime.Hours;
                int iTimeMinutesEnd = sheduletime.dEndTime.Minutes;

                bool tFound = false;
                if (iTimeHours == pStartTimespanbox.Value.Value.Hour && iTimeMinutes == pStartTimespanbox.Value.Value.Minute && iTimeHoursEnd == pEndTimespanbox.Value.Value.Hour && iTimeMinutesEnd == pEndTimespanbox.Value.Value.Minute)
                {
                    for (int i = 0; i < edtTime.Items.Count; i++)
                    {
                        if (edtTime.Items[i].GetType().ToString().Contains("ScheduleTimeBaseClass"))
                        {
                            ScheduleTimeBaseClass eIT = (ScheduleTimeBaseClass)edtTime.Items[i];

                            if (eIT.dStartTime.Hours == iTimeHours && iTimeMinutes == eIT.dStartTime.Minutes && iTimeHoursEnd == eIT.dEndTime.Hours && iTimeMinutesEnd == eIT.dEndTime.Minutes)
                            {
                                edtTime.SelectedIndex = i;
                                tFound = true;
                                break;
                            }
                        }
                    }
                    if (tFound)
                    {
                        break;
                    }
                }
                if (!tFound)
                {
                    edtTime.SelectedIndex = -1;
                }
            }
        }

        private void pStartTimespanbox_ValueChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if (pStartTimespanbox.IsKeyboardFocusWithin)
            {
                TimeSpanChanged();
            }
        }

        private void pEndTimespanbox_ValueChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if (pEndTimespanbox.IsKeyboardFocusWithin)
            {
                TimeSpanChanged();
            }
        }

        private void OnMouseMove(object sender, MouseEventArgs e)
        {
            if (CalendarSched.SelectedDate != null && (edtTime.SelectedIndex >= 0 || (pStartTimespanbox.Value != null && pEndTimespanbox.Value != null)) && edtGroup.SelectedIndex >= 0 && edtTeacher.SelectedIndex >= 0 && edtSubject.SelectedIndex >= 0 && edtRoom.SelectedIndex >= 0)
            {
                AcceptButton.IsEnabled = true;
            }
            else
            {
                AcceptButton.IsEnabled = false;
            }
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            int iFreeID = 1;
            foreach (var Schedule in ScheduleDB.OrderBy(i => i.iID))
            {
                if (Schedule.iID == iFreeID)
                {
                    iFreeID++;
                }
                else
                {
                    break;
                }
            }

            if(edtTime.SelectedIndex>=0) {
                ScheduleTimeBaseClass eTI = (ScheduleTimeBaseClass) edtTime.SelectedItem;

                DateTime sDT = new DateTime(CalendarSched.SelectedDate.Value.Year, CalendarSched.SelectedDate.Value.Month, CalendarSched.SelectedDate.Value.Day, eTI.dStartTime.Hours, eTI.dStartTime.Minutes, 0);
                DateTime eDT = new DateTime(CalendarSched.SelectedDate.Value.Year, CalendarSched.SelectedDate.Value.Month, CalendarSched.SelectedDate.Value.Day, eTI.dEndTime.Hours, eTI.dEndTime.Minutes, 0);
                sNewItem = new ScheduleBaseClass() { iID = iFreeID, iGroupID = (int)edtGroup.SelectedValue, iSubjectID = (int)edtSubject.SelectedValue, iTeacherID = (int)edtTeacher.SelectedValue, iClassRoomID = (int)edtRoom.SelectedValue, dStartTime = sDT, dEndTime = eDT};
            }
            else
            {
                DateTime sDT = new DateTime(CalendarSched.SelectedDate.Value.Year, CalendarSched.SelectedDate.Value.Month, CalendarSched.SelectedDate.Value.Day, pStartTimespanbox.Value.Value.Hour, pStartTimespanbox.Value.Value.Minute, 0);
                DateTime eDT = new DateTime(CalendarSched.SelectedDate.Value.Year, CalendarSched.SelectedDate.Value.Month, CalendarSched.SelectedDate.Value.Day, pEndTimespanbox.Value.Value.Hour, pEndTimespanbox.Value.Value.Minute, 0);
                sNewItem = new ScheduleBaseClass() { iID = iFreeID, iGroupID = (int)edtGroup.SelectedValue, iSubjectID = (int)edtSubject.SelectedValue, iTeacherID = (int)edtTeacher.SelectedValue, iClassRoomID = (int)edtRoom.SelectedValue, dStartTime = sDT, dEndTime = eDT };
            }
            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
