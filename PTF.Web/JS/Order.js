/// <reference name="MicrosoftAjax.js"/>

function SaveProperty(queryString, property, txtBox, objType)
{
    // dynamically add the loading image   
    var img = document.createElement('img');
    img.setAttribute("id", "load");
    img.setAttribute("src", "../Images/mozilla_blu.gif");
    
    var divTag = $get(property);
    
    // make sure only one image shows, if another is showing a save is probably being executed.
    if (divTag.lastChild != null)
    {
        if (divTag.lastChild.id == "load")
        {
            return;
        }
        else
        {
            var imgs = divTag.childNodes;
            for(i = 0; i < imgs.length; i++)
            {
                divTag.removeChild(imgs[i]);
            }
        }
    }
    
    divTag.appendChild(img);
    
    ScriptServices.SaveProperty(queryString, property, $get(txtBox).value, objType, SavePropertyOnComplete, SavePropertyOnFail, property);
}

function SavePropertyOnComplete(result, context)
{   
    if (result == "")
    {
        // remove the only child
        var divTag = $get(context);
        divTag.removeChild(divTag.lastChild);
        
        // play an animation
        var confirm = document.createElement('img');
        confirm.setAttribute("id", "confirmIMG");
        confirm.setAttribute("src", "../Images/confirm.png");
        confirm.setAttribute("style", "width:16px; height:16px;");
                
        divTag.appendChild(confirm);
        
        // animate the check mark confirmation out
        var animation = new AjaxControlToolkit.Animation.FadeOutAnimation(confirm, 2, 25, 0, 1, true);
        animation.play();
    }
}
function SavePropertyOnFail(result, context)
{
    // remove the only child
    var divTag = $get(context);
    divTag.removeChild(divTag.lastChild);
    
    // play an animation
    var confirm = document.createElement('img');
    confirm.setAttribute("id", "confirmIMG");
    confirm.setAttribute("src", "../Images/cancel.png");
    confirm.setAttribute("style", "width:16px; height:16px;");
            
    divTag.appendChild(confirm);

    alert(result._message);
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

function SaveSuborderNumberOfPlants(subOrderId, numberOfPlants, button) {
    ScriptServices.SaveProperty(subOrderId, "NumberOfPlants", numberOfPlants, "Suborder", SaveSuborderNumberOfPlantsOnComplete, SaveSuborderPropertyOnFail, button);
}

function SaveSuborderNumberOfPlantsOnComplete(result, context) {
    alert("Save was successful.");
}