using System.Text.Json;
using System.Text.Json.Serialization;

namespace WebApi.ExceptionHandling
{
    public class ErrorDetails
    {
        [JsonPropertyName("status")] public int Status { get; set; }

        [JsonPropertyName("detail")] public string Message { get; set; }

        public override string ToString()
        {
            return JsonSerializer.Serialize(this);
        }
    }
}