using System.Threading.Tasks;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface ILinkRepository
    {
        Task<Link> AddLink(string key, string target, LinkType linkType, int authorId, Password password);

        Task<Link> GetLink(string key);

        Task DeleteLink(string key);
    }
}