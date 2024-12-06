<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Loginpage_Task.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <h2>Registration</h2>
        <asp:Label ID="lblUserName" runat="server" Text="Username: "></asp:Label>
    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="lblPhone" runat="server" Text="Phone: "></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <br />
        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" 
        ValidationGroup="G1" />
    
        <br />
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <br />
    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" 
        ErrorMessage="Username is required." ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
        <br />
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
        ErrorMessage="Email is required." ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
        <br />
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
        ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
        ErrorMessage="Invalid email format." ValidationGroup="G1"></asp:RegularExpressionValidator>
        <br />
    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
        ErrorMessage="Phone number is required." ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
        <br />
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
        ErrorMessage="Password is required." ForeColor="Red" ValidationGroup="G1"></asp:RequiredFieldValidator>
    
    <br />
    <br />
</form>



</body>
</html>
