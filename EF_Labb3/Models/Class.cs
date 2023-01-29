using System;
using System.Collections.Generic;

namespace EF_Labb3.Models
{
    public partial class Class
    {
        public Class()
        {
            Students = new HashSet<Student>();
        }

        public int ClassId { get; set; }
        public string Class1 { get; set; } = null!;

        public virtual ICollection<Student> Students { get; set; }
    }
}
