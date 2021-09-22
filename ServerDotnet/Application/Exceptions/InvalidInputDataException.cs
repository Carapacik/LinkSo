namespace Application.Exceptions
{
    public class InvalidInputDataException : ValueException
    {
        public const string LinkConflictingData = "Link data is invalid";

        public InvalidInputDataException(string message) : base(message)
        {
        }
    }
}