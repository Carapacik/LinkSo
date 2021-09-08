using Domain.Entities;
using Infrastructure.Configurations;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure
{
    public class LinkSoDbContext : DbContext
    {
        public DbSet<Link> Links { get; set; }
        
        public DbSet<User> Users { get; set; }
        
        public LinkSoDbContext(DbContextOptions<LinkSoDbContext> options) : base(options)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new LinkConfiguration());
        }
    }
}