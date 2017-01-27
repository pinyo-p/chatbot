using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSetTableAdapters.tb_answerTableAdapter tb_answer = new DataSetTableAdapters.tb_answerTableAdapter();
        GridView1.DataSource = tb_answer.GetData();
        GridView1.DataBind();
    }

    public String getQuestion(Object objString)
    {
        DataSetTableAdapters.tb_questionTableAdapter tb_question = new DataSetTableAdapters.tb_questionTableAdapter();
        DataTable dt = tb_question.GetDataByAnswerId((int)objString);
        String q = "<ul>";
        foreach (DataRow dr in dt.Rows)
        {
            q += "<li>";
            q += dr["question"].ToString();
            q += "</li>";
        }
        q += "</ul>";
        return q;
    }

    public String getAnswer()
    {
        String strAnswer = "<table border='1'>";
        DataSetTableAdapters.tb_answerTableAdapter tb_answer = new DataSetTableAdapters.tb_answerTableAdapter();
        DataTable dt_answer = tb_answer.GetData();
        strAnswer += "<tr><td>Id</td><td>Answer</td><td>Question</td></tr>";
        foreach (DataRow dr_answer in dt_answer.Rows)
        {
            Int32 answer_id = (Int32)dr_answer["id"];
            String question = getQuestion(answer_id);
            strAnswer += "<tr>";
            strAnswer += "<td>" + dr_answer["id"] + "</td>";
            strAnswer += "<td>" + dr_answer["answer"] + "</td>";
            strAnswer += "<td>" + question + "</td>";
            strAnswer += "</tr>";
        }
        strAnswer += "</table>";
        return strAnswer;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {

    }
}