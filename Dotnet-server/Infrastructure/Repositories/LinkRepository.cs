using System.Threading.Tasks;
using Domain.Entities;
using Domain.Repositories;

namespace Infrastructure.Repositories
{
    public class LinkRepository: ILinkRepository
    {
        public Task<Link> AddLink(string shortUrl, string fullUrl, LinkType linkType, Password password = null)
        {
            throw new System.NotImplementedException();
        }

        public Task<Link> GetLink(string shortUrl)
        {
            throw new System.NotImplementedException();
        }
    }
}