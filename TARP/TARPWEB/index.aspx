<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableSessionState="True" CodeBehind="index.aspx.cs" Inherits="TARPWEB.index" %>

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
        var Login = document.getElementById('<%=loginid.ClientID %>').value;
        var Password = document.getElementById('<%=password.ClientID %>').value;

        if (Login == "") 
        {
            alert("Please Enter Your Login ID");
            document.getElementById('<%=loginid.ClientID %>').focus();
            return false;
        }
        if (Password == "") 
        {
            alert("Please Enter Your Password");
            document.getElementById('<%=password.ClientID %>').focus();
            return false;
        }
    }
    </script>

    <div class="jumbotron">
        <h3>SafeRoutes</h3>
        <p class="lead">This WebApp provides safest route between your Source and Destination based on certain criteria like No of Police Station on Routes,No of Street Lights, Crime Rate of that route etc..</p>
        <p><a href="/About" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>
    <div style="text-align:center;">

        <div style="display:inline-block;">
                <div class="demo-card-wide mdl-card mdl-shadow--16dp">
                    <div class="login">
                        <div class="mdl-shadow--16dp" style="background-color:#000000">
                            <br>
                            <div class="mdl-typography--title" style="color:#ffffff"><center>Log In</center></div>
                            <br>
                        </div><br><br>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="loginid" runat="server" CssClass="mdl-textfield__input" onFocus="this.placeholder='';" onBlur="this.placeholder='Login Id/Email ID';" placeholder='Login Id/Email ID'></asp:TextBox>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="password" TextMode="Password" runat="server" CssClass="mdl-textfield__input"  onFocus="this.placeholder='';" onBlur="this.placeholder='Password';" placeholder='Password'></asp:TextBox>
                        </div><br><br>
                        <asp:Label ID="Label1" ForeColor="Red" runat="server" Text="Incorrect Credentials! Try Again."></asp:Label>
                    </div>
                    <div class="mdl-shadow--16dp" style="background-color:#000000"><br>
                        <asp:Button ID="Button1" runat="server" Text="Login" BorderStyle="Groove" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" OnClientClick = "return validate();" OnClick="Button1_Click"></asp:Button>
                        &nbsp&nbsp
                        <asp:Button ID="Button2" runat="server" Text="Sign Up" BorderStyle="Groove" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" OnClick="Button2_Click"></asp:Button>
                        <br><br>
                    </div>
                </div>
        </div>
    </div>
    <script>
        function myMap() {
            var mapProp= {
                center:new google.maps.LatLng(12.8406669,80.1525185),
                zoom:17,
            };
            var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
        }
    </script>


</asp:Content>