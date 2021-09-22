namespace WebApi.DTOs.Requests
{
    public class RegisterRequestDTO
    {
        public string Login { get; init; }

        public string Email { get; init; }

        public string Password { get; init; }
    }
}