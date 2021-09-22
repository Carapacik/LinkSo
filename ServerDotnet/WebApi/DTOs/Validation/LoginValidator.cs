using FluentValidation;
using WebApi.DTOs.Requests;
using static WebApi.DTOs.Validation.RegisterValidator;

namespace WebApi.DTOs.Validation
{
    public class LoginValidator : AbstractValidator<LoginRequestDTO>
    {
        public LoginValidator()
        {
            RuleFor(x => x.Login).NotEmpty().Length(MinLoginLength, MaxLoginLength)
                .Matches(LoginRegex);

            RuleFor(x => x.Password).NotEmpty().Length(MinPasswordLength, MaxPasswordLength)
                .Matches(PasswordRegex);
            
        }
    }
}