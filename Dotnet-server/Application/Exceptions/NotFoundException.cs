namespace Application.Exceptions
{
    public class NotFoundException: ValueException
    {
        public const string LinkNotFound = "Such login doesn't exist";

        public NotFoundException(string message) : base(message)
        {
            
        }
    }
}