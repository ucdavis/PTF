using CAESDO.CASH.Core.Domain;
using System.Collections.Generic;

namespace CAESDO.PTF.Core.DataInterfaces
{
    /// <summary>
    /// Provides an interface for retrieving DAO objects
    /// </summary>
    public interface IDaoFactory 
    {
        IGenericDao<T, IdT> GetGenericDao<T, IdT>();
        IAverageDao GetAverageDao();
        ILengthOfServiceAverageDao GetLengthOfServiceAverageDao();
        IAppointmentDao GetAppointmentDao();
        IChartXFundDao GetChartXFundDao();
        IBaselinePercentDao GetBaselinePercentDao();          
        ISalaryChangeDao GetSalaryChangeDao();
    }

    // There's no need to declare each of the DAO interfaces in its own file, so just add them inline here.
    // But you're certainly welcome to put each declaration into its own file. 
    #region Inline interface declarations

    public interface IGenericDao<T, IdT> : IDao<T, IdT> { }

    public interface IAverageDao : IDao<Average, int> {
        List<Average> GetAveragesByTitleCode(string TitleCode);
        List<Average> GetAveragesByTitleCodeAndScaleType(string TitleCode, string ScaleType);
        Average GetAverageForTileScale(string TitleCode, string ScaleName);
    }

    public interface ILengthOfServiceAverageDao : IDao<LengthOfServiceAverage, string> {
        List<LengthOfServiceAverage> GetAveragesByTitleCode(string TitleCode);
    }
          
    public interface IAppointmentDao : IDao<Appointment, int> {
        List<Appointment> GetAppointmentsLessThanScale(string scaleName);
        List<Appointment> GetAppointmentsMoreThanXYearsLessScale(int years, string scaleName);
    }

    public interface IChartXFundDao : IDao<ChartXFund, int> {
        ChartXFund GetByChartAndFundType(string chart, FundType fundType);
    }

    public interface IBaselinePercentDao : IDao<BaselinePercent, int> {
        BaselinePercent GetByCriteriaType(ChangeSet changeSet, CriteriaTypes CriteriaType);
    }
          
    public interface ISalaryChangeDao : IDao<SalaryChange, int> {
        SalaryChange GetExistingChange(SalaryChange example);
        List<SalaryChange> GetSalaryChangeByEmployee(string employeeID, string titleCode, ChangeSet changeSet, string changeType);
        List<SalaryChange> GetByEmployee(Employee employee, ChangeSet changeSet);
    }
            
    #endregion
}
