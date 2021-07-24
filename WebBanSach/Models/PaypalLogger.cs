using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebBanSach.Models
{
    public class PaypalLogger
    {
        public static string LogDirectoryPath = Environment.CurrentDirectory;

        public static void Log(String messages)
        {
            try
            {
                StreamWriter stw = new StreamWriter(LogDirectoryPath + "\\PaypalError.log", true);
                stw.WriteLine("{0}---->{1}", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"), messages);
            }
            catch (Exception)
            {
                // throw;
            }
        }
    }
}