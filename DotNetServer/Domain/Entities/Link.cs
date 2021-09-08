namespace Domain.Entities
{
    public class Link
    {
        public int Id { get; set; }
        
        public int UserId { get; set; }
        
        public User User { get; set; }

        public string ShortUrl { get; set; }
        
        public string FullUrl { get; set; }
        
        public Password Password { get; set; }

        public LinkType LinkType { get; set; } = LinkType.Public;
    }
}