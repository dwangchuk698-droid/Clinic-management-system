<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Hospital.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!doctype html>
                <html>
                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <meta name="description" content="">
                    <meta name="author" content=""><title>Medic Care Bootstrap 5 CSS Template</title>

                    <!-- CSS FILES -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
                    <link href="css/bootstrap.min.css" rel="stylesheet">
                    <link href="css/bootstrap-icons.css" rel="stylesheet">
                    <link href="css/owl.carousel.min.css" rel="stylesheet">
                    <link href="css/owl.theme.default.min.css" rel="stylesheet">
                    <link href="css/templatemo-medic-care.css" rel="stylesheet">
                    <!--

TemplateMo 566 Medic Care

https://templatemo.com/tm-566-medic-care

-->
                </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <body>
        <main>
        <nav class="navbar navbar-expand-lg bg-light fixed-top shadow-lg">
            <div class="container">
                <a class="navbar-brand mx-auto d-lg-none" href="index.html">Medic Care <strong class="d-block">Health Specialist</strong> </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item active"><a class="nav-link" href="Home.aspx">Home</a> </li>
                        <li class="nav-item"><a class="nav-link" href="About.aspx">About</a> </li>
                        <li class="nav-item"><a class="nav-link" href="Timeline.aspx">Timeline</a>
                                        </li>

                                        <a class="navbar-brand d-none d-lg-block" href="index.html">Medic Care <strong class="d-block">Health Specialist</strong> </a>
                        <li class="nav-item"><a class="nav-link" href="Testimonials.aspx">Testimonials</a> </li>
                        <li class="nav-item"><a class="nav-link" href="Booking.aspx">Booking</a> </li>
                        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a> </li>
                    </ul>
                </div>
            </div>
        </nav>
            <center>
        <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f6f9ff 0%, #eef6ff 100%);
            color: #1f2937;
        }
        .card {
            width: 520px;
            max-width: 96%;
            background: #fff;
            border-radius: 14px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            transition: all .2s ease;
        }
        .card:hover { transform: translateY(-5px); box-shadow: 0 15px 35px rgba(0,0,0,0.15); }
        h2 { margin: 0 0 15px 0; font-size: 22px; font-weight: 600; color: #0f172a; }
        .form-group { margin-bottom: 15px; }
        .field-label { display:block; margin-bottom:6px; font-size:14px; font-weight:500; color:#374151; }
        .input {
            width:100%; padding:12px 14px;
            border-radius:10px; border:1px solid #e5e7eb;
            font-size:14px; background:#f9fafb;
            transition:all 0.2s ease; outline:none;
        }
        .input:focus { border-color:#3b82f6; background:#fff; box-shadow:0 0 0 3px rgba(59,130,246,0.25); }
        textarea.input { min-height: 100px; resize: vertical; }
        .btn {
            width:100%; padding:12px;
            background:linear-gradient(90deg,#10b981,#059669);
            border:none; border-radius:10px; color:#fff;
            font-size:15px; font-weight:600; cursor:pointer;
            transition:transform 0.2s ease, box-shadow 0.2s ease;
        }
        .btn:hover { transform:translateY(-2px); box-shadow:0 10px 25px rgba(16,185,129,0.3); }
        lblMsg.ClientID { display:block; margin-bottom:12px; font-size:14px; font-weight:500; min-height:20px; }
    </style>
    <div id="form1">
        <div class="card">
            <h2>Book Appointment</h2>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>

            <div class="form-group">
                <asp:Label ID="lblName" runat="server" CssClass="field-label" Text="Patient Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="input" Placeholder="Enter patient name"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" CssClass="field-label" Text="Email:"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input" Placeholder="Enter email"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblMobile" runat="server" CssClass="field-label" Text="Mobile:"></asp:Label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="input" Placeholder="Enter mobile no."></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblDoctor" runat="server" CssClass="field-label" Text="Select Doctor:"></asp:Label>
                <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="input">
                    <asp:ListItem Text="-- Select Doctor --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Dr. Dorji (Cardiologist)" Value="Dr. Smith"></asp:ListItem>
                    <asp:ListItem Text="Dr. Ajay (Dentist)" Value="Dr. Johnson"></asp:ListItem>
                    <asp:ListItem Text="Dr. Rohit (Orthopedic)" Value="Dr. Sharma"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblDate" runat="server" CssClass="field-label" Text="Appointment Date:"></asp:Label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="input" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" CssClass="field-label" Text="Message:"></asp:Label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="input" TextMode="MultiLine" Placeholder="Enter your message (optional)"></asp:TextBox>
            </div>

            <asp:Button ID="btnBook" runat="server" CssClass="btn" Text="Book Appointment" OnClick="btnBook_Click" />
        </div>
    </div>
                </center>
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <footer class="site-footer section-padding" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 me-auto col-12">
                    <h5 class="mb-lg-4 mb-3">Opening Hours</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex">Sunday : Closed </li>
                        <li class="list-group-item d-flex">Monday, Tuesday - Firday <span>8:00 AM - 3:30 PM</span> </li>
                        <li class="list-group-item d-flex">Saturday <span>10:30 AM - 5:30 PM</span> </li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 col-12 my-4 my-lg-0">
                    <h5 class="mb-lg-4 mb-3">Our Clinic</h5>
                    <p>
                        <a href="mailto:hello@company.co">hello@company.co</a>
                    <p>
                    <p>
                        123 Digital Art Street, San Diego, CA 92123</p>
                </div>
                <div class="col-lg-3 col-md-6 col-12 ms-auto">
                    <h5 class="mb-lg-4 mb-3">Socials</h5>
                    <ul class="social-icon">
                        <li><a href="#" class="social-icon-link bi-facebook"></a></li>
                        <li><a href="#" class="social-icon-link bi-twitter"></a></li>
                        <li><a href="#" class="social-icon-link bi-instagram"></a></li>
                        <li><a href="#" class="social-icon-link bi-youtube"></a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-12 ms-auto mt-4 mt-lg-0">
                    <p class="copyright-text">
                        Copyright © Medic Care 2021
                        <br>
                        <br>Design: <a href="https://templatemo.com" target="_parent">TemplateMo</a>
                    </p>
                </div>
            </div>
                    </section>
                </footer>

                <!-- JAVASCRIPT FILES -->
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.bundle.min.js"></script>
                <script src="js/owl.carousel.min.js"></script>
                <script src="js/scrollspy.min.js"></script>
                <script src="js/custom.js"></script>
                <!--

TemplateMo 566 Medic Care

https://templatemo.com/tm-566-medic-care

-->
</body>
</html>
</asp:Content>

