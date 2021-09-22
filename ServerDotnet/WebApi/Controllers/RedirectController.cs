using System.Threading.Tasks;
using Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Produces("application/json")]
    public class RedirectController : ControllerBase
    {
        private readonly RedirectService _redirectService;

        public RedirectController(RedirectService redirectService)
        {
            _redirectService = redirectService;
        }
        
        [HttpGet]
        public async Task<ActionResult<string>> ProcessRedirect(string key)
        {
            return await _redirectService.GetLink(key);
        }
    }
}