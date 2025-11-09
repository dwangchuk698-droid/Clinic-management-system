<%@ Page Title="Booking Details" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminBookings.aspx.cs" Inherits="Hospital.AdminBookings" %>

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

        .search-bar {
            margin-bottom: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mt-4">
        <h3 class="page-title">Booking Details</h3>

        <div class="search-bar">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Width="250px" Placeholder="Search by Patient or Doctor"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mt-2" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary mt-2" OnClick="btnClear_Click" />
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped"
            AutoGenerateColumns="False" DataKeyNames="BookingID"
            AllowPaging="true" PageSize="10"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowDeleting="GridView1_RowDeleting">

            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                <asp:BoundField DataField="Doctor" HeaderText="Doctor" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:BoundField DataField="CreatedDate" HeaderText="Created" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                <asp:CommandField ShowDeleteButton="True" HeaderText="Action" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger mt-2"></asp:Label>
    </div>
</asp:Content>
