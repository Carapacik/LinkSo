using Domain.Entities;

namespace WebApi.DTOs.Requests
{
    public class LinkCreateRequestDTO
    {
        public string Target { get; set; }
        
        public LinkType LinkType { get; set; }
        
        public string Password { get; set; }
    }
}