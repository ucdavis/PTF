<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script type="text/javascript">
    
        // do an auto redirect, since doing it server side is causing an exception to be thrown
    
        if (new Boolean("<%= IsCasUser %>")) {
            window.location = "https://cas.ucdavis.edu/cas/logout";
        }
        else {
            window.location = "<%= STR_RedirectAddress %>";
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       
    </div>
    </form>
</body>
</html>
