using AutoMapper;
using Domain.Entities;
using WebApi.DTOs.Link;

namespace WebApi.AutoMapper
{
    public class WebApiMappingProfile : Profile
    {
        public WebApiMappingProfile()
        {
            CreateMap<Link, LinkInfoDTO>();
        }
    }
}