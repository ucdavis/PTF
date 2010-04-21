<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Labels.aspx.cs" Inherits="Labels" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    
    <style>
        .TD 
        {
        	font-family: Arial;
        	font-size: 12pt;
        }
        
        @page Section1
        {
        	size: 4in 1in;
        	margin: .1in .15in .0in .15in;
        	mso-page-orientation: landscape;
        }
        
        div.Section1
        {
        	page: Section1;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div class="section1" style="background-color:Gray;">
            011003-000<Br />
            tomato<br />
            Moneymaker<br />
            Bradford<br />
            TRANSGENIC<br />
        </div>
    
    </div>
    </form>
</body>
</html>
