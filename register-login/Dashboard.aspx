<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="dashboard.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #8D004C;
        }

        #form1 {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .h1-style {
            font-size: 100px;
            color: white;
        }
    </style>
    <script>
        window.onload = function () {
            setInterval(changeColor, 100);

                var label = document.getElementById('<%= Label.ClientID %>');
                var colors = ["red", "green", "blue"];
                var currentColor = label.style.color;

                var nextColor = colors[(colors.indexOf(currentColor) + 1) % colors.length];

                label.style.color = nextColor;
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label" runat="server" Text="Your Text Here" ClientIDMode="Static" CssClass="h1-style"></asp:Label>
        </div>
    </form>
</body>
</html>
