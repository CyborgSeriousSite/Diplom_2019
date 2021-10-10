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
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using SheduleAuditorVisualisator.DBClasses;
using System.Text.RegularExpressions;
using System.Collections.ObjectModel;

namespace SheduleAuditorVisualisator
{
    public partial class AfterLoginWindow : Window
    {

        private void keyUp(object sender, KeyEventArgs e)
        {
            if(MainWindow.IsEnabled) {

                if (e.Key == Key.F6)
                {
                    UpdateSubjectsOnServer();
                    return;
                }

                if (Keyboard.IsKeyDown(Key.LeftCtrl))
                {
                    if (e.Key == Key.B)
                    {
                        BackupWindowCommand();
                        return;
                    }

                    if (e.Key == Key.D)
                    {
                        Disconnect();
                        return;
                    }
                }
            }
        }

        private MySqlConnection connection;

        public MySqlDataAdapter mySqlDataAdapter;
        public DataSet mySqlDataSet;

        public bool sheduleExist = true;

        //Receive DBs into public lists ;)
        public List<ScheduleBaseClass> ScheduleDB = new List<ScheduleBaseClass>();
        public List<GroupsBaseClass> GroupsDB = new List<GroupsBaseClass>();
        public List<ScheduleTimeBaseClass> ScheduleTimeDB = new List<ScheduleTimeBaseClass>();
        public List<SubjectsBaseClass> SubjectsDB = new List<SubjectsBaseClass>();
        public List<ClassRoomsBaseClass> ClassRoomsDB = new List<ClassRoomsBaseClass>();
        public List<SiteUsersBaseClass> SiteUsersDB = new List<SiteUsersBaseClass>();
        public List<PodrazdelBaseClass> PodrazdelDB = new List<PodrazdelBaseClass>();
        public List<TeachersBaseClass> PrepodDB = new List<TeachersBaseClass>();
        public List<SiteGroupsBaseClass> SiteGroupsDB = new List<SiteGroupsBaseClass>();

        public bool OnceReleaseForUpdating = false;
        public Point startPoint;
        public FrameworkElement selectedRoom;

        public bool VisualEditorMode = false;
        public CreateRoomDialogBox crBox;
        public CreateScheduleDialogBox crSBox;
        public CreateSubjectDialogBox crSubBox;
        public CreateGroupDialogBox crGrpBox;
        public CreateTeacherDialogBox crTeacherBox;
        public CreateScheduleTimeDialogBox crSchedTimeBox;
        public CreatePodrazdelDialogBox crPodrazdelBox;
        public CreateSiteUsersDialogBox crSiteUsersBox;
        public CreateSiteGroupsDialogBox crSiteGroupsBox;

        public ObservableCollection<ClassRoomsBaseClass> ClassRoomsDB_CBOX { get; set; }
        public ObservableCollection<GroupsBaseClass> GroupsDB_CBOX { get; set; }
        public ObservableCollection<SubjectsBaseClass> SubjectsDB_CBOX { get; set; }
        public ObservableCollection<PodrazdelBaseClass> PodrazdelDB_CBOX { get; set; }
        public ObservableCollection<TeachersBaseClass> Prepod_CBOX { get; set; }
        public ObservableCollection<SiteGroupsBaseClass> SiteGroups_CBOX { get; set; }
        public BackupWindow bwWindow;

        private readonly BackgroundWorker worker = new BackgroundWorker();
        int iWorkerOperation = 0;
        public string connectionString;
        public bool bAdminMode;

        public AfterLoginWindow(String KeepConnectionString, bool bMainBaseExist, bool bAdmMode)
        {
            InitializeComponent();
            sheduleExist = bMainBaseExist;
            bAdminMode = bAdmMode;
            DataContext = this;

            worker.DoWork += worker_DoWork;
            worker.RunWorkerCompleted += worker_RunWorkerCompleted;
            worker.WorkerReportsProgress = true;
            worker.ProgressChanged += worker_ProgressChanged;

            EventManager.RegisterClassHandler(typeof(Window),
            Keyboard.KeyUpEvent, new KeyEventHandler(keyUp), true);

            connectionString = KeepConnectionString + "DATABASE=shedulebase;";
        }

        private void GroupsDatagrid_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        {

        }

        public AfterLoginWindow()
        {
            //Старый код и для теста. Доступно разработчику//
            InitializeComponent();
            sheduleExist = true;
            bAdminMode = true;
            DataContext = this;

            worker.DoWork += worker_DoWork;
            worker.RunWorkerCompleted += worker_RunWorkerCompleted;
            worker.WorkerReportsProgress = true;
            worker.ProgressChanged += worker_ProgressChanged;

            EventManager.RegisterClassHandler(typeof(Window),
            Keyboard.KeyUpEvent, new KeyEventHandler(keyUp), true);

            connectionString = "SERVER=localhost;" + "DATABASE=shedulebase;" + "UID=root;" + "PASSWORD=root;";
        }
        
        private void WindowLoaded(object sender, RoutedEventArgs e)
        {
            MainWindowGrid.Visibility = Visibility.Collapsed;
            ProcessingGrid.Visibility = Visibility.Visible;
            iWorkerOperation = 1;
            worker.RunWorkerAsync();
        }
        
        private void GroupsDatagrid_Loaded(object sender, RoutedEventArgs e)
        {
        }
        
        private void SheduleTimeDatagrid_Loaded(object sender, RoutedEventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(connectionString);

            connection.Open();

            string sql = "SELECT ID,DESCRIPTION,STARTTIME,ENDTIME FROM sheduletime ORDER BY ID";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.ExecuteNonQuery();

            MySqlDataAdapter dataAdap = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dataAdap.Fill(dt);
            //SheduleTimeDatagrid.ItemsSource = dt.DefaultView;
        }

        private void SheduleDatagrid_Loaded(object sender, RoutedEventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(connectionString);

            connection.Open();

            string sql = "SELECT ID,GROUPID,STARTTIME,ENDTIME,CLASSROOMID FROM shedule ORDER BY ID";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.ExecuteNonQuery();

            MySqlDataAdapter dataAdap = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dataAdap.Fill(dt);
            SheduleDatagrid.ItemsSource = dt.DefaultView;
        }

        private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void TabablzControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ClassRoomsDB_CBOX = new ObservableCollection<ClassRoomsBaseClass>(ClassRoomsDB);
            GroupsDB_CBOX = new ObservableCollection<GroupsBaseClass>(GroupsDB);
            SubjectsDB_CBOX = new ObservableCollection<SubjectsBaseClass>(SubjectsDB);
            PodrazdelDB_CBOX = new ObservableCollection<PodrazdelBaseClass>(PodrazdelDB);
            Prepod_CBOX = new ObservableCollection<TeachersBaseClass>(PrepodDB);
            SiteGroups_CBOX = new ObservableCollection<SiteGroupsBaseClass>(SiteGroupsDB);
        }

