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
using System.IO;
using SheduleAuditorVisualisator.FileSystemClasses;
using System.Collections.ObjectModel;
using SheduleAuditorVisualisator.DBClasses;

namespace SheduleAuditorVisualisator
{
    public partial class BackupWindow : Window
    {
        public string backupPath = @"" + System.AppDomain.CurrentDomain.BaseDirectory + "Backups\\";
        public string backupFilePath = @"" + System.AppDomain.CurrentDomain.BaseDirectory + "Backups\\" + "BackupList.lst";
        public ObservableCollection<BackupFileClass> lstBackups { get; set; }

        public List<ScheduleBaseClass> ScheduleDB = new List<ScheduleBaseClass>();
        public List<GroupsBaseClass> GroupsDB = new List<GroupsBaseClass>();
        public List<ScheduleTimeBaseClass> ScheduleTimeDB = new List<ScheduleTimeBaseClass>();
        public List<SubjectsBaseClass> SubjectsDB = new List<SubjectsBaseClass>();
        public List<ClassRoomsBaseClass> ClassRoomsDB = new List<ClassRoomsBaseClass>();
        public List<SiteUsersBaseClass> SiteUsersDB = new List<SiteUsersBaseClass>();
        public List<PodrazdelBaseClass> PodrazdelDB = new List<PodrazdelBaseClass>();
        public List<TeachersBaseClass> PrepodDB = new List<TeachersBaseClass>();
        public List<SiteGroupsBaseClass> SiteGroupsDB = new List<SiteGroupsBaseClass>();

        public bool bBackupLoaded = false;
        public bool bBackupLoadedFinally = false;

        public bool bAdminMode = true;

        public BackupWindow()
        {
            InitializeComponent();

            lstBackups = new ObservableCollection<BackupFileClass>();

            if (File.Exists(backupFilePath))
            {
                using (Stream stream = File.Open(backupFilePath, FileMode.Open))
                {
                    var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                    lstBackups = (ObservableCollection<BackupFileClass>)bformatter.Deserialize(stream);
                }
            }

            ExistBackups.ItemsSource = lstBackups;
        }

        private void SoRButton_Click(object sender, RoutedEventArgs e)
        {

            if (bAdminMode)
            {
                if (ExistBackups.SelectedIndex == -1)
                {
                    if (Directory.Exists(backupPath + BackupTBox.Text + "\\"))
                    {
                        Directory.Delete(backupPath + BackupTBox.Text + "\\", true);
                    }
                    Directory.CreateDirectory(backupPath + BackupTBox.Text + "\\");
                    string newDirectory = backupPath + BackupTBox.Text + "\\";
                    string fileDirectory = "";

                    lstBackups.Add(new BackupFileClass() { strName = BackupTBox.Text, backupTime = DateTime.Now });

                    //Сохранить аудитории
                    fileDirectory = newDirectory + "ClassRoomsDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, ClassRoomsDB);
                    }

                    //Сохранить группы
                    fileDirectory = newDirectory + "GroupsDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, GroupsDB);
                    }

                    //Сохранить подразделения
                    fileDirectory = newDirectory + "PodrazdelDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, PodrazdelDB);
                    }

                    //Сохранить преподавателей
                    fileDirectory = newDirectory + "TeachersDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, PrepodDB);
                    }

