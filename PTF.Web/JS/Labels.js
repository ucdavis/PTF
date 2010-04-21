/// <reference name="MicrosoftAjax.js"/>

function PrintLabels()
{
    var selectedPlants = new Array();

    var table = $get("PlantsTable");
    
    for (i = 0; i < table.rows.length; i++)
    {
        var id = table.rows[i].id;
        
        // check to see if we have an id
        if (id != "")
        {
            var row = $get(id);
            var children = row.getElementsByTagName("input"); 
            
            var checkBox = children[0];
            
            if (checkBox.checked)
            {
                selectedPlants.push(id);
            }
        }
    }
 
    if (selectedPlants.length > 0)
    {
        PageMethods.ExportToLabels(selectedPlants, PrintLabelsOnComplete);
    }
    else
    {
        alert("You need to select a plant to print a label for.");
    }
}

function PrintLabelsOnComplete (result)
{
    var win = window.open('ExportLabel.aspx','ExportLabel'); // Do not put spaces in the second parameter
}