<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="TARPWEB.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        body
        {
            background-image:url(/back.jpg);
            background-repeat:no-repeat;
            background-size:auto;
        }
    </style>

 <script type="text/javascript">
     function validate() {
         var Firstname = document.getElementById('<%=fname.ClientID %>').value;
         var LastName = document.getElementById('<%=lname.ClientID %>').value;
         var Email = document.getElementById('<%=logemail.ClientID %>').value;
         var Pass = document.getElementById('<%=pass.ClientID %>').value;
         var Rpass = document.getElementById('<%=rpass.ClientID %>').value;
         if (Firstname == "") {
             alert("Please Enter Your First Name");
             document.getElementById('<%=fname.ClientID %>').focus();
             return false;
         }
         if (LastName == "") {
             alert("Please Enter Your Last Name");
             document.getElementById('<%=lname.ClientID %>').focus();
             return false;
         }
         if (Email == "") {
             alert("Please Enter Your Email Address");
             document.getElementById('<%=logemail.ClientID %>').focus();
             return false;
         }
         var emailPat = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
         var EmailmatchArray = Email.match(emailPat);
         if (EmailmatchArray == null) {
             alert("Please Enter a Valid Email Address");
             document.getElementById('<%=logemail.ClientID %>').focus();
             return false;
         }
         if (Pass == "") {
             alert("Please Enter Your Password");
             document.getElementById('<%=pass.ClientID %>').focus();
             return false;
         }
         if (Rpass == "") {
             alert("Please Re-Enter Your Password");
             document.getElementById('<%=rpass.ClientID %>').focus();
             return false;
         }
         if (Rpass != Pass) {
             alert("Please Confirm Re-Entered Password");
             document.getElementById('<%=rpass.ClientID %>').focus();
             return false;
         }
     }
</script>

    <br/>
    <div style="text-align:center;">
    <div class="demo-card-wide mdl-card mdl-shadow--16dp"style="width:700px;display:inline-block;">
        
            <div class="mdl-shadow--16dp" style="background-color:orange;">
                <br>
                <div class="mdl-typography--title"><b>Create Account</b></div>
                <br>
            </div>
            <div class="mdl-shadow--16dp" style="background-color:#000000">
                <br>
                <div class="mdl-typography--title" style="color:#ffffff"><b>Name</b></div>
                <br>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="fname" runat="server" CssClass="mdl-textfield__input" onFocus="this.placeholder='';" onBlur="this.placeholder='First Name';" placeholder="First Name"></asp:TextBox>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="lname" runat="server" placeholder="Last Name" CssClass="mdl-textfield__input" onFocus="this.placeholder='';" onBlur="this.placeholder='Last Name';"></asp:TextBox>
            </div>
            <div class="mdl-shadow--16dp" style="background-color:#000000">
                <br>
                <div class="mdl-typography--title" style="color:#ffffff">Email Id</div>
                <br>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="logemail" runat="server" placeholder="Email" CssClass="mdl-textfield__input" Width="299px" onFocus="this.placeholder='';" onBlur="this.placeholder='Email Id';"></asp:TextBox>
                </div>
            <br>
            <div class="mdl-shadow--16dp" style="background-color:#000000">
                <br>
                <div class="mdl-typography--title" style="color:#ffffff">Password</div>
                <br>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox TextMode="Password" ID="pass" runat="server" placeholder="Password" CssClass="mdl-textfield__input" onFocus="this.placeholder='';" onBlur="this.placeholder='Password';"></asp:TextBox>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox TextMode="Password" ID="rpass" runat="server" placeholder="Re-Enter Password" CssClass="mdl-textfield__input" onFocus="this.placeholder='';" onBlur="this.placeholder='Re-Enter Password';"></asp:TextBox>
                
            </div>
            <br />
            <div class="mdl-shadow--16dp" style="background-color:#000000"><br>
                <asp:Button ID="Button1" runat="server" Text="Sign Up" BorderStyle="Groove" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" OnClientClick="return validate();" OnClick="Button1_Click"></asp:Button>
                <br><br>
            </div>
    </div>
    </div>

</asp:Content>
