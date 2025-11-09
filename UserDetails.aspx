<%@ Page Title="User Details" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="Hospital.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .page-title {
            color: #007bff;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .search-bar {
            margin-bottom: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mt-4">
        <h3 class="page-title">User Details</h3>

        <div class="search-bar">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Width="250px" Placeholder="Search by name or email"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary mt-2" Text="Search" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" CssClass="btn btn-secondary mt-2" Text="Clear" OnClick="btnClear_Click" />
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped"
            AutoGenerateColumns="False" DataKeyNames="UserID"
            OnRowDeleting="GridView1_RowDeleting" AllowPaging="true"
            OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10">

            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                <asp:CommandField ShowDeleteButton="True" HeaderText="Actions" />
            </Columns>

        </asp:GridView>

        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger mt-2"></asp:Label>
    </div>
</asp:Content>
