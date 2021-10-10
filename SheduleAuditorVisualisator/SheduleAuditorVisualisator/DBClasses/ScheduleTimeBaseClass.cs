using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SheduleAuditorVisualisator.DBClasses
{
    [Serializable]
    public class ScheduleTimeBaseClass
    {
        public int iID  { get; set; }
        public string strDescription  { get; set; }
        public TimeSpan dStartTime { get; set; }
        public TimeSpan dEndTime { get; set; }
    }
}
