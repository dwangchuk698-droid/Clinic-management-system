<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hospital.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>

    <!-- Optional: Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', system-ui, -apple-system, "Segoe UI", Roboto, Arial;
            background: linear-gradient(135deg, #f6f9ff 0%, #eef6ff 100%);
            color: #1f2937;
        }

        .card {
            width: 440px;
            max-width: 92%;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(20, 35, 70, 0.08);
            padding: 28px;
            border: 1px solid rgba(30,41,59,0.03);
            transition: transform .18s ease, box-shadow .18s ease;
        }
        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 18px 40px rgba(20, 35, 70, 0.12);
        }

        h2 {
            margin: 0 0 14px 0;
            font-size: 20px;
            font-weight: 600;
            color: #0f172a;
        }

        .form-group {
            margin-bottom: 14px;
        }

        label.field-label {
            display: block;
            margin-bottom: 6px;
            font-size: 13px;
            color: #374151;
            font-weight: 500;
        }

        .input {
            width: 100%;
            padding: 11px 14px;
            border-radius: 10px;
            border: 1px solid #e6e9ef;
            outline: none;
            font-size: 14px;
            transition: box-shadow .15s ease, border-color .15s ease, transform .08s ease;
            background: linear-gradient(180deg, #fff, #fbfdff);
            box-sizing: border-box;
        }

        .input:focus {
            border-color: #3b82f6;
            box-shadow: 0 6px 18px rgba(59,130,246,0.12);
            transform: translateY(-1px);
        }

        .btn {
            display: inline-block;
            width: 100%;
            padding: 11px 16px;
            border-radius: 10px;
            border: none;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            background: linear-gradient(90deg,#16a34a,#059669);
            color: #fff;
            box-shadow: 0 8px 24px rgba(22,163,74,0.18);
            transition: transform .12s ease, box-shadow .12s ease, opacity .12s ease;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 16px 40px rgba(22,163,74,0.22);
            opacity: 0.98;
        }

        .btn:active {
            transform: translateY(-1px) scale(.998);
        }

        #<%= lblMsg.ClientID %> {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            color: #e11d48;
            min-height: 18px;
        }

        .small-link {
            display: inline-block;
            margin-top: 12px;
            font-size: 13px;
            color: #2563eb;
            text-decoration: none;
            transition: color .12s ease, transform .12s ease;
        }

        .small-link:hover {
            color: #1e40af;
            transform: translateY(-2px);
        }

        @media (max-width: 480px) {
            .card { padding: 20px; border-radius: 10px; }
            h2 { font-size: 18px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h2>User Registration</h2>

            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            <br />

            <div class="form-group">
                <asp:Label ID="lblName" runat="server" CssClass="field-label" Text="Full Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="input" Placeholder="Enter your full name"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" CssClass="field-label" Text="Email:"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input" Placeholder="Enter your email"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" CssClass="field-label" Text="Password:"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" Placeholder="Enter password"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblMobile" runat="server" CssClass="field-label" Text="Mobile No:"></asp:Label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="input" Placeholder="Enter mobile number"></asp:TextBox>
            </div>

            <asp:Button ID="btnRegister" runat="server" CssClass="btn" Text="Register" OnClick="btnRegister_Click" />

            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="Login.aspx" CssClass="small-link">Already have an account? Login</asp:HyperLink>
        </div>
    </form>
</body>
</html>
