using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SheduleAuditorVisualisator.FileSystemClasses
{
    [Serializable]
    public class RememberMeClass
    {
        public string strUserServer { get; set; }
        public string strUserLogin { get; set; }
        public string strUserPassword { get; set; }
        public bool bRememberMeChecked { get; set; }
    }
}
