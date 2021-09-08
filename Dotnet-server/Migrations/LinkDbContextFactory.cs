using System.IO;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace Migrations
{
    public class LinkDbContextFactory : IDesignTimeDbContextFactory<LinkDbContext>
    {
        public LinkDbContext CreateDbContext(string[] args)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", true)
                .AddEnvironmentVariables()
                .Build();

            var builder = new DbContextOptionsBuilder<LinkDbContext>();

            var connectionString = configuration.GetConnectionString("MigrationsConnection");

            builder.ConfigureDatabase(connectionString);

            return new LinkDbContext(builder.Options);
        }
    }
}