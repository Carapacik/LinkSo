using System.Text.Json.Serialization;
using Application.Exceptions;

namespace WebApi.ExceptionHandling
{
    public class ValidationErrorDetails: ErrorDetails
    {
        private const string InvalidFieldsText = "InputFieldsAreInvalid";

        [JsonPropertyName("invalidFields")] public string[] InvalidFields { get; }
        
        public ValidationErrorDetails(string[] invalidFields)
        {
            Status = 400;
            Message = InvalidFieldsText;
            InvalidFields = invalidFields;
        }
    }
}