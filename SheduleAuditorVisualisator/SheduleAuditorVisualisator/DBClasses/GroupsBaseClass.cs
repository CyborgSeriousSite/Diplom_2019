using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SheduleAuditorVisualisator.DBClasses
{
    [Serializable]
    public class GroupsBaseClass
    {
        public int iID  { get; set; }
        public string strName  { get; set; }
        public int iPodrazID { get; set; }
    }
}
