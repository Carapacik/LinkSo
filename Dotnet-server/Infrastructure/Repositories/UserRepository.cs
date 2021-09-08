using System.Threading.Tasks;
using Domain.Entities;
using Domain.Repositories;

namespace Infrastructure.Repositories
{
    public class UserRepository: IUserRepository
    {
        public Task<User> AddUser(string login, string email, Password password)
        {
            throw new System.NotImplementedException();
        }

        public Task<User> GetUserByLogin(string login)
        {
            throw new System.NotImplementedException();
        }

        public Task<User> GetUserById(int id)
        {
            throw new System.NotImplementedException();
        }
    }
}