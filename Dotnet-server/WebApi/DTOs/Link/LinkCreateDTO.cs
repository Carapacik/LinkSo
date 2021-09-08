using Domain.Entities;

namespace WebApi.DTOs.Link
{
    public class LinkCreateDTO
    {
        public string ShortUrl { get; set; }
        
        public string FullUrl { get; set; }
        
        public LinkType LinkType { get; set; }
        
        public string Password { get; set; }
    }
}