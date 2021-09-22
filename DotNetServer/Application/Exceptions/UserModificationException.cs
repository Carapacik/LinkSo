namespace Application.Exceptions
{
    public class UserModificationException : ValueException
    {
        public const string LoginIsTaken = "Данный логин занят.";

        public UserModificationException(string message) : base(message)
        {
        }
    }
}