using FluentValidation;
using WebApi.DTOs.Requests;

namespace WebApi.DTOs.Validation
{
    public class LinkCreateValidator : AbstractValidator<LinkCreateRequestDTO>
    {
        public const int MaxTargetLength = 512;
        public LinkCreateValidator()
        {
            RuleFor(x => x.Target).MaximumLength(MaxTargetLength);
        }
    }
}