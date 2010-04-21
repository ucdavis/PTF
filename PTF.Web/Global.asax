<%@ Application Language="C#" %>

<script runat="server">

    private CAESOps.ErrorReporting errorReport = new CAESOps.ErrorReporting();
    
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs

#if debug
#else    
        Exception ex = HttpContext.Current.Error;

        if (ex.GetType() == typeof(HttpException))
        {
            HttpContext.Current.ClearError();
            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.UNKNOWN), true);
        }
        else
        {
            if (ex.InnerException != null)
            {
                ex = ex.InnerException; //Grab the inner exception because the outerexception is a generic 'unhandled exception' message.
            }

            errorReport.ReportError(ex, string.Format("Page: {0}", HttpContext.Current.Request.Url.ToString()));

            HttpContext.Current.ClearError();//Clear the error for redirect

            Response.Redirect(PTFConfiguration.ErrorPage(PTFConfiguration.ErrorType.UNKNOWN), true);
        }

#endif

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
