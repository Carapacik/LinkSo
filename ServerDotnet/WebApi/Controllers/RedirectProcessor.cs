using System;
using System.Threading.Tasks;
using Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    public class RedirectProcessor : ControllerBase
    {
        private readonly RedirectService _redirectService;

        public RedirectProcessor(RedirectService redirectService)
        {
            _redirectService = redirectService;
        }
        
        [HttpGet]
        public async Task<IActionResult> ProcessRedirect(string key)
        {
            try
            {
                var link = await _redirectService.GetLink(key);
                return Redirect(link);
            }
            catch (Exception ex)
            {
                return Redirect("/not-found");
            }
        }
    }
}