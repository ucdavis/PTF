<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" Title="PTF | Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript" src="../JS/CollapsibleTable.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate><div id="pages">
    Page Size: 
        <asp:LinkButton ID="lbPageSize10" runat="server" onclick="lbPageSize10_Click">10</asp:LinkButton>
        &nbsp;|&nbsp;
        <asp:LinkButton ID="lbPageSize25" runat="server" onclick="lbPageSize25_Click">25</asp:LinkButton>
        &nbsp;|&nbsp;
        <asp:LinkButton ID="lbPageSize50" runat="server" onclick="lbPageSize50_Click">50</asp:LinkButton>
        &nbsp;|&nbsp;
        <asp:LinkButton ID="lbPageSize100" runat="server" onclick="lbPageSize100_Click">100</asp:LinkButton></div><div class="clear">&nbsp;</div>
    <asp:ListView ID="lvOrders" runat="server" DataSourceID="odsOrders" 
            ondatabound="lvOrders_DataBound" >
        <LayoutTemplate>
            <div class="grid">
                <table id="orders" cellpadding="15" cellspacing="0">
                    <tr class="head">
                        <th class="first"></th>
                        <th>
                            <asp:LinkButton ID="lbSortOrderID" CommandName="Sort" CommandArgument="id" runat="server">Order ID</asp:LinkButton></th>
                        <th>
                            <asp:LinkButton ID="lbSortPI" CommandName="Sort" CommandArgument="PI" runat="server">PI</asp:LinkButton></th>
                        <th>
                            <asp:LinkButton ID="lbSortContactName" CommandName="Sort" CommandArgument="Contact"  runat="server">Contact Name</asp:LinkButton></th>
                        <th>
                            <asp:LinkButton ID="lbSortContactEmail" CommandName="Sort" CommandArgument="ContactEmail"  runat="server">Contact E-mail</asp:LinkButton></th>
                        <th>
                            <asp:LinkButton ID="lbSortContructName" CommandName="Sort" CommandArgument="PIConstructName"  runat="server">Construct Name</asp:LinkButton></th>
                        <th>
                            <asp:LinkButton ID="lbSortPICode" CommandName="Sort" CommandArgument="PICode"  runat="server">PI Code</asp:LinkButton></th>
                        <th>
                            <asp:LinkButton ID="lbSortDateRequested" CommandName="Sort" CommandArgument="DateRequested"  runat="server">Date Requested</asp:LinkButton></th>
                        <th># Constructs</th>
                        <th>
                            <asp:LinkButton ID="lbSortStatus" CommandName="Sort" CommandArgument="Status" runat="server">Status</asp:LinkButton></th>
                    </tr>
                    <tr id="ItemPlaceHolder" runat="server"></tr>
<%--                </table>
                <table id="pager" cellpadding="20" cellspacing="0">--%>
                    <tr class="pager">
                        <asp:DataPager ID="pager" runat="server" PageSize="10">
                            <Fields>
                                <asp:TemplatePagerField OnPagerCommand="PagerCommand">
                                    <PagerTemplate>
                                        <td class="commands" colspan="7">
                                            <asp:ImageButton ID="btnFirst" runat="server" CommandName="First" ImageUrl="~/Images/first.gif" AlternateText="First Page" ToolTip="First Page" />
                                            <asp:ImageButton ID="btnPrevious" runat="server" CommandName="Previous" ImageUrl="~/Images/prev.gif" AlternateText="Previous Page" ToolTip="Previous Page" />    
                                            <asp:ImageButton ID="btnNext" runat="server" CommandName="Next" ImageUrl="~/Images/next.gif" AlternateText="Next Page" ToolTip="Next Page" />
                                            <asp:ImageButton ID="btnLast" runat="server" CommandName="Last" ImageUrl="~/Images/last.gif" AlternateText="Last Page" ToolTip="Last Page" />                                                                                                           
                                        </td>
                                        <td class="info" colspan="3">
                                            Page 
                                            <b>
                                                <%# Container.TotalRowCount > 0 ? Math.Ceiling(((double)(Container.StartRowIndex + Container.MaximumRows) / Container.MaximumRows)) : 0 %>
                                            </b>
                                            of
                                            <b>
                                                <%# Math.Ceiling((double)Container.TotalRowCount / Container.MaximumRows)%>
                                            </b>
                                            (<%# Container.TotalRowCount %> items)  
                                        </td>                                                          
                                    </PagerTemplate>
                                </asp:TemplatePagerField>
                            </Fields>
                        </asp:DataPager>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr id="row" runat="server" class="group">
                <td class="first">
                    <img src="../images/plus.png" onclick="toggleGroup(this, 1, 'orders');" />
                </td>
                <td><a href='<%# "Order.aspx?oid=" + Eval("ID") %>'><%# Eval("ID") %></a></td>
                <td><%# Eval("PI") %></td>
                <td><%# Eval("Contact") %></td>
                <td><%# Eval("ContactEmail") %></td>
                <td><%# Eval("PIConstructName") %></td>
                <td><%# Eval("PICode") %></td>
                <td><%# Eval("DateRequested", "{0:MM/dd/yyyy}") %></td>
                <td><%# Eval("Constructs.Count") %></td>
                <td><%# Eval("Status.Name") %></td>
            </tr>
            <tr id="row" class="item hidden">
                <td class="first"></td>
                <td colspan="9">
                    <asp:ListView ID="lvSubOrders" runat="server" DataSource='<%# Eval("SubOrders") %>'>
                        <LayoutTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr class="head">
                                    <%--<th class="first col1"></th>--%>
                                    <th class="col2"># Plants</th>
                                    <th class="col3">Crop</th>
                                    <th class="col4">Plant Selection</th>
                                    <th class="col5">Genotype</th>
                                    <th class="col6">Constructs</th>
                                </tr>
                                <tr runat="server" id="itemplaceholder"></tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr id="row2" runat="server">
                                <%--<td class="first">
                                </td>--%>
                                <td ><%# Eval("NumberOfPlants") %></td>
                                <td ><%# Eval("Crop.Name") %></td>
                                <td ><%# Eval("PlantSelection.Name") %></td>
                                <td ><%# Eval("Genotype.Name") %></td>
                                <td>
                                    <%# Eval("Constructs.Count") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsOrders" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSorted" 
        TypeName="CAESDO.PTF.BLL.OrderBLL" SortParameterName="propertyName" >
    </asp:ObjectDataSource>
    
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

