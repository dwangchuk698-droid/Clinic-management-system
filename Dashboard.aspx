<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Hospital.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Include Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f5f7fb;
            font-family: 'Segoe UI', sans-serif;
        }

        .dashboard-container {
            padding: 40px;
        }

        .dashboard-title {
            font-size: 28px;
            font-weight: bold;
            color: #007BFF;
            text-align: center;
            margin-bottom: 40px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
        }

        .card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 30px 20px;
            transition: 0.3s ease;
            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        }

        .card i {
            font-size: 40px;
            color: #007BFF;
            margin-bottom: 15px;
        }

        .card h4 {
            margin: 10px 0;
            color: #333;
        }

        .card p {
            color: #666;
            font-size: 14px;
        }
    </style>
</asp:Content>


