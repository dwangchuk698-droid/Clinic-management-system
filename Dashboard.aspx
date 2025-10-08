<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Hospital.Dashboard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>ClinicAdmin - Dashboard</title>
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <style>

                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        }

                        :root {
                            --primary: #2a5bd7;
                            --secondary: #4caf50;
                            --light: #f8f9fa;
                            --dark: #343a40;
                            --gray: #6c757d;
                            --danger: #dc3545;
                            --warning: #ffc107;
                            --info: #17a2b8;
                        }

                        body {
                            background-color: #f5f7fb;
                            color: #333;
                            display: flex;
                            min-height: 100vh;
                        }

                        /* Sidebar Navigation */
                        .sidebar {
                            width: 250px;
                            background: var(--primary);
                            color: white;
                            transition: all 0.3s;
                            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
                        }

                        .sidebar-header {
                            padding: 20px;
                            background: rgba(0, 0, 0, 0.2);
                            text-align: center;
                        }

                            .sidebar-header h2 {
                                font-size: 1.5rem;
                                margin: 0;
                            }

                        .sidebar-menu {
                            padding: 10px 0;
                        }

                            .sidebar-menu ul {
                                list-style: none;
                                padding: 0;
                            }

                            .sidebar-menu li {
                                margin: 5px 0;
                            }

                            .sidebar-menu a {
                                color: white;
                                text-decoration: none;
                                display: flex;
                                align-items: center;
                                padding: 12px 20px;
                                transition: all 0.3s;
                            }

                                .sidebar-menu a:hover {
                                    background: rgba(255, 255, 255, 0.1);
                                    border-left: 4px solid white;
                                }

                            .sidebar-menu i {
                                margin-right: 10px;
                                font-size: 18px;
                            }

                        .active {
                            background: rgba(255, 255, 255, 0.15);
                            border-left: 4px solid var(--warning);
                        }

                        /* Main Content */
                        .main-content {
                            flex: 1;
                            display: flex;
                            flex-direction: column;
                        }

                        /* Header */
                        .header {
                            background: white;
                            padding: 15px 30px;
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                        }

                        .user-info {
                            display: flex;
                            align-items: center;
                        }

                            .user-info img {
                                width: 40px;
                                height: 40px;
                                border-radius: 50%;
                                margin-right: 10px;
                                object-fit: cover;
                            }

                        /* Content Area */
                        .content {
                            padding: 20px;
                            flex: 1;
                            overflow-y: auto;
                        }

                        .page-title {
                            margin-bottom: 20px;
                            color: var(--dark);
                            font-size: 1.8rem;
                        }

                        /* Dashboard Cards */
                        .card-grid {
                            display: grid;
                            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                            gap: 20px;
                            margin-bottom: 30px;
                        }

                        .card {
                            background: white;
                            border-radius: 8px;
                            padding: 20px;
                            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                            transition: transform 0.3s;
                        }

                            .card:hover {
                                transform: translateY(-5px);
                            }

                        .card-header {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            margin-bottom: 15px;
                        }

                        .card-title {
                            font-size: 1rem;
                            color: var(--gray);
                        }

                        .card-icon {
                            width: 50px;
                            height: 50px;
                            border-radius: 50%;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 1.5rem;
                        }

                        .card-content {
                            font-size: 1.8rem;
                            font-weight: bold;
                            color: var(--dark);
                        }

                        .card-footer {
                            margin-top: 10px;
                            font-size: 0.9rem;
                            color: var(--gray);
                        }

                        /* Tables */
                        .table-container {
                            background: white;
                            border-radius: 8px;
                            padding: 20px;
                            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                            margin-bottom: 20px;
                            overflow-x: auto;
                        }

                       
                        .status {
                            padding: 5px 10px;
                            border-radius: 20px;
                            font-size: 0.8rem;
                            font-weight: 500;
                        }

                        .status-confirmed {
                            background: #e8f5e9;
                            color: var(--secondary);
                        }

                        .status-pending {
                            background: #fff8e1;
                            color: var(--warning);
                        }

                        .status-cancelled {
                            background: #ffebee;
                            color: var(--danger);
                        }

                        /* Footer */
                        .footer {
                            background: var(--dark);
                            color: white;
                            text-align: center;
                            padding: 15px;
                            margin-top: auto;
                        }

                        /* Responsive */
                        @media (max-width: 168px) {
                            .sidebar {
                                width: 70px;
                            }

                                .sidebar .menu-text {
                                    display: none;
                                }

                            .sidebar-header h2 {
                                font-size: 1rem;
                            }

                            .card-grid {
                                grid-template-columns: 1fr;
                            }
                        }
                    </style>
                </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <body>
                    <!-- Sidebar Navigation -->
                    <div class="sidebar">
                        <div class="sidebar-header">
                            <h2><i class="fas fa-clinic-medical"></i><span class="menu-text">ClinicAdmin</span></h2>
                        </div>
                        <div class="sidebar-menu">
                            <ul>
                                <li><a href="#" class="active"><i class="fas fa-home"></i><span class="menu-text">Dashboard</span></a></li>
                                <li><a href="#"><i class="fas fa-calendar-check"></i><span class="menu-text">Appointments</span></a></li>
                                <li><a href="#"><i class="fas fa-user-injured"></i><span class="menu-text">Patients</span></a></li>
                                <li><a href="#"><i class="fas fa-user-md"></i><span class="menu-text">Doctors</span></a></li>
                                <li><a href="#"><i class="fas fa-pills"></i><span class="menu-text">Medicines</span></a></li>
                                <li><a href="#"><i class="fas fa-file-invoice"></i><span class="menu-text">Billing</span></a></li>
                                <li><a href="#"><i class="fas fa-chart-bar"></i><span class="menu-text">Reports</span></a></li>
                                <li><a href="#"><i class="fas fa-cog"></i><span class="menu-text">Settings</span></a></li>
                                <li><a href="#"><i class="fas fa-sign-out-alt"></i><span class="menu-text">Logout</span></a></li>
                            </ul>
                        </div>
        </div>

               
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder3">
                <!-- Footer -->
                <div class="footer">
                    <p>
                        © 2023 ClinicAdmin - All Rights Reserved</p>
    </div>
        </div>

        <script>
            // Simple JavaScript for interactivity
            document.addEventListener('DOMContentLoaded', function () {
                // Highlight active menu item on click
                const menuItems = document.querySelectorAll('.sidebar-menu a');
                menuItems.forEach(item => {
                    item.addEventListener('click', function () {
                        menuItems.forEach(i => i.classList.remove('active'));
                        this.classList.add('active');
                    });
                });

                // Display current date in the dashboard
                const today = new Date();
                const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
                document.getElementById('current-date').textContent = today.toLocaleDateString('en-IN', options);
            });
        </script>
</body>
</html>
</asp:Content>

