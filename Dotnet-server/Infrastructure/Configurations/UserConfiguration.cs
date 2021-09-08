using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("user");

            builder.HasIndex(p => p.Login).IsUnique();
            builder.Property(x => x.Login).IsRequired().HasMaxLength(20);
            
            builder.Property(x => x.Email).IsRequired();
            
            builder.OwnsOne(x => x.Password);
            builder.Property(x => x.Password).IsRequired();

            builder.Property(x => x.RegisterDate).IsRequired();
        }
    }
}