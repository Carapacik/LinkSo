using System.IdentityModel.Tokens.Jwt;
using System.Threading.Tasks;
using Application.Exceptions;
using Application.Tools.Hash;
using Application.Tools.Jwt;
using Application.Tools.Permissions;
using Domain;
using Domain.Repositories;

namespace Application.Services
{
    public class UserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly JwtHandler _jwtHandler;

        public UserService(IUserRepository userRepository, IUnitOfWork unitOfWork, JwtHandler jwtHandler)
        {
            _userRepository = userRepository;
            _unitOfWork = unitOfWork;
            _jwtHandler = jwtHandler;
        }
        
        public async Task<string> Register(string login, string email, string password)
        {
            if (await _userRepository.GetUserByLogin(login) != null)
                throw new UserModificationException(UserModificationException.LoginIsTaken);

            var generatedPassword  = HashingTools.QuickHash(password);
            var user = await _userRepository.AddUser(login, email, generatedPassword);
            await _unitOfWork.Commit();

            return new JwtSecurityTokenHandler().WriteToken(_jwtHandler.GenerateTokenOptions(user));
        }

        
        public async Task<string> Login(string login, string password)
        {
            var user = await _userRepository.GetUserByLogin(login);
            if (user == null)
                throw new UserAuthenticationException(UserAuthenticationException.LoginDoesNotExist);

            if (!HashingTools.ValidatePassword(password, user.Password)) 
                throw new UserAuthenticationException(UserAuthenticationException.PasswordIsIncorrect);
            
            return new JwtSecurityTokenHandler().WriteToken(_jwtHandler.GenerateTokenOptions(user));
        }
        
        public async Task ValidateUser(UserClaims userClaims)
        {
            if (!userClaims.IsAuthenticated)
                throw new UserAuthenticationException(UserAuthenticationException.UserIsInvalid);

            var dbUser = await _userRepository.GetUserById(userClaims.UserId);
            if (dbUser == null)
                throw new UserAuthenticationException(UserAuthenticationException.UserIsInvalid);
        }
    }
}