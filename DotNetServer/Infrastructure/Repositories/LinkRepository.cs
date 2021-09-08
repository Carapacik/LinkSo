using System.Threading.Tasks;
using Domain.Entities;
using Domain.Repositories;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class LinkRepository: ILinkRepository
    {
        private readonly LinkSoDbContext _linkSoDbContext;

        public LinkRepository(LinkSoDbContext linkSoDbContext)
        {
            _linkSoDbContext = linkSoDbContext;
        }

        public async Task<Link> AddLink(string shortUrl, string fullUrl, LinkType linkType, Password password = null)
        {
            var newLink = new Link
            {
                ShortUrl = shortUrl,
                FullUrl = fullUrl,
                LinkType = linkType,
                Password = password
            };

            await _linkSoDbContext.Links.AddAsync(newLink);
            return newLink;
        }

        public async Task<Link> GetLink(string shortUrl)
        {
            return await _linkSoDbContext.Links.FirstOrDefaultAsync(x => x.ShortUrl == shortUrl);
        }
    }
}