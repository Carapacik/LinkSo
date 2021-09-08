using Domain.Entities;
using Infrastructure.Configurations;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure
{
    public class LinkDbContext : DbContext
    {
        public DbSet<Link> Links { get; set; }
        
        public DbSet<User> Users { get; set; }
        
        public LinkDbContext(DbContextOptions<LinkDbContext> options) : base(options)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new LinkConfiguration());
        }
    }
}