using EF_Labb3.Models;


namespace Labb3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("What do you want to do? \n 1. See students \n 2. See classses \n 3. Add employee");
            switch (Console.ReadLine())
            {
                case "1":
                    Students();
                    break;
                case "2":
                    GetStudentClass();
                    break;
                case "3":
                    AddEmployee();
                    break;
            }
        }
        public static void Students()
        {
            var context = new HighschoolDbContext();
          

            Console.WriteLine("How do you want to sort?");
            Console.WriteLine("1. By First name\n2. By Last name");
            string choice = Console.ReadLine();
            if (choice == "1")
            {
                Console.WriteLine("1. Ascending \n2. Descending");
                string choice2 = Console.ReadLine();
                if (choice2 == "1")
                {
                    var students = context.Students
                        .OrderBy(x => x.Fname);
                    foreach (var student in students)
                    {
                        Console.WriteLine($"ID: {student.StudentId}");
                        Console.WriteLine($"Name: {student.Fname + " " + student.Lname}");
                        Console.WriteLine($"SSN: {student.Ssn}");
                        Console.WriteLine($"Class: {student.Class}");
                        Console.WriteLine();
                    }
                }
                else if(choice2 == "2")
                {
                    var students = context.Students
                       .OrderByDescending(x => x.Fname);
                    foreach (var student in students)
                    {
                        Console.WriteLine($"ID: {student.StudentId}");
                        Console.WriteLine($"Name: {student.Fname + " " + student.Lname}");
                        Console.WriteLine($"SSN: {student.Ssn}");
                        Console.WriteLine($"Class: {student.Class}");
                        Console.WriteLine();
                    }
                }
            }
            else if (choice == "2")
            {
                Console.WriteLine("1. Ascending \n2. Descending");
                string choice2 = Console.ReadLine();
                if (choice2 == "1")
                {
                    var students = context.Students
                     .OrderBy(x => x.Lname);
                    foreach (var student in students)
                    {
                        Console.WriteLine($"ID: {student.StudentId}");
                        Console.WriteLine($"Name: {student.Fname + " " + student.Lname}");
                        Console.WriteLine($"SSN: {student.Ssn}");
                        Console.WriteLine($"Class: {student.Class}");
                        Console.WriteLine();
                    }
                }
                if (choice2 == "2")
                {
                    var students = context.Students
                     .OrderByDescending(x => x.Lname);
                    foreach (var student in students)
                    {
                        Console.WriteLine($"ID: {student.StudentId}");
                        Console.WriteLine($"Name: {student.Fname + " " + student.Lname}");
                        Console.WriteLine($"SSN: {student.Ssn}");
                        Console.WriteLine($"Class: {student.Class}");
                        Console.WriteLine();
                    }
                }
            }
        }
        public static void GetStudentClass()
        {
            var context = new HighschoolDbContext();
            var Classes = context.Classes;
            foreach (var c in Classes)
            {
                Console.WriteLine($"{c.ClassId}. {c.Class1}");
            }
            Console.WriteLine("Which class do you want to see? 3a or 3b");
            if (int.TryParse(Console.ReadLine(), out int choice))
            {
                var Class = context.Students
                    .Where(x => x.ClassId == choice);
                foreach (Student item in Class)
                {
                    Console.WriteLine($"ID: {item.StudentId}");
                    Console.WriteLine($"Name: {item.Fname + " " + item.Lname}");
                    Console.WriteLine($"SSN: {item.Ssn}");
                    Console.WriteLine();
                }
            }
            
           


        }
        public static void AddEmployee()
        {
            var context = new HighschoolDbContext();

            Employee employee = new Employee();
            Console.WriteLine("First Name:");
            employee.Fname = Console.ReadLine();
            Console.WriteLine("Last Name");
            employee.Lname= Console.ReadLine();
            Console.WriteLine("Proffesion/Title");
            employee.Title = Console.ReadLine();

            context.Employees.Add(employee);
            context.SaveChanges();
        }
    }
}