<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1" ShowFooter="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id" SortExpression="Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="question" SortExpression="question">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="answer_id" SortExpression="answer_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("answer_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("answer_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetTableAdapters.tb_questionTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="answer_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="answer_id" Type="Int32" />
                <asp:Parameter Name="Original_Id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>

    <div>
    <table>
        <tr>
            <td>
                คำตอบ
            </td>
            <td>
                <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Link
            </td>
            <td>
                <asp:TextBox ID="txtLink" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                Answer
                <hr />
                <table id="tb_question">
                    <tbody id="body_question">
                        <tr>
                    </tr>
                        </tbody>
                    <tfoot>
                    <tr>
                        <td></td>
                        <td>
                            <input type="button" value="เพิ่มคำถาม" onclick='add_question()' />
                        </td>
                    </tr>
                   </tfoot>
                </table>
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td>
                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Submit" />
            </td>
        </tr>
    </table>
    </div>
  
	<script language='javascript'>
	    $(function () {
	        add_question();
	    });
	    function add_question() {
	        var tb_q = $("#body_question");
	        $("#tb_question > tbody").append('<tr> <td>คำถาม :</td><td><input type="text" name="q[]" id="" /></td><td><a href="#" onclick="deleteme(this)">ลบ</a></td></tr>');

	    }
	    function deleteme(obj) {
	        $(obj).parent().parent().remove();
	    }
	</script>


    </form>
</body>
</html>
