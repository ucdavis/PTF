/// <reference name="MicrosoftAjax.js"/>

var regular = "";
var highLighted = "red";
var mouseOver = "green";
var highLightedMouseOver = "orange";
var error = "blue";

function ChangeHighlight(row)
{
    // row is not previously highlighted, make it highlighted
    if (row.style.backgroundColor == mouseOver)
    {
        row.style.backgroundColor = highLightedMouseOver;
    }
    // row was previously highlighted, make it not highlighted
    else if (row.style.backgroundColor == highLightedMouseOver)
    {
        row.style.backgroundColor = mouseOver;
    }
    // shouldn't get here
    else
    {
        row.style.backgroundColor = error;
    }
}

function OnMouseOver(row)
{
    // not highlighted, regular transition
    if ( row.style.backgroundColor == regular )
    {
        row.style.backgroundColor = mouseOver;
    }
    // already highlighted, make different color
    else if (row.style.backgroundColor == highLighted )
    {
        row.style.backgroundColor = highLightedMouseOver;
    }
    else
    {
       row.style.backgroundColor = error; 
    }
}

function OnMouseOut(row)
{
    // wasn't highlighted, regular transition
    if ( row.style.backgroundColor == mouseOver )
    {
        row.style.backgroundColor = regular;
    }
    // was previously highlighted
    else if ( row.style.backgroundColor == highLightedMouseOver )
    {
        row.style.backgroundColor = highLighted;
    }
    else
    {
        row.style.backgroundColor = blue;
    }
    
}

function FreezeGridViewHeader(gridID,wrapperDivCssClass) 
{
    /// <summary>
    ///   Used to create a fixed GridView header and allow scrolling
    /// </summary>
    /// <param name="gridID" type="String">
    ///   Client-side ID of the GridView control
    /// </param>
    /// <param name="wrapperDivCssClass" type="String">
    ///   CSS class to be applied to the GridView's wrapper div element.  
    ///   Class MUST specify the CSS height and width properties.  
    ///   Example: width:800px;height:400px;border:1px solid black;
    /// </param>
    var grid = document.getElementById(gridID);
    if (grid != 'undefined')
    {
        grid.style.visibility = 'hidden';
        var div = null;
        if (grid.parentNode != 'undefined') 
        {
            //Find wrapper div output by GridView
            div = grid.parentNode;
            if (div.tagName == "DIV")
            {
                div.className = wrapperDivCssClass;  
                div.style.overflow = "none";                   
            }
        }                
        //Find DOM TBODY element and remove first TR tag from 
        //it and add to a THEAD element instead so CSS styles
        //can be applied properly in both IE and FireFox
        var tags = grid.getElementsByTagName('TBODY');
        if (tags != 'undefined')
        {
            var tbody = tags[0];
            var trs = tbody.getElementsByTagName('TR');
            var headerHeight = 8;
            if (trs != 'undefined') 
            {
                headerHeight += trs[0].offsetHeight;
                var headTR = tbody.removeChild(trs[0]);
                var head = document.createElement('THEAD');
                head.appendChild(headTR);
                grid.insertBefore(head, grid.firstChild);
            }
            //Needed for Firefox
            tbody.style.height = 
              (div.offsetHeight -  headerHeight) + 'px';
            tbody.style.overflowX = "hidden";
            tbody.overflow = 'auto';
            tbody.overflowX = 'hidden';
        }
        grid.style.visibility = 'visible';
    }
}