                    //Сохранить преподавателей
                    fileDirectory = newDirectory + "SiteGroupsDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, SiteGroupsDB);
                    }

                    //Сохранить расписание
                    fileDirectory = newDirectory + "ScheduleDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, ScheduleDB);
                    }

                    //Сохранить время расписания
                    fileDirectory = newDirectory + "ScheduleTimeDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, ScheduleTimeDB);
                    }

                    //Сохранить пользователей сайта
                    fileDirectory = newDirectory + "SiteUsersDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, SiteUsersDB);
                    }

                    //Сохранить дисциплины
                    fileDirectory = newDirectory + "SubjectsDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, SubjectsDB);
                    }

                    SaveBackupList();
                }
            }
            else
            {
                if (ExistBackups.SelectedIndex == -1)
                {
                    if (Directory.Exists(backupPath + BackupTBox.Text + "\\"))
                    {
                        Directory.Delete(backupPath + BackupTBox.Text + "\\", true);
                    }
                    Directory.CreateDirectory(backupPath + BackupTBox.Text + "\\");
                    string newDirectory = backupPath + BackupTBox.Text + "\\";
                    string fileDirectory = "";

                    lstBackups.Add(new BackupFileClass() { strName = BackupTBox.Text, backupTime = DateTime.Now });

                    //Сохранить расписание
                    fileDirectory = newDirectory + "ScheduleDB.dat";
                    using (Stream stream = File.Open(fileDirectory, FileMode.Create))
                    {
                        var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                        bformatter.Serialize(stream, ScheduleDB);
                    }

                    SaveBackupList();
                }
            }
        }

        private void BackupControlWindow_MouseUp(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Released)
            {
                var element = e.OriginalSource as FrameworkElement;
                if (element.GetType().ToString().Contains("ScrollViewer"))
                {
                    ExistBackups.SelectedIndex = -1;
                }
            }
        }

        private void ExistBackups_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
           SoRButton.Content = (ExistBackups.SelectedIndex == -1) ? "Создать резервную копию" : "Перезаписать резервную копию";
           BackupTBox.Text = (ExistBackups.SelectedIndex == -1) ? "" : ((String)ExistBackups.SelectedValue);
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BackupTBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (BackupTBox.IsKeyboardFocusWithin)
            {
                bool bfound = false;
                for (int i = 0; i < ExistBackups.Items.Count; i++)
                {
                    if (BackupTBox.Text.ToLower().Equals(((BackupFileClass)ExistBackups.Items[i]).strName.ToLower()))
                    {
                        int caretOldPos = BackupTBox.CaretIndex;
                        ExistBackups.SelectedIndex = i;
                        BackupTBox.CaretIndex = caretOldPos;
                        bfound = true;
                        break;
                    }
                }
                if (!bfound && ExistBackups.SelectedIndex>-1)
                {
                    string remText = BackupTBox.Text;
                    int caretOldPos = BackupTBox.CaretIndex;
                    ExistBackups.SelectedIndex = -1;
                    BackupTBox.Text = remText;
                    BackupTBox.CaretIndex = caretOldPos;
                }
            }
        }

        private void SaveBackupList()
        {
            using (Stream stream = File.Open(backupFilePath, FileMode.Create))
            {
                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                bformatter.Serialize(stream, lstBackups);
            }
        }

        private void DeleteBackup_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show(string.Format("Вы уверены что хотите удалить резервную копию под названием {0} ?", BackupTBox.Text), "Подтверждение удаления", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                if (Directory.Exists(backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\"))
                {
                    Directory.Delete(backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\", true);
                }
                lstBackups.Remove((BackupFileClass)ExistBackups.SelectedItem);
                SaveBackupList();
            }
        }

        private void LoadBackupButton_Click(object sender, RoutedEventArgs e)
        {
            if (bAdminMode)
            {
                if (Directory.Exists(backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\"))
                {
                    string newDirectory = backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\";

                    string ClassRoomsDBDirectory = newDirectory + "ClassRoomsDB.dat";
                    string GroupsDBDirectory = newDirectory + "GroupsDB.dat";
                    string PodrazdelDBDirectory = newDirectory + "PodrazdelDB.dat";
                    string ScheduleDBDirectory = newDirectory + "ScheduleDB.dat";
                    string ScheduleTimeDBDirectory = newDirectory + "ScheduleTimeDB.dat";
                    string SiteUsersDBDirectory = newDirectory + "SiteUsersDB.dat";
                    string SubjectsDBDirectory = newDirectory + "SubjectsDB.dat";
                    string PrepodDBDirectory = newDirectory + "TeachersDB.dat";
                    string SiteGroupsDBDirectory = newDirectory + "SiteGroupsDB.dat";

                    if (File.Exists(ClassRoomsDBDirectory) || File.Exists(GroupsDBDirectory) || File.Exists(PodrazdelDBDirectory) || File.Exists(PrepodDBDirectory) || File.Exists(ScheduleDBDirectory) || File.Exists(ScheduleTimeDBDirectory) || File.Exists(SiteUsersDBDirectory) || File.Exists(SubjectsDBDirectory) || File.Exists(SiteGroupsDBDirectory))
                    {
                        if (!File.Exists(ClassRoomsDBDirectory) || !File.Exists(GroupsDBDirectory) || !File.Exists(PodrazdelDBDirectory) || !File.Exists(PrepodDBDirectory) || !File.Exists(ScheduleDBDirectory) || !File.Exists(ScheduleTimeDBDirectory) || !File.Exists(SiteUsersDBDirectory) || !File.Exists(SubjectsDBDirectory) || !File.Exists(SiteGroupsDBDirectory))
                        {
                            if (MessageBox.Show(string.Format("Резервная копия {0} содержит не все таблицы данных. Продолжить?", BackupTBox.Text), "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
                            {
                                bBackupLoaded = true;
                            }
                            else
                            {
                                bBackupLoaded = false;
                            }
                        }
                        else
                        {
                            bBackupLoaded = true;
                        }
                    }
                    else
                    {
                        if (MessageBox.Show(string.Format("Резервная копия {0} была повреждена. Удалить её из списка?", BackupTBox.Text), "Произошла ошибка", MessageBoxButton.YesNo, MessageBoxImage.Error) == MessageBoxResult.Yes)
                        {
                            Directory.Delete(backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\", true);
                            lstBackups.Remove((BackupFileClass)ExistBackups.SelectedItem);
                            SaveBackupList();
                            bBackupLoaded = false;
                        }
                    }

                    if (bBackupLoaded)
                    {
                        if (File.Exists(ClassRoomsDBDirectory))
                        {
                            using (Stream stream = File.Open(ClassRoomsDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                ClassRoomsDB = (List<ClassRoomsBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(GroupsDBDirectory))
                        {
                            using (Stream stream = File.Open(GroupsDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                GroupsDB = (List<GroupsBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(PodrazdelDBDirectory))
                        {
                            using (Stream stream = File.Open(PodrazdelDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                PodrazdelDB = (List<PodrazdelBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(PrepodDBDirectory))
                        {
                            using (Stream stream = File.Open(PrepodDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                PrepodDB = (List<TeachersBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(ScheduleDBDirectory))
                        {
                            using (Stream stream = File.Open(ScheduleDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                ScheduleDB = (List<ScheduleBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(ScheduleTimeDBDirectory))
                        {
                            using (Stream stream = File.Open(ScheduleTimeDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                ScheduleTimeDB = (List<ScheduleTimeBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(SiteUsersDBDirectory))
                        {
                            using (Stream stream = File.Open(SiteUsersDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                SiteUsersDB = (List<SiteUsersBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(SiteGroupsDBDirectory))
                        {
                            using (Stream stream = File.Open(SiteGroupsDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                SiteGroupsDB = (List<SiteGroupsBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        if (File.Exists(SubjectsDBDirectory))
                        {
                            using (Stream stream = File.Open(SubjectsDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                SubjectsDB = (List<SubjectsBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        bBackupLoadedFinally = true;

                        MessageBox.Show(string.Format("Резервная копия {0} была успешно загружена!", BackupTBox.Text), "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);

                        this.Close();
                    }
                }
                else
                {
                    if (MessageBox.Show(string.Format("Резервная копия {0} была повреждена. Удалить её из списка?", BackupTBox.Text), "Произошла ошибка", MessageBoxButton.YesNo, MessageBoxImage.Error) == MessageBoxResult.Yes)
                    {
                        lstBackups.Remove((BackupFileClass)ExistBackups.SelectedItem);
                        SaveBackupList();
                    }
                    bBackupLoaded = false;
                }
            }
            else
            {
                if (Directory.Exists(backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\"))
                {
                    string newDirectory = backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\";

                    string ScheduleDBDirectory = newDirectory + "ScheduleDB.dat";

                    if (File.Exists(ScheduleDBDirectory))
                    {
                        bBackupLoaded = true;
                    }
                    else
                    {
                        if (MessageBox.Show(string.Format("Резервная копия {0} была повреждена. Удалить её из списка?", BackupTBox.Text), "Произошла ошибка", MessageBoxButton.YesNo, MessageBoxImage.Error) == MessageBoxResult.Yes)
                        {
                            Directory.Delete(backupPath + ((BackupFileClass)ExistBackups.SelectedItem).strName + "\\", true);
                            lstBackups.Remove((BackupFileClass)ExistBackups.SelectedItem);
                            SaveBackupList();
                            bBackupLoaded = false;
                        }
                    }

                    if (bBackupLoaded)
                    {
                        if (File.Exists(ScheduleDBDirectory))
                        {
                            using (Stream stream = File.Open(ScheduleDBDirectory, FileMode.Open))
                            {
                                var bformatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

                                ScheduleDB = (List<ScheduleBaseClass>)bformatter.Deserialize(stream);
                            }
                        }

                        bBackupLoadedFinally = true;

                        MessageBox.Show(string.Format("Резервная копия {0} была успешно загружена!", BackupTBox.Text), "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);

                        this.Close();
                    }
                }
                else
                {
                    if (MessageBox.Show(string.Format("Резервная копия {0} была повреждена. Удалить её из списка?", BackupTBox.Text), "Произошла ошибка", MessageBoxButton.YesNo, MessageBoxImage.Error) == MessageBoxResult.Yes)
                    {
                        lstBackups.Remove((BackupFileClass)ExistBackups.SelectedItem);
                        SaveBackupList();
                    }
                    bBackupLoaded = false;
                }
            }
        }
    }
}
