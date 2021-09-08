using System.Threading.Tasks;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface ILinkRepository
    {
        Task<Link> AddLink(string shortUrl, string fullUrl, LinkType linkType, Password password = null);

        Task<Link> GetLink(string shortUrl);
    }
}