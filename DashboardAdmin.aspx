<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DashboardAdmin.aspx.cs" Inherits="Hospital.DashboardAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            padding: 40px;
        }

        .card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            transition: 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            color: #007BFF;
            margin-bottom: 15px;
        }

        .btn-view {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-view:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="text-primary mb-4">Admin Dashboard</h2>

        <div class="dashboard">
            <div class="card">
                <h3>User Details</h3>
                <asp:Button ID="btnUsers" runat="server" Text="View Users" CssClass="btn-view" OnClick="btnUsers_Click" />
            </div>

            <div class="card">
                <h3>Booking Reports</h3>
                <asp:Button ID="btnBooking" runat="server" Text="View Reports" CssClass="btn-view" OnClick="btnBooking_Click" />
            </div>

            <div class="card">
                <h3>Contact Reports</h3>
                <asp:Button ID="btnContacts" runat="server" Text="View Contacts" CssClass="btn-view" OnClick="btnContacts_Click" />
            </div>

            <div class="card">
                <h3>Testimonials</h3>
                <asp:Button ID="btnTestimonials" runat="server" Text="View Testimonials" CssClass="btn-view" OnClick="btnTestimonials_Click" />
            </div>
        </div>
    </div>
</asp:Content>
