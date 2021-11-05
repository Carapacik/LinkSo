using System.Threading.Tasks;
using Application.Services;
using Application.Tools.Permissions;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApi.DTOs.Requests;
using WebApi.DTOs.Responses;

namespace WebApi.Controllers
{   
    [ApiController]
    [Authorize]
    [Route("api/[controller]")]
    [Produces("application/json")]
    public class LinkManagerController : ControllerBase
    {
        private readonly LinkManagerService _linkManagerService;
        private readonly IMapper _mapper;

        public LinkManagerController(LinkManagerService linkManagerService, IMapper mapper)
        {
            _linkManagerService = linkManagerService;
            _mapper = mapper;
        }

        [HttpPost("create")]
        [AllowAnonymous]
        public async Task<ActionResult<LinkInfoResponseDTO>> CreateLink([FromBody]LinkCreateRequestDTO linkCreateRequestDto)
        {
            var createdLink = await _linkManagerService.CreateLink(linkCreateRequestDto.Target,
                linkCreateRequestDto.LinkType, HttpContext.User.GetClaims(), linkCreateRequestDto.Password);

            return _mapper.Map<LinkInfoResponseDTO>(createdLink);
        }
        
        [HttpDelete("delete")]
        public async Task<IActionResult> DeleteLink([FromQuery]string key)
        {
            await _linkManagerService.DeleteLink(key, HttpContext.User.GetClaims());
            return Ok();
        }
    }
}