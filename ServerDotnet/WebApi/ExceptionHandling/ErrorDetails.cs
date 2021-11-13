using System.Text.Json;
using System.Text.Json.Serialization;

namespace WebApi.ExceptionHandling
{
    public class ErrorDetails
    {
        [JsonPropertyName("status")] public int Status { get; }

        [JsonPropertyName("message")] public string Message { get; }    

        public ErrorDetails(int status, string message)
        {
            Status = status;
            Message = message;
        }
        
        public override string ToString()
        {
            return JsonSerializer.Serialize(this);
        }
    }
}