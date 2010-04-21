/// <reference name="MicrosoftAjax.js"/>

var STR_LoadingImg = "LoadingImg";
var STR_ConfirmImg = "ConfirmImg";
var STR_FailImg = "FailImg";

var STR_Inline = "inline";
var STR_None = "none";

var STR_Rooting = "Rooting";
var STR_Recallusing = "Recallusing";

function ChangeStatus(dropDown)
{       
    // one level up is the tr, two levels up is the tr which has the id
    var plantID = dropDown.parentNode.parentNode.id;
    var selectedIndex = dropDown.selectedIndex;
    var value = dropDown.options[selectedIndex].value;
    
    if (dropDown.options[selectedIndex].text == "Shipped" && !confirm("Are you sure plant is shipping?"))
    {
        return;
    }
    
    var context = new Object;          
    context.PlantID = plantID;
    context.Control = dropDown;
    context.LoadImg = $get(plantID + "Status" + STR_LoadingImg);
    context.ConfirmImg = $get(plantID + "Status" + STR_ConfirmImg);
    context.FailImg = $get(plantID + "Status" + STR_FailImg);
    
    // show the processing icon
    context.LoadImg.style.display = STR_Inline;
    context.ConfirmImg.style.display = STR_None;
    context.FailImg.style.display = STR_None;
    
    PageMethods.SaveChangeStatus(plantID, value, OnComplete, OnFail, context);
}

function ChangeCheckBox(checkBox, type)
{
    var plantID = checkBox.parentNode.parentNode.id;
    
    var context = new Object;
    context.PlantID = plantID;
    context.LoadImg = $get(plantID + type + STR_LoadingImg);
    context.ConfirmImg = $get(plantID + type + STR_ConfirmImg);
    context.FailImg = $get(plantID + type + STR_FailImg);
    
    // show the processing icon
    context.LoadImg.style.display = STR_Inline;
    context.ConfirmImg.style.display = STR_None;
    context.FailImg.style.display = STR_None;
    
    if (type == STR_Recallusing)
    {
        PageMethods.SaveRecallusingAssay(plantID, checkBox.checked, OnComplete, OnFail, context); 
    }
    else
    {
        PageMethod.SaveRooting(plantID, checkBox.checked, OnComplete, OnFail, context);
    }
}

// successful complete of save
function OnComplete(result, context)
{        
    if (result != "")
    {
        context.Control.disabled = true;
    }
       
    context.LoadImg.style.display = STR_None;
    context.ConfirmImg.style.display = STR_Inline;
    
    // animate the check mark confirmation out
    var animation = new AjaxControlToolkit.Animation.FadeOutAnimation(context.ConfirmImg, 2, 25, 0, 1, true);
    animation.play();
}
// failure of save
function OnFail(result, context)
{   
    context.FailImg.style.display = STR_Inline;
    context.LoadImg.style.display = STR_Inline;
}