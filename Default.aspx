﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Techtrishna 2015</title>
    <meta name="description" content="Techtrishna is the annual techfest of AKGEC Ghaziabad" />
    <meta name="keywords" content="techtrishna, akgec" />
    <meta name="author" content="Software Incubator" />
    <meta property="og:title" content="Techtrishna 2015" />
    <meta property="og:type" content="activity" />
    <meta property="og:url" content="https://www.facebook.com/techtrishna.akgec" />
    <meta property="og:image" content="http://www.techtrishna.in/tt_logo" />
    <meta property="og:site_name" content="Techtrishna 2015" />
    <meta property="fb:admins" content="100001023093722" />


    <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <link href="http://fonts.googleapis.com/css?family=Dosis|Open+Sans" rel="stylesheet" type="text/css" />
    <link href="stylesheets/hover-min.css" rel="stylesheet" />
    <link href="stylesheets/animations.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css' />
    <!--<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>-->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="stylesheets/normalize-min.css" />
    <link href="stylesheets/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="stylesheets/bootstrap.min.css" />
    <link rel="stylesheet" href="stylesheets/main.css" />
    <link rel="stylesheet" href="stylesheets/mystylesheet.css" />
    <link href="stylesheets/mu.css" rel="stylesheet" />

    <!-- MAIN FAVICON -->
    <link rel="icon" href="img/tt-favicon.png" type="image/x-icon" />

    <!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

    <style type="text/css">
        /* Set a size for our map container, the Google Map will take up 100% of this container */
        #map {
            width: 310px;
            height: 230px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="fb-root"></div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=144923822270787";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>

        <div id='loader' class='fd-loader' style='position: fixed; width: 100%; height: 100%; top: 0; left: 0; z-index: 50; background: #041527 url("img/bg-main.png") 0 0 repeat;'>
            <span class='floating' style='position: fixed; top: 40%; left: 48%; z-index: 51; width: 180px; margin-left: -68px; margin-top: -64px; height: 200px; background-size: cover; background: url("img/logo-top.png") 0 0 no-repeat;'></span>
            <div class='cow' style='position: fixed; top: 68%; margin-top: -42px; left: 48%; z-index: 49; width: 339px; margin-left: -153px; height: 100px; background: url("img/logo-bottom.png") 0 0 no-repeat;'></div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span style="color: white; font-size: 39px; font-weight: 100;" aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div id="login_modal" class="container">
                                    <div class="row">
                                        <div class="col-md-12" style="border-bottom: 1px solid #fff;">
                                            <h2>Registration for TechTrishna'15</h2>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div id="registerPartition" class="col-md-6">
                                            <h2>Registration</h2>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:DropDownList CssClass="form-control" ToolTip="Select Your College" ID="DDLCollege" AutoPostBack="true" OnSelectedIndexChanged="DDLCollege_SelectedIndexChanged" DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true" runat="server">
                                                            <asp:ListItem Value="1" Text="Ajay Kumar Garg Engineering College"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" runat="server" id="RowCollege" visible="false">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TxtBxCollege" ToolTip="Enter your college name" placeholder="Your College Name" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="register" ControlToValidate="TxtBxCollege" ID="RFVCollege" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row" runat="server" id="RowStudentNo">
                                                <div class="col-md-11">
                                                    <div class="form-group" runat="server" id="Div1">
                                                        <asp:TextBox CssClass="form-control" ID="TxtBxStudentNo" ToolTip="Enter Your Student Number" placeholder="Student Number" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="register" ID="RFVStudentNo" runat="server" ControlToValidate="TxtBxStudentNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <%--<asp:RegularExpressionValidator ID="REVStudentNo" runat="server" ControlToValidate="TxtBxStudentNo" ValidationExpression="\d{7}[d|D|l|L]?" ErrorMessage="*"></asp:RegularExpressionValidator>--%>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TxtBxName" ToolTip="Enter Your Name" placeholder="Name" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="register" ID="RFVName" runat="server" ControlToValidate="TxtBxName" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TxtBxEmail" ToolTip="Enter Your Email" placeholder="Email" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="register" ID="RFVEmail" ControlToValidate="TxtBxEmail" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ValidationGroup="register" ID="REVEmail" ControlToValidate="TxtBxEmail" runat="server" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TxtBxContactNo" ToolTip="Enter 10 digit Contact Number" placeholder="Contact Number" Text="" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RegularExpressionValidator ValidationGroup="register" ID="REVContactNo" runat="server" ValidationExpression="[7|8|9]\d{9}" ControlToValidate="TxtBxContactNo" ErrorMessage="*"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ValidationGroup="register" ID="RFVContactNo" ControlToValidate="TxtBxContactNo" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row" runat="server" id="rowPartnerID" visible="false">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TxtBxPartnerID" ToolTip="Enter Partner ID like TT1234" placeholder="Partner ID like TT1234" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RegularExpressionValidator ValidationGroup="register" ID="REVPartnerID" ValidationExpression="[T|t][T|t]\d{4}" ControlToValidate="TxtBxPartnerID" runat="server" ErrorMessage="*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" TextMode="Password" ToolTip="Enter Password" ID="TxtBxPassword" placeholder="Password" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="register" ID="RFVPassword" ControlToValidate="TxtBxPassword" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" TextMode="Password" ToolTip="Reenter Password" ID="TxtBxConfirmPassword" placeholder="Confirm Password" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="register" ID="RFVConfirmPassword" ControlToValidate="TxtBxConfirmPassword" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CVPassword" ControlToCompare="TxtBxPassword" ControlToValidate="TxtBxConfirmPassword" runat="server" ErrorMessage="*"></asp:CompareValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <label>Gender</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <asp:RadioButtonList ToolTip="Select Your Gender" ID="RBLGender" RepeatDirection="Horizontal" runat="server">
                                                                <asp:ListItem Text="Male" Selected="True" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row pull-left" style="margin-left: 1%;">
                                                <div class="form-inline">
                                                    <div class="form-group">
                                                        <label>Branch</label>
                                                        <asp:DropDownList ToolTip="Select Your Branch" ID="DDLBranch" DataTextField="BranchName" DataValueField="BranchID" runat="server"></asp:DropDownList>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="form-group">
                                            <label>Year</label>
                                            <asp:DropDownList ToolTip="Select Your Year" ID="DDLYear" runat="server">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="checkbox">
                                            <asp:CheckBox ToolTip="Do you want T-Shirt?" ID="CBWantTShirt" Text="Want T-Shirt ?" runat="server" />
                                        </div>
                                                    <div class="checkbox" runat="server" visible="false" id="RowAccomodation">
                                                        <asp:CheckBox ToolTip="Do you want Accomodation?" ID="CBWantAccomodation" Text="Want Accomodation ?" runat="server" />
                                                    </div>
                                                </div>
                                                <br />
                                                <asp:Button CssClass="btn btn-primary pull-left registerButton" ValidationGroup="register" ID="BtnRegister" OnClick="BtnRegister_Click" runat="server" Text="Register" />                                               
                                                <label><asp:Label ID="LblResult" runat="server" Text=""></asp:Label></label>
                                            </div>
                                            <br />
                                        </div>                                  
                                        <div class="col-md-1 visible-lg visible-md" id="separator_vertical"></div>
                                        <div class="col-md-1 visible-sm visible-xs" id="separator_hor"></div>
                                        <div id="loginPartition" class="col-md-5">
                                            <h2>Login</h2>

                                            <div class="row">
                                                <div class="col-md-11">
                                                    <asp:TextBox ID="txtbxLoginEmail" CssClass="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="login" ID="RequiredFieldValidator1" ControlToValidate="txtbxLoginEmail" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <asp:TextBox CssClass="form-control" ID="txtbxLoginPassword" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="login" ID="RequiredFieldValidator2" ControlToValidate="txtbxLoginPassword" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                            <asp:LinkButton ValidationGroup="nothing" CssClass="pull-left" OnClick="LBForgotPassword_Click" ID="LBForgotPassword" runat="server">Forgot Password?</asp:LinkButton>
                                            <asp:Button ID="BtnLogin" ValidationGroup="login" OnClick="BtnLogin_Click" CssClass="btn btn-primary registerButton" runat="server" Text="Login" />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <div id="TableForgotPassword" runat="server" visible="false">
                                                <div class="row">
                                                    <div class="col-md-11">
                                                        <asp:TextBox CssClass="form-control" ValidationGroup="ForgotPassword" ID="TxtBxForgotEmailID" placeholder="Enter your Email ID" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:RequiredFieldValidator ValidationGroup="ForgotPassword" ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtBxForgotEmailID" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <asp:Button CssClass="btn btn-primary registerButton pull-left" style="margin-left:3%" ValidationGroup="ForgotPassword" ID="BtnGetPassword" OnClick="BtnGetPassword_Click" runat="server" Text="Get Password" />
                                                    <label><asp:Label ID="LblOutput" runat="server" Text=""></asp:Label></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                            <div class="modal-footer">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="BtnLogin" />                            
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <!-- Edit Profile Modal Starts -->
         <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="EditProfile" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span style="color: white; font-size: 39px; font-weight: 100;" aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div id="editProfile_modal" class="container">
                                    <h2 style="border-bottom: 1px solid #fff;">Edit Details</h2>                                                        
                                    <div class="row">
                                        <div id="editProfileDiv" class="col-md-6 col-md-offset-3">
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <label>Your Techtrishna 2015 ID is <asp:Label ID="LblTTID" runat="server"></asp:Label></label>
                                                </div>
                                            </div>                                           
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:DropDownList CssClass="form-control" ToolTip="Select Your College" ID="drpdwnProfileCollege" AutoPostBack="true" OnSelectedIndexChanged="drpdwnProfileCollege_SelectedIndexChanged" DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true" runat="server">
                                                            <asp:ListItem Value="1" Text="Ajay Kumar Garg Engineering College"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" runat="server" id="profileCollegeDiv" visible="false">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="txtbxProfileCollegeName" ToolTip="Enter your college name" placeholder="Your College Name" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="Profile" ControlToValidate="txtbxProfileCollegeName" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row" runat="server" id="profileStudentNumberDiv">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="txtbxProfileStudentNumber" ToolTip="Enter Your Student Number" placeholder="Student Number" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="Profile" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtbxProfileStudentNumber" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <%--<asp:RegularExpressionValidator ID="REVStudentNo" runat="server" ControlToValidate="TxtBxStudentNo" ValidationExpression="\d{7}[d|D|l|L]?" ErrorMessage="*"></asp:RegularExpressionValidator>--%>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="txtbxProfileName" ToolTip="Enter Your Name" placeholder="Name" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="Profile" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtbxProfileName" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="txtbxProfileEmail" ToolTip="Enter Your Email" placeholder="Email" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RequiredFieldValidator ValidationGroup="Profile" ID="RequiredFieldValidator7" ControlToValidate="txtbxProfileEmail" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ValidationGroup="Profile" ID="RegularExpressionValidator1" ControlToValidate="txtbxProfileEmail" runat="server" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="txtbxProfileContactNo" ToolTip="Enter 10 digit Contact Number" placeholder="Contact Number" Text="" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RegularExpressionValidator ValidationGroup="Profile" ID="RegularExpressionValidator2" runat="server" ValidationExpression="[7|8|9]\d{9}" ControlToValidate="txtbxProfileContactNo" ErrorMessage="*"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ValidationGroup="Profile" ID="RequiredFieldValidator8" ControlToValidate="txtbxProfileContactNo" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row" runat="server" id="profilePartnerIdDiv" visible="false">
                                                <div class="col-md-11">
                                                    <div class="form-group">
                                                        <asp:TextBox CssClass="form-control" ID="txtbxProfilePartnerId" ToolTip="Enter Partner ID like TT1234" placeholder="Partner ID like TT1234" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <asp:RegularExpressionValidator ValidationGroup="Profile" ID="RegularExpressionValidator3" ValidationExpression="[T|t][T|t]\d{4}" ControlToValidate="txtbxProfilePartnerId" runat="server" ErrorMessage="*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>                                            
                                            <div class="row">
                                                <div class="col-md-11">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <label>Gender</label>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <asp:RadioButtonList ToolTip="Select Your Gender" ID="rblProfileGender" RepeatDirection="Horizontal" runat="server">
                                                                <asp:ListItem Text="Male" Selected="True" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row pull-left" style="margin-left: 1%;">
                                                <div class="form-inline">
                                                    <div class="form-group">
                                                        <label>Branch</label>
                                                        <asp:DropDownList ToolTip="Select Your Branch" ID="drpdwnProfileBranch" DataTextField="BranchName" DataValueField="BranchID" runat="server"></asp:DropDownList>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="form-group">
                                            <label>Year</label>
                                            <asp:DropDownList ToolTip="Select Your Year" ID="drpdwnProfileYear" runat="server">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="checkbox">
                                            <asp:CheckBox ToolTip="Do you want T-Shirt?" ID="chkbxProfileWantTshirt" Text="Want T-Shirt ?" runat="server" />
                                        </div>
                                                    <div class="checkbox" runat="server" visible="false" id="profileAccomodationDiv">
                                                        <asp:CheckBox ToolTip="Do you want Accomodation?" ID="chkbxWantAccomodation" Text="Want Accomodation ?" runat="server" />
                                                    </div>
                                                </div>
                                                <br />                                               
                                                <asp:Button ValidationGroup="Profile" OnClick="btnUpdate_Click" CssClass="btn btn-primary pull-left registerButton" ID="btnUpdate" runat="server" Text="Update" />
                                                <label><asp:Label ID="lblProfileResult" runat="server" Text=""></asp:Label></label>
                                            </div>
                                            <br />
                                        </div>                                                                     
                                    </div>
                                </div>
                            </div>                            
                            <div class="modal-footer">
                            </div>
                        </ContentTemplate>                      
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!-- Edit Profile Modal Ends -->

        <!-- Video Modal Starts -->
        <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" onclick="clearVideoSource()" data-dismiss="modal" aria-label="Close">
                            <span style="z-index: 999; position: fixed; color: white; font-weight: 100; font-size: 25px; margin-left: -40px;">X</span>
                        </button>
                        <br />
                        <br />
                        <iframe width="98%" height="600px" id="videoIFrame" src="" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- Video Modal Ends-->


        <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">


                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="z-index: 999; position: fixed; color: white; font-weight: 100; font-size: 25px; margin-left: -40px;">X</span>
                        </button>
                        <iframe id="eventsIFrame" width="99.6%" height="900px" src="" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <!--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>-->
                </div>
            </div>
        </div>
        <!--rules modal starts-->
        <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">


                    <div class="modal-body">
                        <button type="button" class="close" id="rulesClose" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="z-index: 999; position: fixed; color: white; font-weight: 100; font-size: 25px; margin-left: -40px;">X</span>
                        </button>
                        <iframe id="rulesIframe" width="99.6%" height="690px" src="" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <!--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>-->
                </div>
            </div>
        </div>
        <!--rules modal ends-->
        <!--schedule modal starts-->
        <div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" id="rulesClose" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="z-index: 999; position: fixed; color: white; font-weight: 100; font-size: 25px; margin-left: -40px;">X</span>
                        </button>
                        <center>
                        <h2 style="color:#eee;">Coming Soon</h2>
                    </center>
                        <iframe id="rulesIframe" width="99.6%" height="690px" src="" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <!--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>-->
                </div>
            </div>
        </div>
        <!-- schedule modal ends-->
        <!--organisers model starts-->
        <div class="modal fade" id="modal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">


                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="z-index: 999; position: fixed; color: white; font-weight: 100; font-size: 25px; margin-left: -40px;">X</span>
                        </button>
                        <iframe width="99.6%" height="1100" src="organiser/organiser.html" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>

        <!--organisers modal ends-->
        <!--credits modal starts-->
        <div class="modal fade" id="creditsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" id="creditsModalContent" style="background: url('img/credits_7.png'); background-size: cover; background-position: 0px -100px; height: 667px;">


                    <div class="modal-body">
                        <button type="button" class="close" id="rulesClose" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="z-index: 999; position: fixed; color: white; font-weight: 100; font-size: 25px; margin-left: -40px;">X</span>
                        </button>
                        <div class="creditspage">
                            <div class="container" id="credits-container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6" id="creditHeading">
                                        <br />
                                        <h1>Credits for the website</h1>
                                        <p style="float: right; font-size: 23px;">Visit us at: <a style="color: #337ab7" href="http://silive.in/">www.silive.in</a></p>
                                    </div>


                                </div>
                                <div class="row" id="credits_pic">
                                    <div style="margin-left: -40px; margin-top: -40px;" class="col-md-6">
                                        <div class="persona">
                                            <a href="https://www.facebook.com/priyanshu75">
                                                <img src="img/priyanshu.jpg" class="img-responsive person">
                                                <p>Priyanshu Agrawal</p>
                                            </a>
                                        </div>

                                        <div class="persona">
                                            <a href="https://www.facebook.com/maheshwarinikhil10">
                                                <img src="img/nikhil.jpg" class="img-responsive person">
                                                <p>
                                                    Nikhil Maheshwari
                                                </p>
                                            </a>
                                        </div>

                                        <div class="persona">
                                            <a href="https://www.facebook.com/ashutosh.jainvi">
                                                <img src="img/jainvi.jpg" class="img-responsive person">
                                                <p>
                                                    Ashutosh Jainvi
                                                </p>
                                            </a>
                                        </div>
                                        <div class="persona">
                                            <a href="https://www.facebook.com/sufiyan.ansari.313">
                                                <img src="img/sufiyan.jpg" class="img-responsive person">
                                                <p>
                                                    Sufiyan Ansari
                                                </p>
                                            </a>
                                        </div>
                                        <div class="persona">
                                            <a href="https://www.facebook.com/rishabh.ranjankesarwani">
                                                <img src="img/rishabh.jpg" class="img-responsive person">
                                                <p>
                                                    Rishabh Ranjan Kesarwani
                                                </p>
                                            </a>
                                        </div>
                                        <div class="persona">
                                            <a href="https://www.facebook.com/raghvendra.tripathi.98">
                                                <img src="img/raghu.jpg" class="img-responsive person">
                                                <p>
                                                    Raghvendra Tripathi
                                                </p>
                                            </a>
                                        </div>
                                        <div class="persona">
                                            <a href="https://www.facebook.com/pranav.chaudhary.750">
                                                <img src="img/pranav.jpg" class="img-responsive person">
                                                <p>
                                                    Pranav Chaudhary
                                                </p>
                                            </a>
                                        </div>
                                        <div class="persona">
                                            <a href="https://www.facebook.com/Animesh0721?fref=ts">
                                                <img src="img/animesh.jpg" class="img-responsive person">
                                                <p>
                                                    Animesh Kumar
                                                </p>
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <!--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>-->
                </div>
            </div>
        </div>
        <!--credits modal ends-->



        <div class="page-wrapper page" id="home">
            <div class="timeline" style="z-index: 99;">
                <div class="left-timeline-scale"></div>
                <div class="menu-icons">
                    <div class="right-options hvr-buzz" id="option1">
                        <a href="#home">
                            <img class="options-img" src="img/planets/1.png">Home</a>
                    </div>
                    <div class="right-options hvr-buzz" id="option2">
                        <a href="#events">
                            <img class="options-img" src="img/planets/2.png">Events</a>
                    </div>
                    <div class="right-options hvr-buzz" id="option3">
                        <a href="#rules">
                            <img class="options-img" src="img/planets/11.png">Rules</a>
                    </div>
                    <div class="right-options hvr-buzz" id="option4">
                        <a href="#schedule">
                            <img class="options-img" src="img/planets/10.png">Schedule</a>
                    </div>
                    <div class="right-options hvr-buzz" id="option5">
                        <a href="#downloads">
                            <img class="options-img" src="img/planets/5.png">Downloads</a>
                    </div>
                    <div class="right-options hvr-buzz" id="option6">
                        <a href="#footer">
                            <img class="options-img" src="img/planets/6.png">Contact</a>
                    </div>
                </div>
            </div>
            <div class="user-menu">
                <span class="fb-like" data-layout="button_count" data-href="https://www.facebook.com/techtrishna.akgec" data-send="true" data-width="300" data-show-faces="false" data-font="verdana" data-colorscheme="dark"></span>
                <%--<asp:Button ID="btnRegisterLogin" UseSubmitBehavior="false" class="btn btn-small scroll-link" data-toggle="modal" data-target="#login" runat="server" Text="Register/Login" />--%>
                <button type="button" runat="server" id="btnRegisterLogin" class="btn btn-small scroll-link" data-toggle="modal" data-target="#login">Register/Login</button>
                <asp:Panel ID="pnlProfile" Visible="false" runat="server">
                     <a href="#0" class="language j-btn-menu" data-menu='lang-menu'>
                         <asp:Label ID="lblParticipantName" runat="server" Text=""></asp:Label>
                     </a>
                <div class="menu-list" id='lang-menu' style='float: right; text-align: right; position: absolute; right: 0px;'>
                    <ul>
                        <li><a href='#' data-toggle="modal" data-target="#editProfileModal">Edit Profile</a></li>
                        <li><asp:LinkButton ID="LBLogout" OnClick="LBLogout_Click" runat="server">Logout</asp:LinkButton></li>
                    </ul>
                </div>
                </asp:Panel>               
            </div>
            <img class="astronaut-img floating" src="img/astronaut6.png">
            <img src="img/asteroids-left.png" alt="pic" class="a-left">
            <img src="img/asteroids-right.png" alt="pic" class="a-right">
            <img src="img/asteroids-left.png" alt="pic" class="b-left">
            <img src="img/asteroids-right.png" alt="pic" class="b-right">

            <div class="container">
                <!-- THE 1st SCREEN -->
                <canvas id="canvasOne" class="dusty" width="1280" height="1420"></canvas>
                <canvas id="canvasAustro" class="austro" width="600" height="640"></canvas>
                <!-- <canvas id="canvasStars" class="bg-stars" width="600" height="640"></canvas> -->
                <div class="center">
                    <img src="img/logo.png" height="140" alt="Tech Trishna 2015" class="logo-main centered">
                    <h1 class="title title-big hvr-grow" style="z-index: 999;">Ajay Kumar Garg Engineering College<span>Tech Trishna</span><span> 2015</span></h1>
                    <h4 class="title title-small title-special"><span>14th - 15th March</span></h4>
                    <a href="#earth-content" class="btn-arrow-down to-second centered">
                        <span class='arrow-down-p2'><i class="fa fa-angle-down fa-3x"></i></span>
                        <span class='arrow-down-p3'><i class="fa fa-angle-down fa-3x"></i></span>

                    </a>
                    <div class="tiny-stars">
                        <img src="img/stars2.svg" alt="TechTrishna'15">
                    </div>
                    <div class="tiny-stars middle-stars">
                        <img src="img/stars3.svg" alt="">
                    </div>

                    <div id="earth">
                        <div class="planet-big centered">
                            <!-- ORBIT -->
                            <span class="round round-1"></span>
                            <span class="round round-2"></span><span class="round round-3"></span>
                            <span class="round round-4"></span><span class="round round-5"></span>
                            <!-- END OF ORBIT -->

                        </div>
                    </div>
                    <!-- end of planet-big centered -->

                    <div class="planet-big-content centered screen-1" id="earth-content">
                        <img id="notification1" class="notification floating_notification hatch" src="img/pointer2.png" />
                        <img id="notification2" class="notification floating_notification hatch" src="img/pointer2.png" />
                        <img id="notification3" class="notification floating_notification hatch" src="img/pointer2.png" />

                        <div class="notificationData" id="notification1Data">
                            Techtrishna 2015 Teaser is live.<br />
                            <a style="color: red;" target="_blank" href="https://www.youtube.com/watch?v=6MRMyF3SID0">Watch Now</a>
                        </div>
                        <div class="notificationData" id="notification2Data">
                            Techtrishna 2015 Teaser is live.<br />
                            <a style="color: red;" target="_blank" href="https://www.youtube.com/watch?v=6MRMyF3SID0">Watch Now</a>
                        </div>
                        <div class="notificationData" id="notification3Data">
                            Techtrishna 2015 Teaser is live.<br />
                            <a style="color: red;" target="_blank" href="https://www.youtube.com/watch?v=6MRMyF3SID0">Watch Now</a>
                        </div>
                        <!--<h2>Hey, there!</h2>
                    <h4 class="title title-small">Welcome to Tech Trishna '15.</h4>
                    <p class="text" style="color:#ffffff">Tech Trishna is an annual technical festival of <br />Ajay Kumar Garg Engineering College, Ghaziabad. </p>-->
                        <!--<a href="#events" class="btn  btn-big">Take a Jounrey</a>-->
                        <a href="#events" class="btn-arrow-down to-second centered" style="margin-top: 39%;">
                            <span class='arrow-down-p2'><i class="fa fa-angle-down fa-3x"></i></span>
                            <span class='arrow-down-p3'><i class="fa fa-angle-down fa-3x"></i></span>

                        </a>
                    </div>
                    <img src="img/planet-1.png" alt="" class="abs planet-1 hvr-float">
                    <img src="img/moon1.png" alt="" class="abs moon hvr-sink slideDown">

                    <!-- END OF THE 1st SCREEN -->
                    <!-- THE 2nd SCREEN -->
                    <div id="ufo1" class="tossing">
                        <img src="img/module-2.png" />
                    </div>




                    <!-- THE 3rd SCREEN -->

                    <div id="events">
                        <div id="trigger1">


                            <img id="events-img" src="img/events-img.png" style="width: 450px;">
                            <div class="event-circle-box">

                                <div class="events-circle img-circle hvr-back-pulse" name="lan" id="circle1" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-gamepad fa-3x "></i>
                                    <div class="events-heading">LAN</div>
                                </div>
                                <div class="events-circle img-circle hvr-back-pulse" name="managerial" id="circle2" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-users fa-3x"></i>
                                    <div class="events-heading">Managerial</div>
                                </div>
                                <div class="events-circle img-circle hvr-back-pulse" name="coding" id="circle3" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-code fa-3x"></i>
                                    <div class="events-heading">Coding</div>
                                </div>
                                <div class="events-circle img-circle hvr-back-pulse" name="crossExamine" id="circle4" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-cube fa-3x"></i>
                                    <div class="events-heading">Cross Examine</div>
                                </div>
                                <div class="events-circle img-circle hvr-back-pulse" name="robotics" id="circle5" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-space-shuttle fa-3x"></i>
                                    <div class="events-heading">Robotics</div>
                                </div>
                                <div class="events-circle img-circle hvr-back-pulse" name="amalgamation" id="circle6" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-tasks fa-3x"></i>
                                    <div class="events-heading">Amalgamation</div>
                                </div>
                                <div class="events-circle img-circle hvr-back-pulse" name="online" id="circle7" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-laptop fa-3x"></i>
                                    <div class="events-heading">Online</div>
                                </div>
                                <div class="events-circle img-circle hvr-back-pulse" name="miscellaneous" id="circle8" data-toggle="modal" data-target="#modal1">
                                    <i class="fa fa-qrcode fa-3x"></i>
                                    <div class="events-heading">Miscellaneous</div>
                                </div>

                            </div>

                        </div>
                        <a href="#rules" class="btn-arrow-down to-second centered" style="margin-top: 46%">
                            <span class='arrow-down-p2'><i class="fa fa-angle-down fa-3x"></i></span>
                            <span class='arrow-down-p3'><i class="fa fa-angle-down fa-3x"></i></span>

                        </a>
                        <!--events div ends-->
                    </div>
                    <!-- END OF THE 3rd SCREEN -->
                    <!-- THE 4th SCREEN -->
                    <div id="ufo2">
                        <img src="img/module-52.png" />
                    </div>

                    <!-- END OF THE 4th SCREEN -->
                    <!-- THE 5th SCREEN -->

                    <div class="screen-3" id="rulesDiv">
                        <div class="planet-2-area centered">
                            <div class="planet-2-orbit "></div>
                            <img src="img/rocket-yellow.png" alt="" class="orbit-rocket">
                            <div class="planet-2">
                                <img width="480" src="img/rules.png" alt="">
                            </div>
                            <div id="rules">
                                <br />
                                <br />
                                <div id="trigger2">
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <img id="rocket1" src="img/rocket-red.png" style="width: 79px; visibility: hidden;">
                                    <div class="rules-circle-box">

                                        <div class="rules-circle img-circle hvr-back-pulse" id="rules-circle1" data-toggle="modal" data-target="#modal2">
                                            <i class="fa fa-book fa-4x"></i>
                                            <div class="rules-heading">Registration</div>
                                        </div>
                                        <div class="rules-circle img-circle  hvr-back-pulse" id="rules-circle3" data-toggle="modal" data-target="#modal2">
                                            <i class="fa fa-bus fa-4x"></i>
                                            <div class="rules-heading">Transportation</div>
                                        </div>
                                        <div class="rules-circle img-circle hvr-back-pulse" id="rules-circle4" data-toggle="modal" data-target="#modal2">
                                            <i class="fa fa-university fa-4x"></i>
                                            <div class="rules-heading">Accomodation</div>
                                        </div>


                                    </div>

                                </div>
                            </div>
                            <a href="#schedule" class="btn-arrow-down to-second centered" style="margin-top: 87%">

                                <span class='arrow-down-p2'><i class="fa fa-angle-down fa-3x"></i></span>
                                <span class='arrow-down-p3'><i class="fa fa-angle-down fa-3x"></i></span>

                            </a>
                        </div>



                        <!--ends-->
                        <!--schedule starts-->

                        <div id="schedule">
                            <div id="trigger3">
                                <img src="img/schedule1.png" style="margin-top: 100px;" alt="Schedule" />
                                <div id="schedule-circle1" class="img-circle hvr-back-pulse" data-toggle="modal" data-target="#scheduleModal">
                                    <p class="day-text">DAY <span>1</span></p>
                                </div>
                                <div id="schedule-circle2" class="img-circle hvr-back-pulse" data-toggle="modal" data-target="#scheduleModal">
                                    <p class="day-text">DAY <span>2</span></p>
                                </div>
                                <img width="480" id="schedule-head" src="img/schedule.png" />
                            </div>
                            <a href="#downloads" class="btn-arrow-down to-second centered" style="margin-top: -2%">

                                <span class='arrow-down-p2'><i class="fa fa-angle-down fa-3x"></i></span>
                                <span class='arrow-down-p3'><i class="fa fa-angle-down fa-3x"></i></span>

                            </a>
                        </div>


                        <!-- END OF THE 5th SCREEN -->
                        <!-- THE 6th SCREEN -->

                        <div id="ufo3">
                            <img src="img/module-42.png" />
                        </div>

                        <!-- end of center -->

                    </div>
                    <!-- end of container -->
                    <div class="screen" id="downloadsDiv">
                        <!-- END OF THE 6th SCREEN -->
                        <!-- THE 7th SCREEN -->
                        <div class="container" style='padding-top: 0;' id="downloads">
                            <div class="center">
                                <div class="screen-7">
                                    <div class="download-section">
                                        <div class="download-section-left">
                                            <img src="img/reiches.jpg" height="110" width="200" />
                                            <img src="img/techtrishna.jpg" style="margin-bottom: 0px;" width="200" height="110" />
                                        </div>

                                        <div class="video-section">
                                            <img class="play-img" style="margin-bottom: 0px;" width="55" data-toggle="modal" data-target="#videoModal" onclick="initializeVideoSource()" src="img/play.png" />
                                            <img data-toggle="modal" style="margin-bottom: 0px;" data-target="#videoModal" onclick="initializeVideoSource()" src="img/teaser.jpg" width="250" height="175" />
                                        </div>
                                        <div class="download-section-right">
                                            <img src="img/techtrishna-new.jpg" width="200" height="110" />
                                            <img src="img/brackets.jpg" style="margin-bottom: 0px;" width="200" height="110" />
                                        </div>

                                        <!--<div id="photoSection" class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <img src="img/reiches.jpg" height="110" width="200" />
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5">
                                                <img src="img/techtrishna.jpg" width="200" height="110" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5">
                                                <img src="img/techtrishna-new.jpg" width="200" height="110" />
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5">
                                                <img src="img/brackets.jpg" width="200" height="110" />
                                            </div>
                                        </div>
                                    </div>-->
                                        <!--<div class="col-md-2">
                                        <img data-toggle="modal" data-target="#videoModal" onclick="initializeVideoSource()" src="img/teaser.jpg" width="250" height="175" />
                                    </div>-->
                                        <!--<div id="videoSection" class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <img src="img/reiches.jpg" height="110" width="200" />
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5">
                                                <img src="img/techtrishna.jpg" width="200" height="110" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5">
                                                <img src="img/techtrishna-new.jpg" width="200" height="110" />
                                            </div>
                                            <div class="col-md-1"></div>
                                            <div class="col-md-5">
                                                <img src="img/brackets.jpg" width="200" height="110" />
                                            </div>
                                        </div>
                                    </div>-->

                                        <img data-toggle="modal" data-target="#videoModal" id="pointer" onclick="initializeVideoSource()" class="floating" src="img/pointer3.png" height="120" />
                                        <!-- <img data-toggle="modal" data-target="#videoModal" class="img-ipad" src="img/ipad-video4.png" width="750" />-->
                                    </div>
                                    <div class="planet-3-area centered">
                                        <canvas id="canvasMagneto" class="magneto" width="600" height="640"></canvas>
                                        <div class="planet-3-obits">
                                            <span class="text-huge">
                                                <img src="img/downloads.png" width="450" style="margin-top: 60px;" />
                                            </span>
                                            <!--<p class="text-small">Download the TT'15 video and other stuffs.</p>-->
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- end of center -->
                        </div>
                        <!-- end of container -->
                        <a href="#contacts" class="btn-arrow-down to-second centered" style="margin-top: -43%">

                            <span class='arrow-down-p2'><i class="fa fa-angle-down fa-3x"></i></span>
                            <span class='arrow-down-p3'><i class="fa fa-angle-down fa-3x"></i></span>

                        </a>
                    </div>
                    <div id="contacts">
                        <div class="contacts-wrapper">
                            <div id="contact-box1">
                                <div class="map">
                                    <div id="map"></div>
                                </div>
                                <div class="address">
                                    Ajay Kumar Garg Engineering College, 27th Km Stone, Delhi - Hapur Bypass Road, Adhyatmik Nagar Ghaziabad
                                </div>
                            </div>

                            <div id="contact-box2" data-toggle="modal" data-target="#modal3">
                                <span class="contact"><i class="fa fa-users fa-3x"></i></span>
                                <h3>Organisers</h3>
                                <h5>Team behind the mission</h5>
                            </div>
                            <div id="contact-box3" data-toggle="modal" data-target="#creditsModal">
                                <span class="contact"><i class="fa fa-star fa-3x"></i></span>
                                <h3>Credits</h3>
                                <h5>Creative Minds</h5>
                            </div>
                        </div>
                    </div>





                    <!-- END OF THE 7th SCREEN -->
                    <div id="footer">
                        <!--<div class="cloud-small footer-cloud"><img src="img/cloud-small.gif"></div>
                    <div class="cloud-large footer-cloud"><img src="img/cloud-large.gif"></div>
                    <div class="cloud-center footer-cloud"><img src="img/cloud-center.png"></div>-->
                        <div class="mountain">
                            <div id="footer-content container">

                                <div class="archives floating">
                                    <nav class="menu">
                                        <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open" />
                                        <label class="menu-open-button" for="menu-open">
                                            <span style="font-weight: 300; font-size: 15px;">Archives</span>
                                        </label>

                                        <a href="#" class="menu-item">2009 </a>
                                        <a href="#" class="menu-item">2010 </a>
                                        <a href="#" class="menu-item">2011 </a>
                                        <a href="#" class="menu-item">2012 </a>
                                        <a href="#" class="menu-item">2013 </a>


                                    </nav>

                                    <!-- filters -->
                                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
                                        <defs>
                                            <filter id="shadowed-goo">

                                                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                                                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                                                <feGaussianBlur in="goo" stdDeviation="3" result="shadow" />
                                                <feColorMatrix in="shadow" mode="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2" result="shadow" />
                                                <feOffset in="shadow" dx="1" dy="1" result="shadow" />
                                                <feComposite in2="shadow" in="goo" result="goo" />
                                                <feComposite in2="goo" in="SourceGraphic" result="mix" />
                                            </filter>
                                            <filter id="goo">
                                                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" />
                                                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                                                <feComposite in2="goo" in="SourceGraphic" result="mix" />
                                            </filter>
                                        </defs>
                                    </svg>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="wrapper-nebula">
                        <div id="container" class="container-nebula">
                            <div id="output" class="container-nebula">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <canvas id="bg-stars" class="bg-stars"></canvas>
            <canvas id="world" class="planet-3-orbit" width="800" height="600"></canvas>
            <canvas id="world-2" class="planet-3-orbit" width="800" height="600"></canvas>
            <canvas id="world-3" class="planet-3-orbit" width="800" height="600"></canvas>
            <canvas id="stars-cursor"></canvas>

        </div>
        <!-- end of page-wrapper -->
        <!--<script src="/js/pace.min.js"></script>-->

        <script type='text/javascript'> var isMobile = false; if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) { isMobile = true; } </script>
        <script src="js/vendor/jquery-2.1.1.min.js"></script>
        <script src="js/min/modernizr-2.0.6-min.js"></script>
        <script src="js/pixi.js"></script>
        <script src="js/min/austro-min.js"></script>
        <script src="js/bg-stars-pixi.js"></script>
        <script src="js/min/fss-min.js"></script>
        <script src="js/min/magneto-min.js"></script>
        <script src="js/min/main-min.js"></script>
        <script src="js/min/asteroids-min.js"></script>
        <!--<script src="js/min/bootstrap.min.js"></script>-->
        <script src="js/_dependent/jquery.min.js"></script>
        <script src="js/animateItem.js"></script>
        <script src="js/min/bootstrap.js"></script>
        <script src="js/_mobile/iscroll-probe.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>


        <!--<script src="js/jquery.flatshadow.js"></script>-->
        <script src="js/smoothscroll.js"></script>
        <script src="js/min/fss-min.js"></script>


        <!--  +++++++====BOX SHADOW SCRIPT begins  =======+++++++++++ -->
        <!--<script type="text/javascript">
        $(".flat-icon").flatshadow();
    </script>-->






        <script>

            $(function () {

                $(document).on('scroll', function () {

                    if ($(window).scrollTop() > 455) {
                        $('.astronaut-img').addClass('show');
                    } else {
                        $('.astronaut-img').removeClass('show');
                    }
                });
            });

            $(function () {

                $(document).on('scroll', function () {

                    if ($(window).scrollTop() > 7400) {
                        $('.astronaut-img').removeClass('floating');
                        $('.astronaut-img').animate({ top: "280px" });

                    } else {
                        $('.astronaut-img').addClass('floating');
                        $('.astronaut-img').css({ top: "240px" });
                    }
                });
            });
        </script>



        <!--MAP BEGINS-->

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>

        <script type="text/javascript">
            // When the window has finished loading create our google map below
            google.maps.event.addDomListener(window, 'load', init);

            function init() {
                // Basic options for a simple Google Map
                // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
                var mapOptions = {
                    // How zoomed in you want the map to start at (always required)
                    zoom: 15,

                    // The latitude and longitude to center the map (always required)
                    center: new google.maps.LatLng(28.676658, 77.500812), // New York

                    // How you would like to style the map.
                    // This is where you would paste any style found on Snazzy Maps.
                    styles: [{ "featureType": "landscape.natural", "elementType": "geometry.fill", "stylers": [{ "visibility": "on" }, { "color": "#e0efef" }] }, { "featureType": "poi", "elementType": "geometry.fill", "stylers": [{ "visibility": "on" }, { "hue": "#1900ff" }, { "color": "#c0e8e8" }] }, { "featureType": "road", "elementType": "geometry", "stylers": [{ "lightness": 100 }, { "visibility": "simplified" }] }, { "featureType": "road", "elementType": "labels", "stylers": [{ "visibility": "off" }] }, { "featureType": "transit.line", "elementType": "geometry", "stylers": [{ "visibility": "on" }, { "lightness": 700 }] }, { "featureType": "water", "elementType": "all", "stylers": [{ "color": "#7dcdcd" }] }]
                };

                // Get the HTML DOM element that will contain your map
                // We are using a div with id="map" seen below in the <body>
                var mapElement = document.getElementById('map');

                // Create the Google Map using our element and options defined above
                var map = new google.maps.Map(mapElement, mapOptions);

                // Let's also add a marker while we're at it
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(28.676658, 77.500812),
                    map: map,
                    title: 'AKGEC-MAP'
                });
            }
        </script>
        <script>
            function initializeVideoSource() {
                $('#videoIFrame').attr('src', 'https://www.youtube.com/embed/6MRMyF3SID0?autoplay=1');
            }
            function clearVideoSource() {
                $('#videoIFrame').attr('src', '');
            }
        </script>
        <script>
            $(document).ready(function () {
                $('.events-circle').click(function () {
                    var id = $(this).attr("name");
                    $('#eventsIFrame').attr('src', 'events/events.html?id=' + id);
                });
                $('#rules-circle1').click(function () {
                    $('#rulesIframe').attr('src', 'events/rules.html?q=1');
                });
                $('#rules-circle4').click(function () {
                    $('#rulesIframe').attr('src', 'events/rules.html?q=3');
                });
                $('#rules-circle3').click(function () {
                    $('#rulesIframe').attr('src', 'events/rules.html?q=2');
                });
                $('#rulesClose').click(function () {
                    $('#rulesIframe').attr('src', '');
                })
            });
        </script>

        <script>
            $("#notification1").click(function () {
                $("#notification1Data").fadeToggle("slow");
            });
            $("#notification2").click(function () {
                $("#notification3Data").fadeToggle("slow");
            });
            $("#notification3").click(function () {
                $("#notification2Data").fadeToggle("slow");
            });
        </script>




        <!--archieves script-->
        <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
        <script type='text/javascript'>
            $(document).ready(function () { $("#loader span").delay(5000).animate({ "top": "51%" }, 100, function () { $(".cow").animate({ "margin-top": "300px", "opacity": 0 }, 500); $("#loader span").animate({ "top": -200 }, 700, function () { $("#loader").fadeOut("fast"); }); }) })
        </script>

        <!-- Registration Form Script -->
        <script type="text/javascript">
            $(document).ready(function () {
                //To stop the user from entering the anything other than Number.
                $('#TxtBxContactNo').keydown(function (e) {
                    var n = e.keyCode;
                    if ((n >= 65 && n <= 90)) {
                        e.preventDefault();
                    }
                });
            });
        </script>

    </form>
</body>
</html>
