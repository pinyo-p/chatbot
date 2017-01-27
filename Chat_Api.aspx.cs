using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chat_Api : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
String answer  = "คำตอบคือ ";

String question = Request.QueryString["q"];
if (question == "Hi")
    answer = "Hi";
else if (question == "Hello")
    answer = "Hi";
else if (question == "Hey")
    answer = " Welcome";
else
    answer = question + " What??";

//String json = "{\"answer\":\"" + answer + "\"}";
String json = answer;
Response.Clear();
Response.ContentType = "application/json; charset=utf-8";
Response.Write(json);
Response.End();

    }
}