        private void ScheduleTableSelection(object sender, SelectionChangedEventArgs e)
        {
            if (SheduleDatagrid.SelectedItems.Count > 1)
            {
                ScheduleParamsBox.IsEnabled = false;
                VariantBox.IsEnabled = false;
                return;
            }

            ScheduleParamsBox.IsEnabled = true;
            VariantBox.IsEnabled = true;

            if (SheduleDatagrid.SelectedItem != null && !edtTime.IsKeyboardFocused)
            {
                if (SheduleDatagrid.SelectedItem.ToString().Equals("SheduleAuditorVisualisator.DBClasses.ScheduleBaseClass"))
                {
                    ScheduleBaseClass drV = (ScheduleBaseClass)SheduleDatagrid.SelectedItem;

                    pStartTimespanbox.Text = drV.dStartTime.ToString(@"HH\:mm");
                    pEndTimespanbox.Text = drV.dEndTime.ToString(@"HH\:mm");

                    dpickerSimple.Text = dpickerExtended.Text = drV.dStartTime.ToString("dd.MM.yyyy");

                    foreach (var sheduletime in ScheduleTimeDB)
                    {
                        ScheduleBaseClass sItem = (ScheduleBaseClass) SheduleDatagrid.SelectedItem;

                        int iTimeHours = sheduletime.dStartTime.Hours;
                        int iTimeMinutes = sheduletime.dStartTime.Minutes;

                        int iTimeHoursEnd = sheduletime.dEndTime.Hours;
                        int iTimeMinutesEnd = sheduletime.dEndTime.Minutes;

                        bool tFound = false;
                        if (iTimeHours == sItem.dStartTime.Hour && iTimeMinutes == sItem.dStartTime.Minute && iTimeHoursEnd == sItem.dEndTime.Hour && iTimeMinutesEnd == sItem.dEndTime.Minute)
                        {
                            for (int i = 0; i < edtTime.Items.Count; i++)
                            {
                                if (edtTime.Items[i].GetType().ToString().Contains("ScheduleTimeBaseClass"))
                                {
                                    ScheduleTimeBaseClass eIT = (ScheduleTimeBaseClass)edtTime.Items[i];

                                    if (eIT.dStartTime.Hours == iTimeHours && iTimeMinutes == eIT.dStartTime.Minutes && iTimeHoursEnd == eIT.dEndTime.Hours && iTimeMinutesEnd == eIT.dEndTime.Minutes)
                                    {
                                        edtTime.SelectedIndex = i;
                                        edtTime.IsEnabled = true;
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
                            edtTime.IsEnabled = false;
                        }
                    }
                }
                else
                {
                    edtTime.SelectedIndex = -1;
                }
            }
        }

        private void SubjectsTableSelection(object sender, SelectionChangedEventArgs e)
        {
            if (SubjectsDatagrid.SelectedItems.Count > 1)
            {
                SubjectsParamBox.IsEnabled = false;
                return;
            }
            SubjectsParamBox.IsEnabled = true;
            SubjectsDB_CBOX = new ObservableCollection<SubjectsBaseClass>(SubjectsDB);
        }

        private void GroupsTableSelection(object sender, SelectionChangedEventArgs e)
        {
            if (GroupsDatagrid.SelectedItems.Count > 1)
            {
                GroupsParamsBox.IsEnabled = false;
                return;
            }

            GroupsParamsBox.IsEnabled = true;
        }

        private void RoomsTableSelection(object sender, SelectionChangedEventArgs e)
        {
            if (ClassRoomsDatagrid.SelectedItem != null)
            {
                if (ClassRoomsDatagrid.SelectedItems.Count > 1)
                {
                    ParamsBox.IsEnabled = false;
                }
                else
                {
                    ParamsBox.IsEnabled = true;
                }
            }
        }

        private void VisualEditorButton_Click(object sender, RoutedEventArgs e)
        {
            if (VisualEditorMode)
            {
                ClassRoomsDatagrid.Visibility = Visibility.Visible;
                CanvasField.Visibility = VisualEditorToolbar.Visibility = Visibility.Hidden;
                VisualEditorMode = false;
                ParamsBox.IsEnabled = true;
                VisualEditorButton.Content = "К визуальному редактору";
                selectedRoom = null;
                CanvasDrawLevel(Int16.Parse(LevelTextBox.Text));
            }
            else
            {
                ClassRoomsDatagrid.Visibility = Visibility.Hidden;
                CanvasField.Visibility = VisualEditorToolbar.Visibility = Visibility.Visible;
                VisualEditorMode = true;
                ParamsBox.IsEnabled = false;
                VisualEditorButton.Content = "К табличному редактору";
                selectedRoom = null;
            }
            
            ClassRoomsDatagrid.SelectedIndex = -1;
        }

        private void addRectangleButton_Click(object sender, RoutedEventArgs e)
        {
            // create new Rectangle
            Rectangle rectangle = new Rectangle();
            // assign properties
            rectangle.Width = 100;
            rectangle.Height = 50;
            rectangle.Fill = new SolidColorBrush(Colors.RoyalBlue);
            // set default position
            Canvas.SetLeft(rectangle, 0);
            Canvas.SetTop(rectangle, 0);
            // add it to canvas
            CanvasField.Children.Add(rectangle);
        }

        private void testfunc(object sender, MouseButtonEventArgs e)
        {
            if (!VisualEditorMode)
            {
                return;
            }
            var mouseWasDownOn = e.Source as FrameworkElement;
            if (mouseWasDownOn != null)
            {
                string elementType = mouseWasDownOn.GetType().ToString();
                //Console.Out.WriteLine(elementType); //Дебаг для типа выбранного элемента
                if (elementType.Equals("System.Windows.Controls.Label"))
                {
                    if (mouseWasDownOn.Name.StartsWith("EDT_ROOM_I"))
                    {
                        if (selectedRoom != null)
                        {
                            ((Label)selectedRoom).BorderBrush = Brushes.Black;
                            ((Label)selectedRoom).BorderThickness = new Thickness(1, 1, 1, 1);
                            selectedRoom = null;
                        }
                        selectedRoom = mouseWasDownOn;
                        ((Label)mouseWasDownOn).BorderBrush = Brushes.Blue;
                        ((Label)mouseWasDownOn).BorderThickness = new Thickness(3, 3, 3, 3);
                        startPoint = Mouse.GetPosition(CanvasField);

                        foreach (var Room in ClassRoomsDB)
                        {
                            if (Room.iID.ToString().Equals(mouseWasDownOn.Name.Replace("EDT_ROOM_I", "")))
                            {
                                edtIDRM.IsEnabled = edtRoomNumber.IsEnabled = edtRoomCoordX.IsEnabled = edtRoomCoordY.IsEnabled = edtRoomWidth.IsEnabled = edtRoomHeight.IsEnabled = edtRoomType.IsEnabled = true;
                                //DeleteEntryButtonRM.IsEnabled = true;
                                ParamsBox.IsEnabled = true;
                                ClassRoomsDatagrid.SelectedItem = Room;
                                break;
                            }
                        }
                    }
                }
                else if (elementType.Equals("System.Windows.Controls.Canvas") || elementType.Equals("System.Windows.Shapes.Polygon"))
                {
                    if (selectedRoom != null)
                    {
                        ((Label)selectedRoom).BorderBrush = Brushes.Black;
                        ((Label)selectedRoom).BorderThickness = new Thickness(1, 1, 1, 1);
                        selectedRoom = null;

                        edtIDRM.IsEnabled = edtRoomNumber.IsEnabled = edtRoomCoordX.IsEnabled = edtRoomCoordY.IsEnabled = edtRoomWidth.IsEnabled = edtRoomHeight.IsEnabled = edtRoomType.IsEnabled = true;
                        //DeleteEntryButtonRM.IsEnabled = false;
                        ParamsBox.IsEnabled = false;
                        ClassRoomsDatagrid.SelectedIndex = -1;
                    }
                }
            }
        }

        private void testfuncMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed && selectedRoom!=null && CanvasField.IsMouseOver)
            {

                Label draggedObject = selectedRoom as Label;
                Point newPoint = Mouse.GetPosition(CanvasField);
                double left = Canvas.GetLeft(draggedObject);
                double top = Canvas.GetTop(draggedObject);
                Canvas.SetLeft(draggedObject, left + (newPoint.X - startPoint.X));
                Canvas.SetTop(draggedObject, top + (newPoint.Y - startPoint.Y));

                startPoint = newPoint;

                OnceReleaseForUpdating = true;

                //Console.Out.WriteLine("MouseX: " + Mouse.GetPosition(CanvasField).X + "; MouseY: " + Mouse.GetPosition(CanvasField).Y);
            }
            else
            {
            }
        }

        private static readonly Regex _regex = new Regex("[^0-9.-]+"); //Паттерн для чисел
        private static bool IsTextAllowed(string text)
        {
            return !_regex.IsMatch(text);
        }

        public void CanvasDrawLevel(int iLevel)
        {
            CanvasField.Children.Clear();

            Polygon p = new Polygon();
            p.Stroke = Brushes.Black;
            p.Fill = Brushes.White;
            p.StrokeThickness = 2;
            p.HorizontalAlignment = HorizontalAlignment.Left;
            p.VerticalAlignment = VerticalAlignment.Center;
            p.Points = new PointCollection() { new Point(16, 16), new Point(144, 16), new Point(144, 166), new Point(527, 166), new Point(527, 16), new Point(655, 16), new Point(655, 314), new Point(16, 314) };
            CanvasField.Children.Add(p);

            foreach (var Room in ClassRoomsDB)
            {
                if (Room.iNumber >= 100 * iLevel && Room.iNumber <= (100*iLevel)+99)
                {
                    Label roomLabel = new Label();
                    roomLabel.Name = "EDT_ROOM_I" + Room.iID;
                    roomLabel.Content = Room.iNumber;
                    roomLabel.Background = (SolidColorBrush)(new BrushConverter().ConvertFrom("#7F7F7F7F"));
                    roomLabel.BorderBrush = Brushes.Black;
                    roomLabel.BorderThickness = new Thickness(1, 1, 1, 1);
                    roomLabel.Width = Room.iWidth;
                    roomLabel.Height = Room.iHeight;

                    if (Room.iWidth < 32)
                    {
                        roomLabel.FontSize = Room.iWidth / 3;
                    }
                    roomLabel.VerticalContentAlignment = VerticalAlignment.Center;
                    roomLabel.HorizontalContentAlignment = HorizontalAlignment.Center;
                    Canvas.SetLeft(roomLabel, Room.iCoordX);
                    Canvas.SetTop(roomLabel, Room.iCoordY);
                    CanvasField.Children.Add(roomLabel);
                }
            }
        }

        private void LevelTextBoxTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true;
            }
            else
            {
                int iLvl = Int16.Parse(e.Text);
                if (iLvl <= 0 || iLvl >= 5)
                {
                    e.Handled = true;
                }
            }
        }

        private void LevelTextBoxChanged(object sender, TextChangedEventArgs e)
        {
            CanvasDrawLevel(Int16.Parse(LevelTextBox.Text));
        }

        private void LevelButtonClick(object sender, RoutedEventArgs e)
        {
            Button bButton = (Button)sender;
            if (bButton.Name.Equals("PrevLevelButton"))
            {
                int iLvl = Int16.Parse(LevelTextBox.Text);
                iLvl--;
                if (iLvl > 0 && iLvl < 5)
                {
                    LevelTextBox.Text = iLvl.ToString();
                }
            }
            else
            {
                int iLvl = Int16.Parse(LevelTextBox.Text);
                iLvl++;
                if (iLvl > 0 && iLvl < 5)
                {
                    LevelTextBox.Text = iLvl.ToString();
                }
            }
        }

        private void CreateNewRoom(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crBox = new CreateRoomDialogBox();
            crBox.ClassRoomsDB = ClassRoomsDB;
            crBox.ShowDialog();
            MainWindow.IsEnabled = true;

            if (crBox.iFreeID >= 0 && crBox.iNumberResult >= 0)
            {
                ClassRoomsBaseClass nClassRoom = new ClassRoomsBaseClass();
                nClassRoom.iID = crBox.iFreeID;
                nClassRoom.iNumber = crBox.iNumberResult;
                nClassRoom.iCoordX = nClassRoom.iCoordY = 0;
                nClassRoom.iWidth = nClassRoom.iHeight = 64;
                nClassRoom.iType = 0;
                ClassRoomsDB.Add(nClassRoom);

                CanvasDrawLevel(Int16.Parse(LevelTextBox.Text));
            }
            crBox = null;
            ClassRoomsDatagrid.Items.Refresh();
        }

        private void rbSVariant_Checked(object sender, RoutedEventArgs e)
        {
            if (ExtendedTimeBox == null || SimpleTimeBox == null) { return; }
            ExtendedTimeBox.Visibility = Visibility.Collapsed;
            SimpleTimeBox.Visibility = Visibility.Visible;
            VariantBox.Height = 99;
            DeleteEntryButton.Margin = new Thickness(5, 308, 9.8, 0);
            CreateEntryButton.Margin = new Thickness(5, 282, 9.8, 0);
        }

        private void rbEVariant_Checked(object sender, RoutedEventArgs e)
        {
            if (ExtendedTimeBox == null || SimpleTimeBox == null) { return; }
            SimpleTimeBox.Visibility = Visibility.Collapsed;
            ExtendedTimeBox.Visibility = Visibility.Visible;
            VariantBox.Height = 127;
            DeleteEntryButton.Margin = new Thickness(5, 340, 9.8, 0);
            CreateEntryButton.Margin = new Thickness(5, 314, 9.8, 0);
        }

        private void CreateEntryButtonRM_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crBox = new CreateRoomDialogBox();
            crBox.ClassRoomsDB = ClassRoomsDB;
            crBox.ShowDialog();
            MainWindow.IsEnabled = true;

            if (crBox.iFreeID >= 0 && crBox.iNumberResult >= 0)
            {
                ClassRoomsBaseClass nClassRoom = new ClassRoomsBaseClass();
                nClassRoom.iID = crBox.iFreeID;
                nClassRoom.iNumber = crBox.iNumberResult;
                nClassRoom.iCoordX = nClassRoom.iCoordY = 0;
                nClassRoom.iWidth = nClassRoom.iHeight = 64;
                nClassRoom.iType = 0;
                ClassRoomsDB.Add(nClassRoom);

                CanvasDrawLevel(Int16.Parse(LevelTextBox.Text));
            }
            crBox = null;
            ClassRoomsDatagrid.Items.Refresh(); //Во избежание крашей
        }

        public void UpdateSelectedRoomNow()
        {
            if (selectedRoom!= null && ClassRoomsDatagrid.SelectedIndex > -1 && ClassRoomsDatagrid.SelectedItems.Count<2)
            {
                ClassRoomsBaseClass nClassRoom = (ClassRoomsBaseClass)ClassRoomsDatagrid.SelectedItem;
                Label eCh = (Label) selectedRoom;
                if (eCh.Name.Equals("EDT_ROOM_I"+nClassRoom.iID))
                {
                    Canvas.SetLeft(eCh, nClassRoom.iCoordX);
                    Canvas.SetTop(eCh, nClassRoom.iCoordY);

                    eCh.Content = nClassRoom.iNumber;
                    eCh.Width = nClassRoom.iWidth;
                    eCh.Height = nClassRoom.iHeight;

                    if (nClassRoom.iWidth < 32)
                    {
                        eCh.FontSize = nClassRoom.iWidth / 3;
                    }
                }
            }
        }

        private void edtRoomType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateSelectedRoomNow();
        }

        private void MainWindow_MouseUp(object sender, MouseButtonEventArgs e)
        {
            if (OnceReleaseForUpdating && e.LeftButton == MouseButtonState.Released && selectedRoom != null && CanvasField.IsMouseOver)
            {
                OnceReleaseForUpdating = false;
                Label draggedObject = selectedRoom as Label;
                Canvas.SetTop(draggedObject, Math.Round(Canvas.GetTop(draggedObject)));
                Canvas.SetLeft(draggedObject, Math.Round(Canvas.GetLeft(draggedObject)));

                ClassRoomsBaseClass nClassRoom = (ClassRoomsBaseClass)ClassRoomsDatagrid.SelectedItem;
                nClassRoom.iCoordY = (int) Canvas.GetTop(draggedObject);
                nClassRoom.iCoordX = (int) Canvas.GetLeft(draggedObject);
                
                int lastIndex = ClassRoomsDatagrid.SelectedIndex;
                ClassRoomsDatagrid.SelectedIndex = -1;
                ClassRoomsDatagrid.SelectedIndex = lastIndex;
            }
        }

        private void edtChanged(object sender, RoutedEventArgs e)
        {
            UpdateSelectedRoomNow();
        }

        private void edtGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
        }

        private void SheduleDatagrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
        }

        private void dpicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (((DatePicker)sender).IsKeyboardFocusWithin && SheduleDatagrid.SelectedItem != null)
            {
                ScheduleBaseClass sBaseItem = (ScheduleBaseClass) SheduleDatagrid.SelectedItem;

                DateTime newStartDate = new DateTime(((DatePicker)sender).SelectedDate.Value.Year, ((DatePicker)sender).SelectedDate.Value.Month, ((DatePicker)sender).SelectedDate.Value.Day, sBaseItem.dStartTime.Hour, sBaseItem.dStartTime.Minute, sBaseItem.dStartTime.Second);
                DateTime newEndDate = new DateTime(((DatePicker)sender).SelectedDate.Value.Year, ((DatePicker)sender).SelectedDate.Value.Month, ((DatePicker)sender).SelectedDate.Value.Day, sBaseItem.dEndTime.Hour, sBaseItem.dEndTime.Minute, sBaseItem.dEndTime.Second);
                
                sBaseItem.dStartTime = newStartDate;
                sBaseItem.dEndTime = newEndDate;
                SheduleDatagrid.Items.Refresh();
            }
        }

        private void edtTime_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (edtTime.IsKeyboardFocusWithin && SheduleDatagrid.SelectedItem != null && edtTime.SelectedItem!=null)
            {
                ScheduleBaseClass sBaseItem = (ScheduleBaseClass)SheduleDatagrid.SelectedItem;
                ScheduleTimeBaseClass sTimeItem = (ScheduleTimeBaseClass)edtTime.SelectedItem;

                DateTime newStartDate = new DateTime(sBaseItem.dStartTime.Year, sBaseItem.dStartTime.Month, sBaseItem.dStartTime.Day, sTimeItem.dStartTime.Hours, sTimeItem.dStartTime.Minutes, sTimeItem.dStartTime.Seconds);
                DateTime newEndDate = new DateTime(sBaseItem.dEndTime.Year, sBaseItem.dEndTime.Month, sBaseItem.dEndTime.Day, sTimeItem.dEndTime.Hours, sTimeItem.dEndTime.Minutes, sTimeItem.dEndTime.Seconds);

                sBaseItem.dStartTime = newStartDate;
                sBaseItem.dEndTime = newEndDate;

                pStartTimespanbox.Text = newStartDate.ToString(@"HH\:mm");
                pEndTimespanbox.Text = newEndDate.ToString(@"HH\:mm");

                SheduleDatagrid.Items.Refresh();
            }
        }

        private void pStartTimespanbox_ValueChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if (pStartTimespanbox.IsKeyboardFocusWithin && SheduleDatagrid.SelectedItem != null)
            {
                ScheduleBaseClass sBaseItem = (ScheduleBaseClass)SheduleDatagrid.SelectedItem;

                DateTime newStartDate = new DateTime(sBaseItem.dStartTime.Year, sBaseItem.dStartTime.Month, sBaseItem.dStartTime.Day, pStartTimespanbox.Value.Value.Hour, pStartTimespanbox.Value.Value.Minute, 0);

                sBaseItem.dStartTime = newStartDate;

                SheduleDatagrid.Items.Refresh();
            }
        }

        private void pEndTimespanbox_ValueChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if (pEndTimespanbox.IsKeyboardFocusWithin && SheduleDatagrid.SelectedItem != null)
            {
                ScheduleBaseClass sBaseItem = (ScheduleBaseClass)SheduleDatagrid.SelectedItem;

                DateTime newEndDate = new DateTime(sBaseItem.dEndTime.Year, sBaseItem.dEndTime.Month, sBaseItem.dEndTime.Day, pEndTimespanbox.Value.Value.Hour, pEndTimespanbox.Value.Value.Minute, 0);

                sBaseItem.dEndTime = newEndDate;

                SheduleDatagrid.Items.Refresh();
            }
        }

        private void SheduleTimeDatagrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            if (SheduleTimeDatagrid.SelectedItems.Count > 1)
            {
                ScheduleTimeParamsBox.IsEnabled = false;
                return;
            }

            ScheduleTimeParamsBox.IsEnabled = true;

            if (SheduleTimeDatagrid.SelectedItem != null && !edtSTSD.IsKeyboardFocusWithin && !edtETSD.IsKeyboardFocusWithin)
            {
                if (SheduleTimeDatagrid.SelectedItem.ToString().Equals("SheduleAuditorVisualisator.DBClasses.ScheduleTimeBaseClass"))
                {
                    ScheduleTimeBaseClass drV = (ScheduleTimeBaseClass)SheduleTimeDatagrid.SelectedItem;

                    edtSTSD.Text = drV.dStartTime.ToString(@"hh\:mm");
                    edtETSD.Text = drV.dEndTime.ToString(@"hh\:mm");
                    DeleteEntryButtonST.IsEnabled = true;
                }
                else
                {
                    edtSTSD.Text = "";
                    edtETSD.Text = "";
                    DeleteEntryButtonST.IsEnabled = false;
                }
            }
        }

        private void edtSTSD_ValueChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if (edtSTSD.IsKeyboardFocusWithin && SheduleTimeDatagrid.SelectedItem != null)
            {
                ScheduleTimeBaseClass sBaseItem = (ScheduleTimeBaseClass)SheduleTimeDatagrid.SelectedItem;

                TimeSpan newStartDate = new TimeSpan(edtSTSD.Value.Value.Hour, edtSTSD.Value.Value.Minute, 0);

                sBaseItem.dStartTime = newStartDate;

                SheduleTimeDatagrid.Items.Refresh();
            }
        }

        private void edtETSD_ValueChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if (edtETSD.IsKeyboardFocusWithin && SheduleTimeDatagrid.SelectedItem != null)
            {
                ScheduleTimeBaseClass sBaseItem = (ScheduleTimeBaseClass)SheduleTimeDatagrid.SelectedItem;

                TimeSpan newEndDate = new TimeSpan(edtETSD.Value.Value.Hour, edtETSD.Value.Value.Minute, 0);

                sBaseItem.dEndTime = newEndDate;

                SheduleTimeDatagrid.Items.Refresh();
            }
        }

        private void MenuExitButton_Click(object sender, RoutedEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }

        public void Disconnect()
        {
            this.Hide();
            MainWindow mnWindow = new MainWindow();
            mnWindow.Show();
            this.Close();
        }

        private void MenuDisconnectButton_Click(object sender, RoutedEventArgs e)
        {
            Disconnect();
        }

        public void BackupWindowCommand()
        {
            if (bwWindow != null)
            {
                return;
            }
            MainWindow.IsEnabled = false;
            bwWindow = new BackupWindow();

            bwWindow.ScheduleDB = ScheduleDB;
            bwWindow.ClassRoomsDB = ClassRoomsDB;
            bwWindow.GroupsDB = GroupsDB;
            bwWindow.PodrazdelDB = PodrazdelDB;
            bwWindow.PrepodDB = PrepodDB;
            bwWindow.ScheduleTimeDB = ScheduleTimeDB;
            bwWindow.SiteUsersDB = SiteUsersDB;
            bwWindow.SubjectsDB = SubjectsDB;
            bwWindow.SiteGroupsDB = SiteGroupsDB;
            bwWindow.bAdminMode = bAdminMode;

            bwWindow.ShowDialog();

            if (bwWindow.bBackupLoadedFinally)
            {
                ScheduleDB = bwWindow.ScheduleDB;
                SheduleDatagrid.ItemsSource = ScheduleDB;

                ClassRoomsDB = bwWindow.ClassRoomsDB;
                ClassRoomsDatagrid.ItemsSource = ClassRoomsDB;

                PodrazdelDB = bwWindow.PodrazdelDB;
                PodrazdelDataGrid.ItemsSource = PodrazdelDB;

                PrepodDB = bwWindow.PrepodDB;
                PrepodDataGrid.ItemsSource = PrepodDB;

                ScheduleTimeDB = bwWindow.ScheduleTimeDB;
                SheduleTimeDatagrid.ItemsSource = ScheduleTimeDB;

                SiteUsersDB = bwWindow.SiteUsersDB;
                SiteUsersDataGrid.ItemsSource = SiteUsersDB;

                SiteGroupsDB = bwWindow.SiteGroupsDB;
                SiteGroupsDataGrid.ItemsSource = SiteGroupsDB;

                SubjectsDB = bwWindow.SubjectsDB;
                SubjectsDatagrid.ItemsSource = SubjectsDB;

                GroupsDB = bwWindow.GroupsDB;
                GroupsDatagrid.ItemsSource = GroupsDB;

                ClassRoomsDB_CBOX = new ObservableCollection<ClassRoomsBaseClass>(ClassRoomsDB);
                GroupsDB_CBOX = new ObservableCollection<GroupsBaseClass>(GroupsDB);
                SubjectsDB_CBOX = new ObservableCollection<SubjectsBaseClass>(SubjectsDB);
                PodrazdelDB_CBOX = new ObservableCollection<PodrazdelBaseClass>(PodrazdelDB);
                Prepod_CBOX = new ObservableCollection<TeachersBaseClass>(PrepodDB);
                SiteGroups_CBOX = new ObservableCollection<SiteGroupsBaseClass>(SiteGroupsDB);

                edtGroup.ItemsSource = GroupsDB;
                edtRoom.ItemsSource = ClassRoomsDB;
                edtSubject.ItemsSource = SubjectsDB;
                edtTime.ItemsSource = ScheduleTimeDB;
                edtPodrazGRPS.ItemsSource = PodrazdelDB;
                edtTeacher.ItemsSource = PrepodDB;
                edtGroupSU.ItemsSource = SiteGroupsDB;

                ClassRoomsDatagrid.Items.Refresh();
                SheduleDatagrid.Items.Refresh();
                PodrazdelDataGrid.Items.Refresh();
                PrepodDataGrid.Items.Refresh();
                SheduleTimeDatagrid.Items.Refresh();
                SiteUsersDataGrid.Items.Refresh();
                SubjectsDatagrid.Items.Refresh();
                GroupsDatagrid.Items.Refresh();
                SiteGroupsDataGrid.Items.Refresh();
            }
            MainWindow.IsEnabled = true;
            bwWindow = null;
        }

        private void MenuBackupButton_Click(object sender, RoutedEventArgs e)
        {
            BackupWindowCommand();
        }

        void UpdateSubjectsOnServer()
        {
            MainWindowGrid.IsEnabled = false;
            if (MessageBox.Show("Вы точно хотите загрузить изменения на сервер?", "Подтверждение действия", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.No)
            {
                MainWindowGrid.IsEnabled = true;
                return;
            }
            iWorkerOperation = 0;
            worker.RunWorkerAsync();
        }

        private void UpdateServerTableButton_Click(object sender, RoutedEventArgs e)
        {
            UpdateSubjectsOnServer();
        }

        private void DeleteEntryButtonRM_Click(object sender, RoutedEventArgs e)
        {
            if (ClassRoomsDatagrid.SelectedItems.Count > 1)
            {
                foreach (var selRoom in ClassRoomsDatagrid.SelectedItems)
                {
                    ClassRoomsDB.Remove(((ClassRoomsBaseClass)selRoom));
                }
            }
            else
            {
                ClassRoomsDB.Remove((ClassRoomsBaseClass)ClassRoomsDatagrid.SelectedItem);
            }
            ClassRoomsDatagrid.Items.Refresh();
            ClassRoomsDB_CBOX = new ObservableCollection<ClassRoomsBaseClass>(ClassRoomsDB);
        }

        private void DeleteEntryButton_Click(object sender, RoutedEventArgs e)
        {
            if (SheduleDatagrid.SelectedItems.Count > 1)
            {
                foreach (var selSched in SheduleDatagrid.SelectedItems)
                {
                    ScheduleDB.Remove(((ScheduleBaseClass)selSched));
                }
            }
            else
            {
                ScheduleDB.Remove((ScheduleBaseClass)SheduleDatagrid.SelectedItem);
            }
            SheduleDatagrid.Items.Refresh();
        }

        private void CreateEntryButton_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crSBox = new CreateScheduleDialogBox(ScheduleDB, ScheduleTimeDB, ClassRoomsDB, PrepodDB, SubjectsDB, GroupsDB);
            crSBox.ShowDialog();

            if (crSBox.sNewItem != null)
            {
                ScheduleDB.Add(crSBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crSBox = null;
            SheduleDatagrid.Items.Refresh();
        }

        private void DeleteEntryButtonSBJ_Click(object sender, RoutedEventArgs e)
        {
            if (SubjectsDatagrid.SelectedItems.Count > 1)
            {
                foreach (var selSub in SubjectsDatagrid.SelectedItems)
                {
                    SubjectsDB.Remove(((SubjectsBaseClass)selSub));
                }
            }
            else
            {
                SubjectsDB.Remove((SubjectsBaseClass)SubjectsDatagrid.SelectedItem);
            }
            SubjectsDatagrid.Items.Refresh();
            SubjectsDB_CBOX = new ObservableCollection<SubjectsBaseClass>(SubjectsDB);
        }

        private void CreateEntrySBJButton_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crSubBox = new CreateSubjectDialogBox(SubjectsDB);
            crSubBox.ShowDialog();

            if (crSubBox.sNewItem != null)
            {
                SubjectsDB.Add(crSubBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crSubBox = null;
            SubjectsDatagrid.Items.Refresh();
            SubjectsDB_CBOX = new ObservableCollection<SubjectsBaseClass>(SubjectsDB);
        }

        private void DeleteEntryButtonGRPS_Click(object sender, RoutedEventArgs e)
        {
            if (GroupsDatagrid.SelectedItems.Count > 1)
            {
                foreach (var selGrp in GroupsDatagrid.SelectedItems)
                {
                    GroupsDB.Remove(((GroupsBaseClass)selGrp));
                }
            }
            else
            {
                GroupsDB.Remove((GroupsBaseClass)GroupsDatagrid.SelectedItem);
            }
            GroupsDatagrid.Items.Refresh();
            GroupsDB_CBOX = new ObservableCollection<GroupsBaseClass>(GroupsDB);
        }

        private void CreateEntryButtonGRPS_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crGrpBox = new CreateGroupDialogBox(GroupsDB,PodrazdelDB);
            crGrpBox.ShowDialog();

            if (crGrpBox.sNewItem != null)
            {
                GroupsDB.Add(crGrpBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crGrpBox = null;
            GroupsDatagrid.Items.Refresh();
            GroupsDB_CBOX = new ObservableCollection<GroupsBaseClass>(GroupsDB);
        }

        private void CreateEntryButtonPREP_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crTeacherBox = new CreateTeacherDialogBox(PrepodDB);
            crTeacherBox.ShowDialog();

            if (crTeacherBox.sNewItem != null)
            {
                PrepodDB.Add(crTeacherBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crTeacherBox = null;
            PrepodDataGrid.Items.Refresh();
            Prepod_CBOX = new ObservableCollection<TeachersBaseClass>(PrepodDB);
        }

        private void DeleteEntryButtonPREP_Click(object sender, RoutedEventArgs e)
        {
            if (PrepodDataGrid.SelectedItems.Count > 1)
            {
                foreach (var selTeach in PrepodDataGrid.SelectedItems)
                {
                    PrepodDB.Remove(((TeachersBaseClass)selTeach));
                }
            }
            else
            {
                PrepodDB.Remove((TeachersBaseClass)PrepodDataGrid.SelectedItem);
            }
            PrepodDataGrid.Items.Refresh();
            Prepod_CBOX = new ObservableCollection<TeachersBaseClass>(PrepodDB);
        }

        private void PrepodDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (PrepodDataGrid.SelectedItems.Count > 1)
            {
                TeacherParamsBox.IsEnabled = false;
                return;
            }

            TeacherParamsBox.IsEnabled = true;
        }

        private void CreateEntryButtonST_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crSchedTimeBox = new CreateScheduleTimeDialogBox(ScheduleTimeDB);
            crSchedTimeBox.ShowDialog();

            if (crSchedTimeBox.sNewItem != null)
            {
                ScheduleTimeDB.Add(crSchedTimeBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crSchedTimeBox = null;
            SheduleTimeDatagrid.Items.Refresh();
        }

        private void DeleteEntryButtonST_Click(object sender, RoutedEventArgs e)
        {
            if (SheduleTimeDatagrid.SelectedItems.Count > 1)
            {
                foreach (var selSTime in SheduleTimeDatagrid.SelectedItems)
                {
                    ScheduleTimeDB.Remove(((ScheduleTimeBaseClass)selSTime));
                }
            }
            else
            {
                ScheduleTimeDB.Remove((ScheduleTimeBaseClass)SheduleTimeDatagrid.SelectedItem);
            }
            SheduleTimeDatagrid.Items.Refresh();
        }

        private void CreateEntryButtonPODR_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crPodrazdelBox = new CreatePodrazdelDialogBox(PodrazdelDB);
            crPodrazdelBox.ShowDialog();

            if (crPodrazdelBox.sNewItem != null)
            {
                PodrazdelDB.Add(crPodrazdelBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crPodrazdelBox = null;
            PodrazdelDataGrid.Items.Refresh();
            PodrazdelDB_CBOX = new ObservableCollection<PodrazdelBaseClass>(PodrazdelDB);
        }

        private void DeleteEntryButtonPODR_Click(object sender, RoutedEventArgs e)
        {
            if (PodrazdelDataGrid.SelectedItems.Count > 1)
            {
                foreach (var selPodr in PodrazdelDataGrid.SelectedItems)
                {
                    PodrazdelDB.Remove(((PodrazdelBaseClass)selPodr));
                }
            }
            else
            {
                PodrazdelDB.Remove((PodrazdelBaseClass)PodrazdelDataGrid.SelectedItem);
            }
            PodrazdelDataGrid.Items.Refresh();
        }

        private void PodrazdelDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (PodrazdelDataGrid.SelectedItems.Count > 1)
            {
                PodrazdelParamsBox.IsEnabled = false;
                return;
            }

            PodrazdelParamsBox.IsEnabled = true;
        }

        private void DeleteEntryButtonSGRPS_Click(object sender, RoutedEventArgs e)
        {
            if (SiteGroupsDataGrid.SelectedItems.Count > 1)
            {
                foreach (var selSiGp in SiteGroupsDataGrid.SelectedItems)
                {
                    SiteGroupsDB.Remove(((SiteGroupsBaseClass)selSiGp));
                }
            }
            else
            {
                SiteGroupsDB.Remove((SiteGroupsBaseClass)SiteGroupsDataGrid.SelectedItem);
            }
            SiteGroupsDataGrid.Items.Refresh();
            SiteGroups_CBOX = new ObservableCollection<SiteGroupsBaseClass>(SiteGroupsDB);
        }

        private void CreateEntryButtonSGRPS_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crSiteGroupsBox = new CreateSiteGroupsDialogBox(SiteGroupsDB);
            crSiteGroupsBox.ShowDialog();

            if (crSiteGroupsBox.sNewItem != null)
            {
                SiteGroupsDB.Add(crSiteGroupsBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crSiteGroupsBox = null;
            SiteGroupsDataGrid.Items.Refresh();
            SiteGroups_CBOX = new ObservableCollection<SiteGroupsBaseClass>(SiteGroupsDB);
        }

        private void SiteUsersDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (SiteUsersDataGrid.SelectedItems.Count > 1)
            {
                SiteUsersParamsBox.IsEnabled = false;
                return;
            }

            SiteUsersParamsBox.IsEnabled = true;
        }

        private void CreateEntryButtonSU_Click(object sender, RoutedEventArgs e)
        {
            MainWindow.IsEnabled = false;
            crSiteUsersBox = new CreateSiteUsersDialogBox(SiteUsersDB, SiteGroupsDB);
            crSiteUsersBox.ShowDialog();

            if (crSiteUsersBox.sNewItem != null)
            {
                SiteUsersDB.Add(crSiteUsersBox.sNewItem);
            }

            MainWindow.IsEnabled = true;
            crSiteUsersBox = null;
            SiteUsersDataGrid.Items.Refresh();
        }

        private void DeleteEntryButtonSU_Click(object sender, RoutedEventArgs e)
        {
            if (SiteUsersDataGrid.SelectedItems.Count > 1)
            {
                foreach (var selSiUs in SiteUsersDataGrid.SelectedItems)
                {
                    SiteUsersDB.Remove(((SiteUsersBaseClass)selSiUs));
                }
            }
            else
            {
                SiteUsersDB.Remove((SiteUsersBaseClass)SiteUsersDataGrid.SelectedItem);
            }
            SiteUsersDataGrid.Items.Refresh();
        }

        private void SiteGroupsDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void worker_DoWork(object sender, DoWorkEventArgs e)
        {
            if (iWorkerOperation == 0)
            {
                if (bAdminMode)
                {
                    this.Dispatcher.Invoke(new Action(() => ProcessingGrid.Visibility = Visibility.Visible));
                    worker.ReportProgress(0, "Отправление запроса серверу");
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        //Начинаем процесс.
                        string sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table subjects; SET FOREIGN_KEY_CHECKS = 1;";
                        MySqlCommand command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(10, "Применение данных к таблице \"Дисциплины\"");

                        string strFCommand;

                        if (SubjectsDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `subjects` (`ID`, `NAME`) VALUES" + System.Environment.NewLine;

                            SubjectsBaseClass ISubjLast = SubjectsDB.Last();
                            foreach (var ISubj in SubjectsDB)
                            {
                                if (ISubj.Equals(ISubjLast))
                                {
                                    strFCommand += "(" + ISubj.iID + ", '" + ISubj.strName + "');";
                                }
                                else
                                {
                                    strFCommand += "(" + ISubj.iID + ", '" + ISubj.strName + "'),";
                                }
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table classrooms; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(20, "Применение данных к таблице \"Аудитории\"");

                        if (ClassRoomsDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `classrooms` (`ID`, `NUMBER`, `CoordX`, `CoordY`, `Width`, `Height`, `Type`) VALUES" + System.Environment.NewLine;

                            ClassRoomsBaseClass ICLRLast = ClassRoomsDB.Last();
                            foreach (var ICLR in ClassRoomsDB)
                            {
                                if (ICLR.Equals(ICLRLast))
                                {
                                    strFCommand += "(" + ICLR.iID + ", " + ICLR.iNumber + ", " + ICLR.iCoordX + ", " + ICLR.iCoordY + ", " + ICLR.iWidth + ", " + ICLR.iHeight + ", " + ICLR.iType + ");";
                                }
                                else
                                {
                                    strFCommand += "(" + ICLR.iID + ", " + ICLR.iNumber + ", " + ICLR.iCoordX + ", " + ICLR.iCoordY + ", " + ICLR.iWidth + ", " + ICLR.iHeight + ", " + ICLR.iType + "),";
                                }
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table groups; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(30, "Применение данных к таблице \"Группы\"");

                        if (GroupsDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `groups` (`ID`, `NAME`, `PODRAZID`) VALUES" + System.Environment.NewLine;

                            GroupsBaseClass IGRPLast = GroupsDB.Last();
                            foreach (var IGRP in GroupsDB)
                            {
                                strFCommand += "(" + IGRP.iID + ", '" + IGRP.strName + "', " + IGRP.iPodrazID + ")" + ((IGRP.Equals(IGRPLast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table podrazdel; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(40, "Применение данных к таблице \"Подразделения\"");

                        if (PodrazdelDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `podrazdel` (`ID`, `NAME`) VALUES" + System.Environment.NewLine;

                            PodrazdelBaseClass IPDZLast = PodrazdelDB.Last();
                            foreach (var IPDZ in PodrazdelDB)
                            {
                                strFCommand += "(" + IPDZ.iID + ", '" + IPDZ.strName + "')" + ((IPDZ.Equals(IPDZLast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table shedule; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(50, "Применение данных к таблице \"Расписание\"");

                        if (ScheduleDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `shedule` (`ID`, `GROUPID`, `SUBJECTID`, `STARTTIME`, `ENDTIME`, `CLASSROOMID`, `TEACHERID`) VALUES" + System.Environment.NewLine;

                            ScheduleBaseClass ISCHLast = ScheduleDB.Last();

                            foreach (var ISCH in ScheduleDB)
                            {
                                strFCommand += "(" + ISCH.iID + ", " + ISCH.iGroupID + ", " + ISCH.iSubjectID + ", '" + ISCH.dStartTime.ToString(@"yyy-MM-dd HH:mm:ss") + "', '" + ISCH.dEndTime.ToString(@"yyy-MM-dd HH:mm:ss") + "', " + ISCH.iClassRoomID + ", " + ISCH.iTeacherID + ")" + ((ISCH.Equals(ISCHLast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table sheduletime; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(60, "Применение данных к таблице \"Время занятий\"");

                        if (ScheduleTimeDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `sheduletime` (`ID`, `DESCRIPTION`, `STARTTIME`, `ENDTIME`) VALUES" + System.Environment.NewLine;

                            ScheduleTimeBaseClass ISCHTLast = ScheduleTimeDB.Last();

                            foreach (var ISCHT in ScheduleTimeDB)
                            {
                                strFCommand += "(" + ISCHT.iID + ", '" + ISCHT.strDescription + "', '" + ISCHT.dStartTime.ToString() + "', '" + ISCHT.dEndTime.ToString() + "')" + ((ISCHT.Equals(ISCHTLast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table sitegroups; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(70, "Применение данных к таблице \"Группы сайта\"");

                        if (SiteGroupsDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `sitegroups` (`ID`, `NAME`) VALUES" + System.Environment.NewLine;

                            SiteGroupsBaseClass ISGLast = SiteGroupsDB.Last();
                            foreach (var ISGit in SiteGroupsDB)
                            {
                                strFCommand += "(" + ISGit.iID + ", '" + ISGit.strName + "')" + ((ISGit.Equals(ISGLast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table siteusers; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(80, "Применение данных к таблице \"Пользователи сайта\"");

                        if (SiteUsersDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `siteusers` (`ID`, `LOGIN`, `PASSWORD`, `NAME`, `SECONDNAME`, `THIRDNAME`, `GROUPID`, `NUMBER`, `EMAIL`) VALUES" + System.Environment.NewLine;

                            SiteUsersBaseClass ISULast = SiteUsersDB.Last();
                            foreach (var ISUit in SiteUsersDB)
                            {
                                strFCommand += "(" + ISUit.iID + ", '" + ISUit.ULogin + "', '" + ISUit.UPassword + "', '" + ISUit.strName + "', '" + ISUit.strName2 + "', '" + ISUit.strName3 + "', " + ISUit.iGroup + ", '" + ISUit.strNumber + "', '" + ISUit.strEmail + "')" + ((ISUit.Equals(ISULast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        //Следующая таблица
                        sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table teachers; SET FOREIGN_KEY_CHECKS = 1;";
                        command = new MySqlCommand(sql, connection);

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(90, "Применение данных к таблице \"Преподаватели\"");

                        if (PrepodDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `teachers` (`ID`, `FIO`) VALUES" + System.Environment.NewLine;

                            TeachersBaseClass ITeacherLast = PrepodDB.Last();
                            foreach (var ITeachr in PrepodDB)
                            {
                                strFCommand += "(" + ITeachr.iID + ", '" + ITeachr.strFIO + "')" + ((ITeachr.Equals(ITeacherLast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        worker.ReportProgress(100, "Готово!");
                    }
                }
                else
                {
                    this.Dispatcher.Invoke(new Action(() => ProcessingGrid.Visibility = Visibility.Visible));
                    worker.ReportProgress(0, "Отправление запроса серверу");
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        //Начинаем процесс.
                        string sql = "SET FOREIGN_KEY_CHECKS = 0; TRUNCATE table shedule; SET FOREIGN_KEY_CHECKS = 1;";
                        MySqlCommand command = new MySqlCommand(sql, connection);
                        string strFCommand;

                        command.Connection.Open();
                        command.ExecuteNonQuery();
                        command.Connection.Close();

                        worker.ReportProgress(50, "Применение данных к таблице \"Расписание\"");

                        if (ScheduleDB.Count > 0)
                        {
                            strFCommand = "REPLACE INTO `shedule` (`ID`, `GROUPID`, `SUBJECTID`, `STARTTIME`, `ENDTIME`, `CLASSROOMID`, `TEACHERID`) VALUES" + System.Environment.NewLine;

                            ScheduleBaseClass ISCHLast = ScheduleDB.Last();

                            foreach (var ISCH in ScheduleDB)
                            {
                                strFCommand += "(" + ISCH.iID + ", " + ISCH.iGroupID + ", " + ISCH.iSubjectID + ", '" + ISCH.dStartTime.ToString(@"yyy-MM-dd HH:mm:ss") + "', '" + ISCH.dEndTime.ToString(@"yyy-MM-dd HH:mm:ss") + "', " + ISCH.iClassRoomID + ", " + ISCH.iTeacherID + ")" + ((ISCH.Equals(ISCHLast)) ? ";" : ",");
                            }

                            command = new MySqlCommand(strFCommand, connection);
                            command.Connection.Open();
                            command.ExecuteNonQuery();
                            command.Connection.Close();
                        }

                        worker.ReportProgress(100, "Готово!");
                    }
                }
            }
            else if (iWorkerOperation == 1)
            {
                if (bAdminMode)
                {
                    worker.ReportProgress(0, "Отправление запроса серверу");
                    MySqlConnection connection = new MySqlConnection(connectionString);

                    connection.Open();

                    worker.ReportProgress(10, "Получение данных \"Расписание\"");
                    ScheduleDB.Clear();
                    string sql = "SELECT ID,GROUPID,SUBJECTID,STARTTIME,ENDTIME,CLASSROOMID,TEACHERID FROM shedule ORDER BY ID";
                    MySqlCommand cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            ScheduleDB.Add(new ScheduleBaseClass() { iID = rdr.GetInt32(0), iGroupID = rdr.GetInt32(1), iSubjectID = rdr.GetInt32(2), dStartTime = rdr.GetDateTime(3), dEndTime = rdr.GetDateTime(4), iClassRoomID = rdr.GetInt32(5), iTeacherID = rdr.GetInt32(6) });
                        }
                    }

                    /*sql = "SELECT g.ID,h.NAME as 'Group', h1.DESCRIPTION as 'SheduleTime', h2.NUMBER as 'Room' FROM shedule g JOIN groups h ON h.id = g.groupid JOIN sheduletime h1 ON h1.id = g.scheduletime JOIN classrooms h2 ON h2.id = g.classroomid";
                    cmd = new MySqlCommand(sql, connection);*/

                    MySqlDataAdapter dataAdap = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    /*dataAdap.Fill(dt);
                    SheduleDatagrid.ItemsSource = dt.DefaultView;*/

                    //Next SQL requests
                    worker.ReportProgress(20, "Получение данных \"Группы\"");
                    GroupsDB.Clear();
                    sql = "SELECT ID,NAME,PODRAZID FROM groups ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            GroupsDB.Add(new GroupsBaseClass() { iID = rdr.GetInt32(0), strName = rdr.GetString(1), iPodrazID = rdr.GetInt32(2) });
                        }
                    }

                    worker.ReportProgress(30, "Получение данных \"Время занятий\"");
                    ScheduleTimeDB.Clear();
                    sql = "SELECT ID,DESCRIPTION,STARTTIME,ENDTIME FROM sheduletime ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            ScheduleTimeDB.Add(new ScheduleTimeBaseClass() { iID = rdr.GetInt32(0), strDescription = rdr.GetString(1), dStartTime = rdr.GetTimeSpan(2), dEndTime = rdr.GetTimeSpan(3) });
                        }
                    }

                    worker.ReportProgress(40, "Получение данных \"Дисциплины\"");
                    SubjectsDB.Clear();
                    sql = "SELECT ID,NAME FROM subjects ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            SubjectsDB.Add(new SubjectsBaseClass() { iID = rdr.GetInt32(0), strName = rdr.GetString(1) });
                        }
                    }

                    worker.ReportProgress(50, "Получение данных \"Аудитории\"");
                    ClassRoomsDB.Clear();
                    sql = "SELECT ID,NUMBER,CoordX,CoordY,Width,Height,Type FROM classrooms ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    //Старый вариант загрузки данных...На всякий закомментировал и перенес весь код. НЕ РАССКОМЕНТИВАТЬ, ТУТ ДРУГОЙ ПОТОК!
                    /*dataAdap = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    dataAdap.Fill(dt);
                    ClassRoomsDatagrid.ItemsSource = dt.DefaultView;*/

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            ClassRoomsDB.Add(new ClassRoomsBaseClass() { iID = rdr.GetInt32(0), iNumber = rdr.GetInt32(1), iCoordX = rdr.GetInt32(2), iCoordY = rdr.GetInt32(3), iWidth = rdr.GetInt32(4), iHeight = rdr.GetInt32(5), iType = rdr.GetInt32(6) });
                        }
                    }

                    worker.ReportProgress(60, "Получение данных \"Подразделения\"");
                    PodrazdelDB.Clear();
                    sql = "SELECT ID,NAME FROM podrazdel ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            PodrazdelDB.Add(new PodrazdelBaseClass() { iID = rdr.GetInt32(0), strName = rdr.GetString(1) });
                        }
                    }

                    worker.ReportProgress(70, "Получение данных \"Преподаватели\"");
                    PrepodDB.Clear();
                    sql = "SELECT ID,FIO FROM teachers ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            PrepodDB.Add(new TeachersBaseClass() { iID = rdr.GetInt32(0), strFIO = rdr.GetString(1) });
                        }
                    }

                    worker.ReportProgress(80, "Получение данных \"Пользователи сайта\"");
                    SiteUsersDB.Clear();
                    sql = "SELECT * FROM siteusers ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            SiteUsersDB.Add(new SiteUsersBaseClass() { iID = rdr.GetInt32(0), ULogin = rdr.GetString(1), UPassword = rdr.GetString(2), strName = rdr.GetString(3), strName2 = rdr.GetString(4), strName3 = rdr.GetString(5), iGroup = rdr.GetInt32(6), strNumber = rdr.GetString(7), strEmail = rdr.GetString(8) });
                        }
                    }

                    worker.ReportProgress(90, "Получение данных \"Группы сайта\"");
                    SiteGroupsDB.Clear();
                    sql = "SELECT ID,NAME FROM sitegroups ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            SiteGroupsDB.Add(new SiteGroupsBaseClass() { iID = rdr.GetInt32(0), strName = rdr.GetString(1) });
                        }
                    }

                    connection.Close();

                    worker.ReportProgress(100, "Готово!");
                }
                else
                {
                    worker.ReportProgress(0, "Отправление запроса серверу");
                    MySqlConnection connection = new MySqlConnection(connectionString);

                    connection.Open();

                    worker.ReportProgress(10, "Получение данных \"Расписание\"");
                    ScheduleDB.Clear();
                    string sql = "SELECT ID,GROUPID,SUBJECTID,STARTTIME,ENDTIME,CLASSROOMID,TEACHERID FROM shedule ORDER BY STARTTIME";
                    MySqlCommand cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            ScheduleDB.Add(new ScheduleBaseClass() { iID = rdr.GetInt32(0), iGroupID = rdr.GetInt32(1), iSubjectID = rdr.GetInt32(2), dStartTime = rdr.GetDateTime(3), dEndTime = rdr.GetDateTime(4), iClassRoomID = rdr.GetInt32(5), iTeacherID = rdr.GetInt32(6) });
                        }
                    }

                    //Next SQL requests
                    worker.ReportProgress(20, "Получение данных \"Группы\"");
                    GroupsDB.Clear();
                    sql = "SELECT ID,NAME,PODRAZID FROM groups ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            GroupsDB.Add(new GroupsBaseClass() { iID = rdr.GetInt32(0), strName = rdr.GetString(1), iPodrazID = rdr.GetInt32(2) });
                        }
                    }

                    worker.ReportProgress(30, "Получение данных \"Время занятий\"");
                    ScheduleTimeDB.Clear();
                    sql = "SELECT ID,DESCRIPTION,STARTTIME,ENDTIME FROM sheduletime ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            ScheduleTimeDB.Add(new ScheduleTimeBaseClass() { iID = rdr.GetInt32(0), strDescription = rdr.GetString(1), dStartTime = rdr.GetTimeSpan(2), dEndTime = rdr.GetTimeSpan(3) });
                        }
                    }

                    worker.ReportProgress(40, "Получение данных \"Дисциплины\"");
                    SubjectsDB.Clear();
                    sql = "SELECT ID,NAME FROM subjects ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            SubjectsDB.Add(new SubjectsBaseClass() { iID = rdr.GetInt32(0), strName = rdr.GetString(1) });
                        }
                    }

                    worker.ReportProgress(50, "Получение данных \"Аудитории\"");
                    ClassRoomsDB.Clear();
                    sql = "SELECT ID,NUMBER,CoordX,CoordY,Width,Height,Type FROM classrooms ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            ClassRoomsDB.Add(new ClassRoomsBaseClass() { iID = rdr.GetInt32(0), iNumber = rdr.GetInt32(1), iCoordX = rdr.GetInt32(2), iCoordY = rdr.GetInt32(3), iWidth = rdr.GetInt32(4), iHeight = rdr.GetInt32(5), iType = rdr.GetInt32(6) });
                        }
                    }

                    worker.ReportProgress(65, "Получение данных \"Подразделения\"");
                    PodrazdelDB.Clear();
                    sql = "SELECT ID,NAME FROM podrazdel ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            PodrazdelDB.Add(new PodrazdelBaseClass() { iID = rdr.GetInt32(0), strName = rdr.GetString(1) });
                        }
                    }

                    worker.ReportProgress(85, "Получение данных \"Преподаватели\"");
                    PrepodDB.Clear();
                    sql = "SELECT ID,FIO FROM teachers ORDER BY ID";
                    cmd = new MySqlCommand(sql, connection);
                    cmd.ExecuteNonQuery();

                    using (MySqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            PrepodDB.Add(new TeachersBaseClass() { iID = rdr.GetInt32(0), strFIO = rdr.GetString(1) });
                        }
                    }

                    connection.Close();

                    worker.ReportProgress(100, "Готово!");
                }
            }
        }

        private void worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            ProcessingGrid.Visibility = Visibility.Collapsed;
            MainWindowGrid.IsEnabled = true;
            if (iWorkerOperation == 0)
            {
                MessageBox.Show("Данные на сервере были успешно обновлены!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else if (iWorkerOperation == 1)
            {

                if (bAdminMode)
                {
                    ClassRoomsDatagrid.ItemsSource =
                    SheduleDatagrid.ItemsSource =
                    SubjectsDatagrid.ItemsSource =
                    GroupsDatagrid.ItemsSource =
                    PrepodDataGrid.ItemsSource =
                    SheduleTimeDatagrid.ItemsSource =
                    PodrazdelDataGrid.ItemsSource =
                    SiteUsersDataGrid.ItemsSource =
                    SiteGroupsDataGrid.ItemsSource = null;

                    ClassRoomsDatagrid.Items.Clear();
                    SheduleDatagrid.Items.Clear();
                    SubjectsDatagrid.Items.Clear();
                    GroupsDatagrid.Items.Clear();
                    PrepodDataGrid.Items.Clear();
                    SheduleTimeDatagrid.Items.Clear();
                    PodrazdelDataGrid.Items.Clear();
                    SiteUsersDataGrid.Items.Clear();
                    SiteGroupsDataGrid.Items.Clear();

                    SheduleDatagrid.ItemsSource = ScheduleDB;

                    edtGroup.ItemsSource = GroupsDB;
                    GroupsDatagrid.ItemsSource = GroupsDB;
                    edtGroup.DisplayMemberPath = "strName";

                    SheduleTimeDatagrid.ItemsSource = ScheduleTimeDB;
                    edtTime.ItemsSource = ScheduleTimeDB;
                    edtTime.DisplayMemberPath = "strDescription";
                    edtTime.SelectedValuePath = "iID";

                    SubjectsDatagrid.ItemsSource = SubjectsDB;
                    edtSubject.ItemsSource = SubjectsDB;
                    edtSubject.DisplayMemberPath = "strName";

                    edtRoom.ItemsSource = ClassRoomsDB;
                    edtRoom.DisplayMemberPath = "iNumber";

                    ClassRoomsDatagrid.ItemsSource = ClassRoomsDB;

                    edtPodrazGRPS.ItemsSource = PodrazdelDB;
                    edtPodrazGRPS.DisplayMemberPath = "strName";
                    edtPodrazGRPS.SelectedValuePath = "iID";
                    PodrazdelDataGrid.ItemsSource = PodrazdelDB;

                    PrepodDataGrid.ItemsSource = PrepodDB;
                    edtTeacher.ItemsSource = PrepodDB;
                    edtTeacher.DisplayMemberPath = "strFIO";

                    SiteUsersDataGrid.ItemsSource = SiteUsersDB;

                    SiteGroupsDataGrid.ItemsSource = SiteGroupsDB;
                    edtGroupSU.ItemsSource = SiteGroupsDB;
                    edtGroupSU.DisplayMemberPath = "strName";
                    edtGroupSU.SelectedValuePath = "iID";

                    ClassRoomsDB_CBOX = new ObservableCollection<ClassRoomsBaseClass>(ClassRoomsDB);
                    GroupsDB_CBOX = new ObservableCollection<GroupsBaseClass>(GroupsDB);
                    SubjectsDB_CBOX = new ObservableCollection<SubjectsBaseClass>(SubjectsDB);
                    PodrazdelDB_CBOX = new ObservableCollection<PodrazdelBaseClass>(PodrazdelDB);
                    Prepod_CBOX = new ObservableCollection<TeachersBaseClass>(PrepodDB);
                    SiteGroups_CBOX = new ObservableCollection<SiteGroupsBaseClass>(SiteGroupsDB);

                    ClassRoomsDatagrid.Items.Refresh();
                    SheduleDatagrid.Items.Refresh();
                    SubjectsDatagrid.Items.Refresh();
                    GroupsDatagrid.Items.Refresh();
                    PrepodDataGrid.Items.Refresh();
                    SheduleTimeDatagrid.Items.Refresh();
                    PodrazdelDataGrid.Items.Refresh();
                    SiteUsersDataGrid.Items.Refresh();
                    SiteGroupsDataGrid.Items.Refresh();

                    CanvasDrawLevel(1);
                    MainWindowGrid.Visibility = Visibility.Visible;
                    ProcessingGrid.Visibility = Visibility.Collapsed;
                }
                else
                {
                    ClassRoomsDatagrid.ItemsSource =
                    SheduleDatagrid.ItemsSource =
                    SubjectsDatagrid.ItemsSource =
                    GroupsDatagrid.ItemsSource =
                    PrepodDataGrid.ItemsSource =
                    SheduleTimeDatagrid.ItemsSource =
                    PodrazdelDataGrid.ItemsSource = null;

                    ClassRoomsDatagrid.Items.Clear();
                    SheduleDatagrid.Items.Clear();
                    SubjectsDatagrid.Items.Clear();
                    GroupsDatagrid.Items.Clear();
                    PrepodDataGrid.Items.Clear();
                    SheduleTimeDatagrid.Items.Clear();
                    PodrazdelDataGrid.Items.Clear();

                    SheduleDatagrid.ItemsSource = ScheduleDB;

                    edtGroup.ItemsSource = GroupsDB;
                    GroupsDatagrid.ItemsSource = GroupsDB;
                    edtGroup.DisplayMemberPath = "strName";

                    SheduleTimeDatagrid.ItemsSource = ScheduleTimeDB;
                    edtTime.ItemsSource = ScheduleTimeDB;
                    edtTime.DisplayMemberPath = "strDescription";
                    edtTime.SelectedValuePath = "iID";

                    SubjectsDatagrid.ItemsSource = SubjectsDB;
                    edtSubject.ItemsSource = SubjectsDB;
                    edtSubject.DisplayMemberPath = "strName";

                    edtRoom.ItemsSource = ClassRoomsDB;
                    edtRoom.DisplayMemberPath = "iNumber";

                    ClassRoomsDatagrid.ItemsSource = ClassRoomsDB;

                    edtPodrazGRPS.ItemsSource = PodrazdelDB;
                    edtPodrazGRPS.DisplayMemberPath = "strName";
                    edtPodrazGRPS.SelectedValuePath = "iID";
                    PodrazdelDataGrid.ItemsSource = PodrazdelDB;

                    PrepodDataGrid.ItemsSource = PrepodDB;
                    edtTeacher.ItemsSource = PrepodDB;
                    edtTeacher.DisplayMemberPath = "strFIO";

                    ClassRoomsDB_CBOX = new ObservableCollection<ClassRoomsBaseClass>(ClassRoomsDB);
                    GroupsDB_CBOX = new ObservableCollection<GroupsBaseClass>(GroupsDB);
                    SubjectsDB_CBOX = new ObservableCollection<SubjectsBaseClass>(SubjectsDB);
                    PodrazdelDB_CBOX = new ObservableCollection<PodrazdelBaseClass>(PodrazdelDB);
                    Prepod_CBOX = new ObservableCollection<TeachersBaseClass>(PrepodDB);

                    ClassRoomsDatagrid.Items.Refresh();
                    SheduleDatagrid.Items.Refresh();
                    SubjectsDatagrid.Items.Refresh();
                    GroupsDatagrid.Items.Refresh();
                    PrepodDataGrid.Items.Refresh();
                    SheduleTimeDatagrid.Items.Refresh();
                    PodrazdelDataGrid.Items.Refresh();

                    MainWindowGrid.Visibility = Visibility.Visible;
                    ProcessingGrid.Visibility = Visibility.Collapsed;

                    Style s = new Style();
                    s.Setters.Add(new Setter(UIElement.VisibilityProperty, Visibility.Collapsed));
                    TabsControlElement.ItemContainerStyle = s;
                    SheduleDatagrid.Columns[0].Visibility = Visibility.Collapsed;

                    SheduleDatagrid.Columns[3].DisplayIndex = 0;
                    SheduleDatagrid.Columns[4].DisplayIndex = 1;
                    SheduleDatagrid.Columns[1].DisplayIndex = 2;
                    SheduleDatagrid.Columns[2].DisplayIndex = 3;
                    SheduleDatagrid.Columns[5].DisplayIndex = 4;
                    SheduleDatagrid.Columns[6].DisplayIndex = 5;

                    edtID.IsEnabled = false;

                    foreach (var iTab in TabsControlElement.Items)
                    {
                        if (((TabItem)iTab).Name.Equals("ScheduleTab"))
                        {
                            TabsControlElement.SelectedItem = iTab;
                        }
                    }
                }
            }
        }

        private void worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            ProcessingDisplayingSteps.Content = (String)e.UserState + " (" + e.ProgressPercentage + "%)";
        }

        private void LoadServerTableButton_Click(object sender, RoutedEventArgs e)
        {
            MainWindowGrid.Visibility = Visibility.Collapsed;
            ProcessingGrid.Visibility = Visibility.Visible;
            iWorkerOperation = 1;
            worker.RunWorkerAsync();
        }
    }
}
