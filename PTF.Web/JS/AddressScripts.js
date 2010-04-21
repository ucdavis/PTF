/// <reference name="MicrosoftAjax.js"/>

var str_address1 = "address1";
var str_city = "city";
var str_zip = "zip";
var str_country = "country";
var str_state = "state";
  
var str_inline = "inline";
var str_none = "none";
var str_usa = "USA";
  
var str_empty = "";
var str_unselected = "-1";

function ChangeCountry (countryCode, stateDropDown, internationalStateBox)
{
    if (countryCode == str_usa)
    {
        stateDropDown.style.display = str_inline;
        stateDropDown.disabled = false;
        internationalStateBox.style.display = str_none;
    }
    else if (countryCode == str_unselected)
    {
        stateDropDown.style.display = str_inline;
        stateDropDown.disabled = true;
        internationalStateBox.style.display = str_none;        
    }
    else
    {
        stateDropDown.style.display = str_none;
        internationalStateBox.style.display = str_inline;    
    }
}

function ShippingAddressSame(checkBox, mailing1, mailing2, mailingCity, mailingStateDDL, mailingStateTB, mailingZip, mailingCountry, shipping1, shipping2, shippingCity, shippingStateTB, shippingStateDDL, shippingZip, shippingCountry)
{
    // addresses are the same
    if (checkBox.checked)
    {
        // move the addresses
        shipping1.value = mailing1.value;
        shipping2.value = mailing2.value;
        shippingCity.value = mailingCity.value;
        shippingZip.value = mailingZip.value;
        shippingCountry.selectedIndex = mailingCountry.selectedIndex;
        
        // decide on the state control to show
        if (mailingCountry.options[mailingCountry.selectedIndex].value == str_usa)
        {
            shippingStateDDL.selectedIndex = mailingStateDDL.selectedIndex;
            
            shippingStateDDL.style.display = str_inline;
            shippingStateTB.style.display = str_none;
            
        }
        else
        {
            shippingStateTB.value = mailingStateTB.value;
            
            shippingStateDDL.style.display = str_none;
            shippingStateTB.style.display = str_inline;
        }
    
        // disable the boxes
        shipping1.disabled = true;
        shipping2.disabled = true;
        shippingCity.disabled = true;
        shippingStateTB.disabled = true;
        shippingStateDDL.disabled = true;
        shippingZip.disabled = true;
        shippingCountry.disabled = true;
    }
    // user has decided addresses are not the same
    else
    {
        shipping1.disabled = false;
        shipping2.disabled = false;
        shippingCity.disabled = false;
        shippingZip.disabled = false;
        shippingCountry.disabled = false;
        
        shippingStateDDL.disabled = false;
        shippingStateTB.disabled = false;
        
        var value = shippingCountry.options[shippingCountry.selectedIndex].value;
        
        if (value == str_usa)
        {
            shippingStateDDL.style.display = str_inline;
            shippingStateTB.style.display = str_none;
        }
        else if (value == str_unselected)
        {
            shippingStateDDL.style.display = str_inline;
            shippingStateTB.style.display = str_none;
        }
        else
        {
            shippingStateDDL.style.display = str_none;
            shippingStateTB.style.display = str_inline;
        }
    
        // clear the values
        shipping1.value = str_empty;
        shipping2.value = str_empty;
        shippingCity.value = str_empty;
        shippingZip.value = str_empty;
        shippingCountry.selectedIndex = 0;
        shippingStateDDL.selectedIndex = 0;
        shippingStateTB.value = str_empty;
        shippingStateDDL.disabled = true;
    }
}

function ValidateCountryState(countryDDL, stateDDL, stateTB)
{
    // usa is selected
    if (countryDDL.options[countryDDL.selectedIndex].value == str_usa)
    {
        // drop down state needs to have something selected
        if (stateDDL.options[stateDDL.selectedIndex].value != str_unselected)
        {
            // we are good on the mailing address
            return true;
        }
    }
    else // inernational is selected
    {               
        // international state is necessary
        if (stateTB.value != str_empty)
        {
            return true;
        }
    }
    
    // failed validation
    return false;
}