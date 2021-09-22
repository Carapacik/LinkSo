﻿// <auto-generated />
using System;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace Migrations.Migrations
{
    [DbContext(typeof(LinkSoDbContext))]
    [Migration("20210910153742_LinkKey")]
    partial class LinkKey
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 63)
                .HasAnnotation("ProductVersion", "5.0.9")
                .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            modelBuilder.Entity("Domain.Entities.Link", b =>
                {
                    b.Property<string>("Key")
                        .HasColumnType("text")
                        .HasColumnName("key");

                    b.Property<int>("LinkType")
                        .HasColumnType("integer")
                        .HasColumnName("link_type");

                    b.Property<string>("Target")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("target");

                    b.Property<int>("UserId")
                        .HasColumnType("integer")
                        .HasColumnName("user_id");

                    b.HasKey("Key")
                        .HasName("pk_link");

                    b.HasIndex("Key")
                        .IsUnique()
                        .HasDatabaseName("ix_link_key");

                    b.HasIndex("UserId")
                        .HasDatabaseName("ix_link_user_id");

                    b.ToTable("link");
                });

            modelBuilder.Entity("Domain.Entities.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("id")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("email");

                    b.Property<string>("Login")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("character varying(20)")
                        .HasColumnName("login");

                    b.Property<DateTime>("RegisterDate")
                        .HasColumnType("timestamp without time zone")
                        .HasColumnName("register_date");

                    b.HasKey("Id")
                        .HasName("pk_user");

                    b.HasIndex("Login")
                        .IsUnique()
                        .HasDatabaseName("ix_user_login");

                    b.ToTable("user");
                });

            modelBuilder.Entity("Domain.Entities.Link", b =>
                {
                    b.HasOne("Domain.Entities.User", "User")
                        .WithMany("Links")
                        .HasForeignKey("UserId")
                        .HasConstraintName("fk_link_user_user_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.OwnsOne("Domain.Entities.Password", "Password", b1 =>
                        {
                            b1.Property<string>("LinkKey")
                                .HasColumnType("text")
                                .HasColumnName("key");

                            b1.Property<string>("PasswordHash")
                                .HasColumnType("text")
                                .HasColumnName("password_hash");

                            b1.Property<string>("PasswordSalt")
                                .HasColumnType("text")
                                .HasColumnName("password_salt");

                            b1.HasKey("LinkKey")
                                .HasName("pk_link");

                            b1.ToTable("link");

                            b1.WithOwner()
                                .HasForeignKey("LinkKey")
                                .HasConstraintName("fk_link_link_key");
                        });

                    b.Navigation("Password");

                    b.Navigation("User");
                });

            modelBuilder.Entity("Domain.Entities.User", b =>
                {
                    b.OwnsOne("Domain.Entities.Password", "Password", b1 =>
                        {
                            b1.Property<int>("UserId")
                                .ValueGeneratedOnAdd()
                                .HasColumnType("integer")
                                .HasColumnName("id")
                                .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                            b1.Property<string>("PasswordHash")
                                .HasColumnType("text")
                                .HasColumnName("password_hash");

                            b1.Property<string>("PasswordSalt")
                                .HasColumnType("text")
                                .HasColumnName("password_salt");

                            b1.HasKey("UserId")
                                .HasName("pk_user");

                            b1.ToTable("user");

                            b1.WithOwner()
                                .HasForeignKey("UserId")
                                .HasConstraintName("fk_user_user_id");
                        });

                    b.Navigation("Password");
                });

            modelBuilder.Entity("Domain.Entities.User", b =>
                {
                    b.Navigation("Links");
                });
#pragma warning restore 612, 618
        }
    }
}
