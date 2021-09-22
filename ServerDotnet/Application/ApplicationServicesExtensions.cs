using System.Text;
using Application.Services;
using Application.Tools;
using Application.Tools.Jwt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Recipes.Application.Services.User;

namespace Application
{
    public static class ApplicationServicesExtensions
    {
        public static void AddAuthorization(this IServiceCollection services, IConfigurationSection jwtSection)
        {
            services.Configure<JwtSettings>(jwtSection);
            var jwtSettings = new JwtSettings();
            jwtSection.Bind(jwtSettings);

            services.AddAuthentication(opt =>
            {
                opt.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                opt.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = jwtSettings.ValidIssuer,
                    ValidAudience = jwtSettings.ValidAudience,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings.SecurityKey))
                };
            });
        }
        
        public static void AddApplicationDependencies(this IServiceCollection services)
        {
            services.AddScoped<LinkGenerator>();
            services.AddScoped<JwtHandler>();
            
            services.AddScoped<UserService>();
            services.AddScoped<LinkManagerService>();
            services.AddScoped<RedirectService>();
            services.AddScoped<UserService>();
        }
    }
}