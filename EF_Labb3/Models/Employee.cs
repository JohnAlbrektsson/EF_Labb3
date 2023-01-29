using System;
using System.Collections.Generic;

namespace EF_Labb3.Models
{
    public partial class Employee
    {
        public int EmployeeId { get; set; }
        public string Fname { get; set; } = null!;
        public string Lname { get; set; } = null!;
        public string Title { get; set; } = null!;
    }
}
