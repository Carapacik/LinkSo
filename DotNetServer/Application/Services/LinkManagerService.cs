using System.Threading.Tasks;
using Application.Exceptions;
using Application.Tools.Hash;
using Domain.Entities;
using Domain.Repositories;

namespace Application.Services
{
    public class LinkManagerService
    {
        private readonly ILinkRepository _linkRepository;

        public LinkManagerService(ILinkRepository linkRepository)
        {
            _linkRepository = linkRepository;
        }

        public async Task<Link> CreateLink(string shortUrl, string fullUrl, LinkType linkType, string password = null)
        {
            Password generatedPassword = null;
            if (linkType == LinkType.Private)
            {
                if (string.IsNullOrWhiteSpace(password))
                {
                    throw new InvalidInputDataException(InvalidInputDataException.LinkConflictingData);
                }
                
                generatedPassword = HashingTools.QuickHash(password);
            }

            return await _linkRepository.AddLink(shortUrl, fullUrl, linkType, generatedPassword);
        }
    }
}