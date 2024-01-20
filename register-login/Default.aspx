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

        #title{
            display: block;
            font-size: 1.5em;
            font-weight: bold;
        }

        #btnLogin{
            width: 200px;
            padding: 15px;
            font-size: 16px;
        }

        #btnValidateKey{
            width: 200px;
            padding: 15px;
            font-size: 16px;
        }

        .message-label {
            color: red;
        }

        @media (max-width: 600px) {
            .form-control {
                width: 100%;
            }

            .registration-container {
                text-align: left;
            }

            #btnLogin #btnValidateKey {
                width: 100%;
            }   
        }
    </style>
</head>
<body>
    <form id="form" runat="server" class="form-container">

                <asp:Label ID="title" runat="server">התחברות</asp:Label>
                <br />

                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" Placeholder="אימייל"  required></asp:TextBox>
                <br />

                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" autocomplete="new-password" CssClass="form-control" required></asp:TextBox>
                <br />

                <asp:Button value="btn" OnClick="Login_Click" ID="btnLogin" runat="server" Text="התחברות"/>
                <br />

                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />

                <asp:TextBox runat="server" ID="txtKey" Visible="false" CssClass="form-control" Placeholder="הזן כאן את קוד האימות"></asp:TextBox>
                <br />

                <asp:Button UseSubmitBehavior="false" runat="server" ID="btnValidateKey" Text="אימות" OnClick="BtnValidateKey_Click" Visible="false"/>
                <br />

                <div class="registration-container">
                    <asp:Literal ID="Regiter" runat="server" Text="אין לך חשבון? הירשם" />
                    <asp:LinkButton ID="RegiterLink" runat="server" OnClick="Register_Click" Text="כאן"></asp:LinkButton>
                </div>
    </form>
</body>
</html>
