<%@ Page Language="C#" MasterPageFile="~/Main page_d.Master" AutoEventWireup="true" CodeBehind="EditDiagnosis.aspx.cs" Inherits="WebApplication2.EditDiagnosis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Patient's medical history
            </div>
            <div class="card-body">
                <pre><asp:TextBox ID="TextBox5" runat="server" disabled="disabled"></asp:TextBox>   <asp:TextBox ID="TextBox1" runat="server" disabled="disabled"></asp:TextBox>   <asp:TextBox ID="TextBox2" runat="server" disabled="disabled"></asp:TextBox>    <asp:TextBox ID="TextBox6" runat="server" disabled="disabled"></asp:TextBox>    <asp:TextBox ID="TextBox3" runat="server" MaxLength="30"></asp:TextBox></pre>
                <hr />
                <asp:GridView ID="GridView1" class="table table-bordered gv align-content-center" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="100%" OnRowCommand="OnRowCommand" OnRowDataBound="OnRowDataBound">
                    <Columns>
                        <asp:BoundField ItemStyle-Wrap="false" ItemStyle-VerticalAlign="Middle" HeaderStyle-CssClass="center" DataField="Doctor" HeaderStyle-Wrap="false" HeaderText="Doctor ID-Name" InsertVisible="False" ReadOnly="True" SortExpression="D_ID" />
                        <asp:BoundField HeaderStyle-CssClass="center" DataField="ID" HeaderStyle-Wrap="false" HeaderText="Diagnosis ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" /> 
                        <asp:BoundField HeaderStyle-CssClass="center" DataField="Complain" ItemStyle-Wrap="false" HeaderText="Complain" SortExpression="Complain" />
                        <asp:BoundField ItemStyle-Wrap="false" HeaderStyle-CssClass="center" DataField="Diagnosis" HeaderText="Diagnosis" SortExpression="Diagnosis" />
                        <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="Edit" ItemStyle-CssClass="center" ItemStyle-Width="1%">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditLinkbtn" runat="server" CommandName="Edit" CommandArgument="<%# Container.DataItemIndex %>"><i style="color:#6c757d;" class="fas fa-edit" ></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:anasConnectionString1 %>" SelectCommand="SELECT [ID], CONCAT([diagnosis].[D_ID], '-', 'Dr. ', [fname], ' ', [lname]) AS Doctor, [Complain], CONCAT(SUBSTRING([Diagnosis], 0, 45), '...') AS Diagnosis FROM [diagnosis] INNER JOIN [sign_up_doctor] ON [diagnosis].[D_ID] = [sign_up_doctor].[D_ID] WHERE ([P_ID] = @P_ID) ORDER BY Doctor DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="P_ID" SessionField="p_id" Type="Int32" />
                        <asp:SessionParameter Name="D_ID" SessionField="user_id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <textarea id="TextArea1" rows="10" style="width: 100%;" runat="server"></textarea>
                <p>
                    <asp:Button class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button2" runat="server" Text="Back" />
                    &nbsp;
                    <asp:Button OnClick="Confirm" class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button1" runat="server" Text="Confirm Edit" />
                </p>

            </div>

        </div>
</asp:Content>
