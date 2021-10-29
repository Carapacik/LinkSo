using System;
using System.Threading.Tasks;
using Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    public class RedirectController : ControllerBase
    {
        private readonly RedirectService _redirectService;

        public RedirectController(RedirectService redirectService)
        {
            _redirectService = redirectService;
        }
        
        [HttpGet]
        public async Task ProcessRedirect(string key)
        {
            try
            {
                var link = await _redirectService.GetLink(key);
                Redirect(link);
            }
            catch (Exception ex)
            {
                Redirect("/");
            }
        }
    }
}