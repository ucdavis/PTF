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