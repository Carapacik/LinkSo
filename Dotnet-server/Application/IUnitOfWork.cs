using System.Threading.Tasks;

namespace Application
{
    public interface IUnitOfWork
    {
        Task Commit();
    }
}