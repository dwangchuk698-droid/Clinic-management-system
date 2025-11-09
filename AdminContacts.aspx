<%@ Page Title="Contact Messages" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminContacts.aspx.cs" Inherits="Hospital.AdminContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .page-title {
            color: #007bff;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .search-box {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .search-box input {
            flex: 1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mt-4">
        <h3 class="page-title">Contact Messages</h3>

        <div class="search-box">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Name or Subject"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" OnClick="btnClear_Click" />
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"
            AutoGenerateColumns="False" DataKeyNames="ContactID"
            AllowPaging="true" PageSize="10"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="ContactID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:BoundField DataField="CreatedDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:CommandField ShowDeleteButton="True" HeaderText="Action" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
    </div>
</asp:Content>
