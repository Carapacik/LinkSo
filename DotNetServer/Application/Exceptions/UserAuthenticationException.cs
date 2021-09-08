namespace Application.Exceptions
{
    public class UserAuthenticationException : ValueException
    {
        public const string LoginDoesNotExist = "Такой логин не существует.";
        public const string PasswordIsIncorrect = "Пароль неверный.";

        public const string UserIsInvalid = "Пользователь невалиден.";

        public UserAuthenticationException(string message) : base(message)
        {
        }
    }
}