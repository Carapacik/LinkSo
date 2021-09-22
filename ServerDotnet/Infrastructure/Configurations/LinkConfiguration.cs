using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Configurations
{
    public class LinkConfiguration : IEntityTypeConfiguration<Link>
    {
        public void Configure(EntityTypeBuilder<Link> builder)
        {
            builder.ToTable("link");

            builder.OwnsOne(x => x.Password, password =>
            {
                password.Property(x => x.PasswordHash).HasColumnName("password_hash");
                password.Property(x => x.PasswordSalt).HasColumnName("password_salt");
            });

            builder.HasKey(x => x.Key);
            builder.HasIndex(x => x.Key).IsUnique();
            
            builder.Property(x => x.Key).IsRequired();
            builder.Property(x => x.Target).IsRequired();
        }
    }
}