<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="login_user.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            background-color: #8D004C;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        #formContainer {
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
            max-width: 400px;
            width: 100%;
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

        #login {
            width: 200px;
            padding: 15px;
            font-size: 16px;
        }

        .message-label {
            color: white;
        }

        @media (max-width: 600px) {
            /* Responsive styles for smaller screens */
            .form-control {
                width: 100%;
            }

            .registration-container {
                text-align: left; /* Adjust for smaller screens if needed */
            }

            #login {
                width: 100%; /* Make the button full width on smaller screens */
            }   
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="formContainer" runat="server">
            <div class="form-container">
                <h2>התחברות</h2>

                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" Placeholder="אימייל" required></asp:TextBox>
                <br />

                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" autocomplete="new-password" CssClass="form-control" required></asp:TextBox>
                <br />

                <div class="registration-container">
                    <span>אין לך חשבון? הירשם</span>
                    <asp:LinkButton ID="RegiterLink" runat="server" OnClick="Register_Click" Text="כאן"></asp:LinkButton>
                </div>
                <br />

                <asp:Button value="btn" OnClick="Login_Click" ID="login" runat="server" Text="התחברות"/>
                <br />

                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />

                <asp:Label ID="LabelKey" runat="server" Visible="false"></asp:Label>
                <br />

                <asp:TextBox runat="server" ID="txtKey" Visible="false" />
                <br />

                <asp:Button UseSubmitBehavior="false" runat="server" ID="btnValidateKey" Text="Show Alert" OnClick="BtnValidateKey_Click" Visible="false"/>
                <br />

            </div>
        </div>
    </form>
</body>
</html>
