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

            builder.OwnsOne(x => x.Password);
            builder.Property(x => x.ShortUrl).IsRequired();
            builder.Property(x => x.FullUrl).IsRequired();
        }
    }
}