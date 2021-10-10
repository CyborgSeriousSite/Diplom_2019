using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SheduleAuditorVisualisator.DBClasses
{
    [Serializable]
    public class SiteUsersBaseClass
    {
        public int iID { get; set; }
        public string ULogin { get; set; }
        public string UPassword { get; set; }
        public string strName { get; set; }
        public string strName2 { get; set; }
        public string strName3 { get; set; }
        public int iGroup { get; set; }
        public string strNumber { get; set; }
        public string strEmail { get; set; }
    }
}
