using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeTellerNet
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine($"Hello.");

            var interval = TimeSpan.FromMinutes(5);

            while (true)
            {
                Console.WriteLine($"It's {DateTime.Now} now.");
                Console.WriteLine($"Will get back to you in {interval.TotalMinutes} mins.");
                Console.WriteLine();

                await Task.Delay(interval);
            }
        }
    }
}
