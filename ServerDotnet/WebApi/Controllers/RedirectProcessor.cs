using System;
using System.Threading.Tasks;
using Application.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace WebApi.Controllers
{
    public class RedirectProcessor : ControllerBase
    {
        private readonly ILogger<RedirectProcessor> _logger;
        private readonly LinkService _linkService;

        public RedirectProcessor(ILogger<RedirectProcessor> logger, LinkService linkService)
        {
            _logger = logger;
            _linkService = linkService;
        }
        
        [HttpGet]
        public async Task<IActionResult> ProcessRedirect(string key)
        {
            try
            {
                var link = await _linkService.GetLinkFullUrl(key);
                return Redirect(link);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Cant get link by key {Key}", key);
                return Redirect("/not-found");
            }
        }
    }
}