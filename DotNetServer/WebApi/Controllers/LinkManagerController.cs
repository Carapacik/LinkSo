using System.Threading.Tasks;
using Application.Services;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApi.DTOs.Link;

namespace WebApi.Controllers
{   
    [ApiController]
    [Authorize]
    [Route("api/[controller]")]
    [Produces("application/json")]
    public class LinkManagerController
    {
        private readonly LinkManagerService _linkManagerService;
        private readonly IMapper _mapper;

        public LinkManagerController(LinkManagerService linkManagerService, IMapper mapper)
        {
            _linkManagerService = linkManagerService;
            _mapper = mapper;
        }

        [HttpPost]
        public async Task<ActionResult<LinkInfoDTO>> CreateLink([FromBody]LinkCreateDTO linkCreateDTO)
        {
            var createdLink = await _linkManagerService.CreateLink(linkCreateDTO.ShortUrl, linkCreateDTO.FullUrl,
                linkCreateDTO.LinkType, linkCreateDTO.Password);

            return _mapper.Map<LinkInfoDTO>(createdLink);
        }
    }
}