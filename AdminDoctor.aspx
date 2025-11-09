<%@ Page Title="Doctor Appointments" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminDoctor.aspx.cs" Inherits="Hospital.AdminDoctor" %>

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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mt-4">
        <h3 class="page-title">Doctor Appointments</h3>

        <asp:DropDownList ID="ddlDoctor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDoctor_SelectedIndexChanged" CssClass="form-select mb-3">
            <asp:ListItem Text="-- Select Doctor --" Value="" />
        </asp:DropDownList>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"
            AutoGenerateColumns="False" DataKeyNames="BookingID"
            AllowPaging="true" PageSize="10"
            OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:yyyy-MM-dd}" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger mt-2"></asp:Label>
    </div>
</asp:Content>
