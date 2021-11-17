using System.Text.Json;
using System.Text.Json.Serialization;

namespace WebApi.ExceptionHandling
{
    public class ErrorDetails
    {
        [JsonPropertyName("message")] public string Message { get; }    

        public ErrorDetails(string message)
        {
            Message = message;
        }
        
        public override string ToString()
        {
            return JsonSerializer.Serialize(this);
        }
    }
}