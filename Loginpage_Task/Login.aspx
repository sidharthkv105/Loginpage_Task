<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Loginpage_Task.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <h2>Login</h2>
    <asp:Label ID="lblUserName" runat="server" Text="Username: "></asp:Label>
    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblPassword" runat="server" Text="Password: " style="text-align: left"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Width="100px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="lnkSignUp" runat="server" NavigateUrl="~/Signup.aspx">Sign Up</asp:HyperLink>
        <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</form>

</body>
</html>
