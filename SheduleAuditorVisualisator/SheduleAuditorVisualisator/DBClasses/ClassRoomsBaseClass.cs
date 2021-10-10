using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SheduleAuditorVisualisator.DBClasses
{
    [Serializable]
    public class ClassRoomsBaseClass
    {
        public int iID  { get; set; }
        public int iNumber { get; set; }
        public int iCoordX { get; set; }
        public int iCoordY { get; set; }
        public int iWidth { get; set; }
        public int iHeight { get; set; }
        public int iType { get; set; }
    }
}
