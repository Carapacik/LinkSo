using System.Text.Json.Serialization;

namespace WebApi.ExceptionHandling
{
    public class ValidationErrorDetails: ErrorDetails
    {
        private const string InvalidFieldsMessage = "Validation.InputFieldsAreInvalid";
        [JsonPropertyName("invalidFields")] public string[] InvalidFields { get; }
        
        public ValidationErrorDetails(string[] invalidFields): base(InvalidFieldsMessage)
        {
            InvalidFields = invalidFields;
        }
    }
}