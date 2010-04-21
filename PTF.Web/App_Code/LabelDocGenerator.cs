using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using CAESDO.PTF.Core.Domain;
using Resources;
using System.Text;

/// <summary>
/// Summary description for LabelDocGenerator
/// </summary>
public class LabelDocGenerator
{

    /*
     * Tokens in the label templates:
     * STR_LabelDocument
     *      {LABELBODY}
     * STR_LabelTemplate
     *      {PEDIGREE}
     *      {CROP}
     *      {PICODE}
     *      {GENOTYPE}
     *      {PINAME}
     */

    private const string STR_LabelBody = "{LABELBODY}";

    private const string STR_Pedigree = "{PEDIGREE}";
    private const string STR_Crop = "{CROP}";
    private const string STR_PICode = "{PICODE}";
    private const string STR_Genotype = "{GENOTYPE}";
    private const string STR_PIName = "{PIName}";

    public LabelDocGenerator() {}

    public static byte[] GenerateLabelDocument(List<Plant> plants)
    {
        StringBuilder labels = new StringBuilder();

        string label;
        Plant p;

        // deal with the case of a single item
        if (plants.Count == 1)
        {
            p = plants[0];

            label = CommonStrings.STR_LabelTemplateSingleElement;
            label = label.Replace(STR_Pedigree, p.Pedigree);
            label = label.Replace(STR_Crop, p.Experiment.Construct.SubOrder.Crop.Name);
            label = label.Replace(STR_PICode, p.Experiment.Construct.Order.PICode);
            label = label.Replace(STR_Genotype, p.Experiment.Construct.SubOrder.GenoType.Name);
            label = label.Replace(STR_PIName, p.Experiment.Construct.Order.PI);

            labels.Append(label);
        }
        else
        {
            // deal with the case of multiple items
            for (int i = 0; i < plants.Count; i++)
            {
                p = plants[i];

                // deal with the first element
                if (i == 0)
                {
                    label = CommonStrings.STR_LabelTemplateFirstElement;
                }
                // deal with the last element
                else if (i == plants.Count - 1)
                {
                    label = CommonStrings.STR_LabelTemplateLastElement;
                }
                // all regular elements
                else
                {
                    label = CommonStrings.STR_LabelTemplate;
                }

                label = label.Replace(STR_Pedigree, p.Pedigree);
                label = label.Replace(STR_Crop, p.Experiment.Construct.SubOrder.Crop.Name);
                label = label.Replace(STR_PICode, p.Experiment.Construct.Order.PICode);
                label = label.Replace(STR_Genotype, p.Experiment.Construct.SubOrder.GenoType.Name);
                label = label.Replace(STR_PIName, p.Experiment.Construct.Order.PI);

                labels.Append(label);
            }
        }

        string labelDoc = CommonStrings.STR_LabelTemplateDoc.Replace(STR_LabelBody, labels.ToString());

        ASCIIEncoding encoding = new ASCIIEncoding();
        return encoding.GetBytes(labelDoc);
    }
}
