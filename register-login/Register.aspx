<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="register_user.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <style>
        body {
            background-color: #8D004C;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .form-control {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .registration-container {
            text-align: right;
            margin-top: 10px;
        }

        #btnregister {
            width: 200px;
            padding: 15px;
            font-size: 16px;
        }

        .message-label {
            color: white;
        }

        .form-container h2 {
            margin-bottom: 20px;
        }

        @media (max-width: 600px) {
            .form-control {
                width: 100%;
            }
            .registration-container {
                text-align: left; /* Adjust for smaller screens if needed */
            }

            #btnregister {
                width: 100%; /* Make the button full width on smaller screens */
            }   
        }
    </style>
</head>
<body>
    <form id="form2" runat="server" class="form-container">
        <h2>הרשמה</h2>

        <asp:TextBox ID="txtFirstname" runat="server" Placeholder="שם פרטי" required="true" CssClass="form-control"></asp:TextBox>
        <br />

        <asp:TextBox ID="txtLastname" runat="server" Placeholder="שם משפחה" required CssClass="form-control"></asp:TextBox>
        <br />

        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" Placeholder="אימייל" required></asp:TextBox>
        <br />

        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" autocomplete="new-password" required CssClass="form-control"></asp:TextBox>
        <br />

        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Placeholder="ConfirmPassword" autocomplete="new-password" required CssClass="form-control"></asp:TextBox>
        <br />

        <div class="registration-container">
            <span>להתחברות לחץ</span>
            <asp:LinkButton ID="LoginLink" runat="server" OnClick="Login_Click" Text="כאן"></asp:LinkButton>
        </div>
        <br />

        <asp:Button ID="btnregister" runat="server" OnClick="Register_Click" Text="הרשמה" />

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
    </form>
</body>
</html>
