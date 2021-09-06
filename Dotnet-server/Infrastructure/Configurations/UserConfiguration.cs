using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable(nameof(User)).HasKey(item => item.UserId);
            builder.Property(x => x.Login).IsRequired().HasMaxLength(20);
            builder.Property(x => x.Password).IsRequired();
            builder.Property(x => x.CreationDate).IsRequired();
        }
    }
}