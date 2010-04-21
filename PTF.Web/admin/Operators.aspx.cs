using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.BLL;

public partial class admin_Operators : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    Operator op = new Operator()
    //    {
    //        OperatorName = tbName.Text,
    //        OperatorCode = !string.IsNullOrEmpty(tbPreferredID.Text) ? tbPreferredID.Text : null,
    //        IsStudent = cbIsStudent.Checked,
    //    };

    //    OperatorBLL.Insert(op);

    //    // update the list
    //    gvOperators.DataBind();
    //}

}
