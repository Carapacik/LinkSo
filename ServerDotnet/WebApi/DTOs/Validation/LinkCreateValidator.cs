using FluentValidation;
using WebApi.DTOs.Requests;

namespace WebApi.DTOs.Validation
{
    public class LinkCreateValidator : AbstractValidator<LinkCreateRequestDTO>
    {
        public LinkCreateValidator()
        {
            RuleFor(x => x.Target).MaximumLength(20);
        }
    }
}