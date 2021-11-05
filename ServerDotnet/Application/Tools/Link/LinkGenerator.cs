using System;

namespace Application.Tools.Common
{
    public class LinkGenerator
    {
        private readonly Random _random = new();
        private const string Alphabet = "abcdefghijklmnopqrstuvwyxz0123456789";

        private string GenerateString(int size)
        {
            var chars = new char[size];
            for (var i=0; i < size; i++)
            {
                chars[i] = Alphabet[_random.Next(Alphabet.Length)];
            }
            return new string(chars);
        }


        public string GenerateFullUrl() => GenerateString(8);
    }
}