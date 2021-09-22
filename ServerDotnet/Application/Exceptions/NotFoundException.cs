namespace Application.Exceptions
{
    public class NotFoundException: ValueException
    {
        public const string LinkNotFound = "Link doesn't exist";

        public NotFoundException(string message) : base(message)
        {
            
        }
    }
}