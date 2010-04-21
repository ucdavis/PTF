using CAESDO.PTF.Core.Domain;
using System.Collections.Generic;

namespace CAESDO.PTF.Core.DataInterfaces
{
    /// <summary>
    /// Provides an interface for retrieving DAO objects
    /// </summary>
    public interface IDaoFactory 
    {
        IGenericDao<T, IdT> GetGenericDao<T, IdT>();

        IConstructDao GetConstructDao();

    }

    // There's no need to declare each of the DAO interfaces in its own file, so just add them inline here.
    // But you're certainly welcome to put each declaration into its own file.
    #region Inline interface declarations

    public interface IGenericDao<T, IdT> : IDao<T, IdT> { }

    public interface IConstructDao : IDao<Construct, int> 
    {
        List<Construct> GetByOrder(Order Order);
    }

    #endregion
}
