using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SheduleAuditorVisualisator.DBClasses
{
    [Serializable]
    public class ScheduleBaseClass
    {
        public int iID  { get; set; }
        public int iGroupID  { get; set; }
        public int iSubjectID  { get; set; }
        public DateTime dStartTime  { get; set; }
        public DateTime dEndTime { get; set; }
        public int iClassRoomID  { get; set; }
        public int iTeacherID { get; set; }
    }
}
