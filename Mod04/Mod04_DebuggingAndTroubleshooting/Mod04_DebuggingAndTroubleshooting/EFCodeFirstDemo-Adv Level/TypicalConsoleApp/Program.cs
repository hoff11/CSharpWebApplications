using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using TypicalClassLibrary;

namespace TypicalConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                IObjectContextAdapter Context = new EFDbContext();
                ICustomerRepository objCustomer = new Customer();
                int intNewRowID;
                int intRC = 0;

                Console.WriteLine("--Test insert sproc: ");
                intRC = objCustomer.InsCustomer("New Data", 2, out intNewRowID);
                Console.WriteLine("RC = {0} and New Row ID = {1}", intRC.ToString(), intNewRowID.ToString());

                Console.WriteLine("\n" + "--Test select view");
                foreach (var row in objCustomer.QueryCustomersView())
                { Console.WriteLine(row.ToString()); }


                Console.WriteLine("\n" + "--Test delete sproc: ");
                intRC = objCustomer.DelCustomer(intNewRowID);
                Console.WriteLine("RC = {0}", intRC.ToString());

                Console.WriteLine("\n" + "--Test select sproc with all rows: ");
                foreach (var row in objCustomer.SelCustomer(0))
                { Console.WriteLine(row.ToString()); }

                Console.WriteLine("\n" + "--Test update sproc: ");
                intRC = objCustomer.UpdCustomer(2, "Customer 2", 2);
                Console.WriteLine("RC = {0}", intRC.ToString());

                Console.WriteLine("\n" + "--Test select sproc with 1 row: ");
                foreach (var row in objCustomer.SelCustomer(2))
                { Console.WriteLine(row.ToString()); }

                Console.Write("\n" + "--Test the Return Code Error handling: " + "\n");
                intRC = objCustomer.InsCustomer("New Data", 123, out intNewRowID);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message.ToString());                
            }
            Console.Read();

}//end Main
    }
}
