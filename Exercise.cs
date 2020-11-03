using System;

namespace luke_code
{
    class Program
    {
        static void Main(string[] args)
        {
            
            Console.WriteLine("Please enter a few words with spaces");
            string userInput = Console.ReadLine().ToUpper();
            string[] list = userInput.Split();

            foreach(string item in list) 
            {
                Console.Write(item[0]);
            }
            
            
        }
    }
}
