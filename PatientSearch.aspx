<%@ Page Title="" Language="C#" MasterPageFile="~/Main page_d.Master" AutoEventWireup="true" CodeBehind="PatientSearch.aspx.cs" Inherits="WebApplication2.PatientSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Patient Search
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button1" runat="server" Text="Search" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" class="table table-bordered mx-auto gv" runat="server" AutoGenerateColumns="False" DataKeyNames="P_ID" DataSourceID="SqlDataSource1" Width="70%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="OnRowCommand">

                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="center" ItemStyle-CssClass="center" ItemStyle-Width="100" DataField="P_ID" HeaderText="Patient ID" ReadOnly="True" SortExpression="P_ID" />
                            <asp:BoundField HeaderStyle-CssClass="center" DataField="Name" HeaderText="Name" SortExpression="fname" />

                            <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="View Profile" ItemStyle-Width="150" ItemStyle-CssClass="center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="ViewLinkbtn" runat="server" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>"><i style="color:#6c757d;" class="fas fa-user-md"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="New Diagnosis" ItemStyle-Width="150" ItemStyle-CssClass="center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="DiagnoseLinkbtn" runat="server" CommandName="Diagnose" CommandArgument="<%# Container.DataItemIndex %>"><i style="color:#6c757d;" class="fas fa-plus"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="Edit Diagnoses" ItemStyle-Width="150" ItemStyle-CssClass="center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditLinkbtn" runat="server" CommandName="Edit" CommandArgument="<%# Container.DataItemIndex %>"><i style="color:#6c757d;" class="fas fa-edit"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:anasConnectionString1 %>" SelectCommand="SELECT [P_ID], CONCAT([fname], ' ', [lname]) AS Name FROM [sign_up_patient] WHERE (([fname] LIKE '%' + @fname + '%') OR ([lname] LIKE '%' + @lname + '%'))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="fname" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="lname" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
            <div class="card-footer small text-muted">
                <label runat="server" id="message"></label>
            </div>
        </div>

        <!-- Page level plugin JavaScript-->
        <script src="vendor/datatables/jquery.dataTables.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Demo scripts for this page-->
        <script src="js/demo/datatables-demo.js"></script>
</asp:Content>
