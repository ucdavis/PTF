using CAESDO.PTF.Core.DataInterfaces;
using CAESDO.PTF.Core.Domain;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Expression;
using System.ComponentModel;
using System.Web;

namespace CAESDO.PTF.Data
{
    /// <summary>
    /// Exposes access to NHibernate DAO classes.  Motivation for this DAO
    /// framework can be found at http://www.hibernate.org/328.html.
    /// </summary>
    public class NHibernateDaoFactory : IDaoFactory
    {
        #region Dao Retrieval Operations

        public IGenericDao<T, IdT> GetGenericDao<T, IdT>()
        {
            return new GenericDao<T, IdT>();
        }

        #region Lookups
        //public INoteTypeDao GetNoteTypeDao()
        //{
        //    return new NoteTypeDao();
        //}
        //public ICropDao GetCropDao()
        //{
        //    return new CropDao();
        //}
        //public IAgroStrainDao GetAgroStrainDao()
        //{
        //    return new AgroStrainDao();
        //}
        //public IStatusDao GetStatusDao()
        //{
        //    return new StatusDao();
        //}
        //public ISelectableMarkerDao GetSelectableMarkerDao()
        //{
        //    return new SelectableMarkerDao();
        //}
        //public IGenoTypeDao GetGenoTypeDao()
        //{
        //    return new GenoTypeDao();
        //}
        //public ITransGeneDao GetTransGeneDao()
        //{
        //    return new TransGeneDao();
        //}
        #endregion

        #endregion

        #region Inline DAO implementations

        public class GenericDao<T, IdT> : AbstractNHibernateDao<T, IdT>, IGenericDao<T, IdT> { }

        #region Lookups
        //public class NoteTypeDao : AbstractNHibernateDao<NoteType, int>, INoteTypeDao { }
        //public class CropDao : AbstractNHibernateDao<Crop, int>, ICropDao { }
        //public class AgroStrainDao : AbstractNHibernateDao<AgroStrain, int>, IAgroStrainDao { }
        //public class StatusDao : AbstractNHibernateDao<Status, int>, IStatusDao { }
        //public class SelectableMarkerDao : AbstractNHibernateDao<SelectableMarker, int>, ISelectableMarkerDao { }
        //public class GenoTypeDao : AbstractNHibernateDao<GenoType, int>, IGenoTypeDao { }
        //public class TransGeneDao : AbstractNHibernateDao<TransGene, int>, ITransGeneDao { }
        #endregion

        #endregion

    }
}
