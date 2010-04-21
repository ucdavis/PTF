/// <reference name="MicrosoftAjax.js"/>

var STR_LoadingImg = "LoadingImg";
var STR_ConfirmImg = "ConfirmImg";
var STR_FailImg = "FailImg";

var STR_Inline = "inline";
var STR_None = "none";

var STR_Rooting = "Rooting";
var STR_Recallusing = "Recallusing";

var STR_ConfirmText = "Are you sure you want to change the status to ";

var STR_Shipped = "Shipped";
var STR_Dead = "Dead";
var STR_Initiated = "Initiated";

function ChangeStatus(dropDown)
{       
    // one level up is the tr, two levels up is the tr which has the id
    var plantID = dropDown.parentNode.parentNode.id;
    var selectedIndex = dropDown.selectedIndex;
    var value = dropDown.options[selectedIndex].value;
    var text = dropDown.options[selectedIndex].text;    
    
    if ((text == STR_Shipped || text == STR_Dead) && !confirm(STR_ConfirmText + text + "?"))
    {
        // set the drop down back to initiated
        for (i = 0; i < dropDown.length; i++)
        {
            if (dropDown.options[i].text == STR_Initiated)
            {
                dropDown.selectedIndex = i;
                break;
            }
        }
        
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
    
    ScriptServices.SaveChangeStatus(plantID, value, OnComplete, OnFail, context);
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
        ScriptServices.SaveRecallusingAssay(plantID, checkBox.checked, OnComplete, OnFail, context); 
    }
    else
    {
        ScriptServices.SaveRooting(plantID, checkBox.checked, OnComplete, OnFail, context);
    }
}

// successful complete of save
function OnComplete(result, context)
{        
    $get(context.PlantID + "DateDelivered").innerHTML = result.ReturnText;
              
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
    context.LoadImg.style.display = STR_None;
    
    debugger;
    
    if (result._message != "")
    {
        alert(result._message);
    }
}

function EditPlantComments(plantID, plantIDBox, modal, commentTextBox, comments)
{
    $get(plantIDBox).value = plantID;
    $find(modal).show();
    $get(commentTextBox).value = $get(plantID + 'CommentText').innerHTML;
}

function SaveSuborderProperty(suborderID, button, propertyName)
{   
    // get the containing objects        
    var panel = button.parentNode;
                
    var dropDown;
    
    // find the dropdown
    for (var i = 0; i < panel.childNodes.length; i++)
    {
        if (panel.childNodes[i].type == "select-one")
        {
            dropDown = panel.childNodes[i];
            break;
        }
    }
    
    // get the selected value
    var value = dropDown.options[dropDown.selectedIndex].value;
    
    ScriptServices.SaveProperty(suborderID, propertyName, value, "Suborder", SaveSuborderPropertyOnComplete, SaveSuborderPropertyOnFail, dropDown);
}

function SaveSuborderPropertyOnComplete(result, context)
{
    // hide the panel
    context.parentNode.style.display = "none";
    
    // display the selected value
    context.parentNode.parentNode.innerHTML = context.options[context.selectedIndex].text;
}

function SaveSuborderPropertyOnFail(result, context)
{
    // play an animation
    var fail = document.createElement('img');
    fail.setAttribute("id", "confirmIMG");
    fail.setAttribute("src", "../Images/cancel.png");
    fail.setAttribute("style", "width:16px; height:16px;");
            
    context.parentNode.appendChild(fail);
}