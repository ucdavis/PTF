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

        #region Lookups
        //INoteTypeDao GetNoteTypeDao();
        //ICropDao GetCropDao();
        //IAgroStrainDao GetAgroStrainDao();
        //IStatusDao GetStatusDao();
        //ISelectableMarkerDao GetSelectableMarkerDao();
        //IGenoTypeDao GetGenoTypeDao();
        //ITransGeneDao GetTransGeneDao();
        #endregion
    }

    // There's no need to declare each of the DAO interfaces in its own file, so just add them inline here.
    // But you're certainly welcome to put each declaration into its own file.
    #region Inline interface declarations

    public interface IGenericDao<T, IdT> : IDao<T, IdT> { }

    #region Lookups
    //public interface INoteTypeDao : IDao<NoteType, int> { }
    //public interface ICropDao : IDao<Crop, int> { }
    //public interface IAgroStrainDao : IDao<AgroStrain, int> { }
    //public interface IStatusDao : IDao<Status, int> { }
    //public interface ISelectableMarkerDao : IDao<SelectableMarker, int> { }
    //public interface IGenoTypeDao : IDao<GenoType, int> { }
    //public interface ITransGeneDao : IDao<TransGene, int> { }
    #endregion

    #endregion
}
