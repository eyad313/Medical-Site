<%@ Page Language="C#" MasterPageFile="~/Main page_d.Master" AutoEventWireup="true" CodeBehind="PrevTestSearch.aspx.cs" Inherits="WebApplication2.PrevTestSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Previous Tests for this patient
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    
                    <asp:GridView HeaderStyle-CssClass="center" ID="GridView1" class="table table-bordered mx-auto gv"  runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Test Name" HeaderText="Test Name" SortExpression="Test Name" />
                            <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="Selection" ItemStyle-Width="100" ItemStyle-CssClass="center">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:anasConnectionString1 %>" SelectCommand="select test_name as 'Test Name' from report Rp join request Rq on Rp.request_id = Rq.id join sign_up_patient P on P.P_ID = rq.p_id where P.p_id = @P_ID;">
                        <SelectParameters>
                            <asp:SessionParameter Name="P_ID" SessionField="p_id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <textarea id="Textarea" runat="server" style="width: 100%;" rows="4" disabled="disabled" class="mb-2"></textarea>
                    <asp:Button class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button3" runat="server" Text="Cancel" OnClick="cancel"/>
                    &nbsp
                    <asp:Button class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button1" runat="server" Text="Confirm selections" onclick="send"/>
                    &nbsp 
                    <asp:Button class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button2" runat="server" Text="Finish" onclick="finish"/>
                </div>
            </div>
            <div class="card-footer small text-muted">
                <label runat="server" id="message">*Please make sure to confirm your selections before pressing the 'Finish' button.</label>
            </div>
            
        </div>

</asp:Content>
