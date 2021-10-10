using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SheduleAuditorVisualisator.FileSystemClasses
{
    [Serializable]
    public class BackupFileClass
    {
        public string strName { get; set; }
        public DateTime backupTime { get; set; }
    }
}
