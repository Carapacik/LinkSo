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
        public async Task<ActionResult<string>> DoRedirect(string key)
        {
            var link = await _redirectService.GetLink(key);
            return Redirect(link);
        }
    }
}