using System.Threading.Tasks;
using Application.Exceptions;
using Application.Tools;
using Application.Tools.Hash;
using Application.Tools.Permissions;
using Domain;
using Domain.Entities;
using Domain.Repositories;

namespace Application.Services
{
    public class LinkManagerService
    {
        private readonly ILinkRepository _linkRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly LinkGenerator _linkGenerator;

        public LinkManagerService(ILinkRepository linkRepository, IUnitOfWork unitOfWork, LinkGenerator linkGenerator)
        {
            _linkRepository = linkRepository;
            _unitOfWork = unitOfWork;
            _linkGenerator = linkGenerator;
        }

        public async Task<Link> CreateLink(string targetUrl, LinkType linkType, UserClaims userClaims,
            string password = null)
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

            var key = _linkGenerator.GenerateFullUrl();

            var addedLink =  await _linkRepository.AddLink(key, targetUrl, linkType, userClaims.UserId, generatedPassword);
            await _unitOfWork.Commit();
            return addedLink;
        }

        public async Task DeleteLink(string shortUrl, UserClaims userClaims)
        {
            await _linkRepository.DeleteLink(shortUrl);
            await _unitOfWork.Commit();
        }
    }
}