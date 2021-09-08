using Domain.Entities;

namespace WebApi.DTOs.Link
{
    public class LinkInfoDTO
    {
        public string ShortUrl { get; set; }
        
        public string FullUrl { get; set; }
        
        public LinkType LinkType { get; set; }
    }
}