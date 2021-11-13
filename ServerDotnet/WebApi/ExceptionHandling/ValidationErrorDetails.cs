using System.Text.Json.Serialization;

namespace WebApi.ExceptionHandling
{
    public class ValidationErrorDetails: ErrorDetails
    {
        [JsonPropertyName("invalidFields")] public string[] InvalidFields { get; }
        
        public ValidationErrorDetails(string[] invalidFields): base(400, null)
        {
            InvalidFields = invalidFields;
        }
    }
}