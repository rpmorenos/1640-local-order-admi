using System;

namespace VulnerableApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ingrese su contraseña:");
            string password = Console.ReadLine();
            if (password == "admin123")
            {
                Console.WriteLine("Acceso concedido");
            }
            else
            {
                Console.WriteLine("Acceso denegado");
            }
        }
    }
}
