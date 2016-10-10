using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EMS.Model;
using EMS.Model.Enums;
using System.Data;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Dictionary<int, string> colleges = new Dictionary<int, string>();
        foreach (DataRow row in Participant.GetColleges().Tables[0].Rows)
        {
            colleges.Add((int)row["CollegeID"], (string)row["CollegeName"]);
        }
        ListItem li = new ListItem();
        li.Text = "Other College";
        li.Value = "-1";
        DDLCollege.DataSource = colleges.OrderBy(x => x.Key).ToList().Skip(1).OrderBy(x => x.Value);
        DDLCollege.DataBind();
        DDLCollege.Items.Add(li);
        DDLBranch.DataSource = Participant.GetBranches();
        DDLBranch.DataBind();
        if (Session["EmailID"] != null)
        {
            pnlProfile.Visible = true;
            btnRegisterLogin.Visible = false;
            Participant participant = Participant.GetParticipantDetails(Session["EmailID"].ToString());
            lblParticipantName.Text = participant.Name.Split(' ')[0];
            
            drpdwnProfileCollege.DataSource = colleges.OrderBy(x => x.Key).ToList().Skip(1).OrderBy(x => x.Value);
            drpdwnProfileCollege.DataBind();                     
            drpdwnProfileCollege.Items.Add(li);            
            drpdwnProfileBranch.DataSource = Participant.GetBranches();
            drpdwnProfileBranch.DataBind();
            drpdwnProfileBranch.SelectedIndex = drpdwnProfileBranch.Items.IndexOf(drpdwnProfileBranch.Items.FindByValue(participant.Branch.ToString()));
            drpdwnProfileCollege.SelectedIndex = drpdwnProfileCollege.Items.IndexOf(drpdwnProfileCollege.Items.FindByValue(participant.CollegeID.ToString()));
            txtbxProfileStudentNumber.Text = participant.StudentNo;
            txtbxProfileName.Text = participant.Name;
            txtbxProfileEmail.Text = participant.EmailID;
            txtbxProfileContactNo.Text = participant.ContactNo;
            chkbxProfileWantTshirt.Checked = participant.WantTShirt;
            chkbxWantAccomodation.Checked = participant.WantAccomodation;
            rblProfileGender.SelectedIndex = rblProfileGender.Items.IndexOf(rblProfileGender.Items.FindByText(participant.Gender.ToString()));
            drpdwnProfileYear.SelectedIndex = drpdwnProfileYear.Items.IndexOf(drpdwnProfileYear.Items.FindByValue(participant.Year.ToString()));
            if (participant.PartnerID == 0)
                txtbxProfilePartnerId.Text = "";
            else
                txtbxProfilePartnerId.Text = "TT" + participant.PartnerID.ToString();

            if (drpdwnProfileCollege.SelectedItem.Value == "-1")
                profileCollegeDiv.Visible = true;
            else
                profileCollegeDiv.Visible = false;
            if(drpdwnProfileCollege.SelectedItem.Value!="1")
            {
                profileStudentNumberDiv.Visible = false;
                profileAccomodationDiv.Visible = true;
                profilePartnerIdDiv.Visible = true;
            }
            else
            {
                profileStudentNumberDiv.Visible = true;
                profileAccomodationDiv.Visible = false;
                profilePartnerIdDiv.Visible = false;
            }

            LblTTID.Text = "TT" + participant.TTID;
        }        
                   
    }

    protected void DDLCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLCollege.SelectedItem.Value == "-1")
        {
            RowCollege.Visible = true;
        }
        else
        {
            RowCollege.Visible = false;
        }
        if (DDLCollege.SelectedItem.Value != "1")
        {
            RowStudentNo.Visible = false;
            RowAccomodation.Visible = true;
            rowPartnerID.Visible = true;
        }
        else
        {
            RowStudentNo.Visible = true;
            rowPartnerID.Visible = false;
            RowAccomodation.Visible = false;
        }
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        bool partnerExists = true;
        if (TxtBxPartnerID.Text != "")
        {
            partnerExists = Participant.CheckParticipantTTID(int.Parse(TxtBxPartnerID.Text.Substring(2)));
        }
        if (partnerExists)
        {
            Participant participant = InitializeParticipant();
            int ttid = Participant.InsertParticipantDetails(participant);
            if (ttid != 0)
            {
                string body = GetEmailBody(ttid);
                Communication.Sendmail("register.techtrishna@gmail.com", "Tech Trishna 2015", participant.EmailID, "Registration Successful", body);
                LblResult.Text = "Registered. Your ID is TT" + ttid.ToString();
            }
            else
                LblResult.Text = "Already Registered.";

        }
        else
        {
            LblResult.Text = "Invalid Partner ID";
        }

    }

    private string GetEmailBody(int ttid)
    {
        string body;

        body = "<!DOCTYPE html PUBLIC " + "-//W3C//DTD XHTML 1.0 Transitional//EN" + "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" + "><html xmlns=" + "http://www.w3.org/1999/xhtml" + "><head><title>Tech trishna 2015 </title></head><body><table style=" + "border-collapse:collapse;border-spacing:0;Margin-left:auto;Margin-right:auto" + "><tbody><tr><td style=" + "padding:0;vertical-align:top;font-size:1px;line-height:1px;width:1px" + ">​</td><td style=" + "padding:0;vertical-align:top" + "><table  style=" + "border-collapse:collapse;border-spacing:0;Margin-left:auto;Margin-right:auto;width:600px;background-color:#ffffff;font-size:14px" + "><tbody><tr><td style=" + "\"padding:0;vertical-align:top;text-align:left;border:2px solid #EEE;\"" + "><div style=" + "font-size:12px;Margin-bottom:24px;mso-line-height-rule:at-least;color:#565656;font-family:Georgia,serif" + " align=" + "center" + "><img style=" + "border:0;-ms-interpolation-mode:bicubic;display:block;max-width:874px" + " src=" + "\"cid:12345\"" + " alt=\"Tech Trishna 2015\" width=" + "600" + " height=" + "96" + "/></div><table  style=" + "border-collapse:collapse;border-spacing:0;width:100%" + "><tbody><tr><td style=" + "padding:0;vertical-align:top;padding-left:32px;padding-right:32px" + "><h1 style=" + "Margin-top:0;color:#565656;font-weight:700;font-size:36px;Margin-bottom:18px;font-family:sans-serif;line-height:42px" + ">Congratulations !</h1><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:16px;line-height:25px;Margin-bottom:25px>Dear " + TxtBxName.Text + ",</p><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:16px;line-height:25px;Margin-bottom:25px" + ">You have been successfully registered in Tech Trishna 2015. Your Tech Trishna id is<strong style=" + "font-weight:bold" + "> TT" + ttid.ToString() + "</strong>. Please note this ID for all future references. In case you forget, you can get the same by logging in the website.</p><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:16px;line-height:25px;Margin-bottom:25px" + ">See you on March 14, 2015.</p><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:16px;line-height:25px;Margin-bottom:25px" + ">For further details, please visit: <a href=" + "http:" + "//techtrishna.in" + ">techtrishna.in</a></p><blockquote style=" + "Margin-top:0;Margin-right:0;Margin-bottom:0;padding-right:0;font-style:italic;font-size:14px;border-left:2px solid #e9e9e9;Margin-left:0;padding-left:16px" + "><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:11px;line-height:25px;Margin-bottom:24px" + ">Note: This is a system generated email. Please do not reply.</p></blockquote></td></tr></tbody></table><div style=" + "font-size:8px;line-height:8px" + ">&nbsp;</div></td></tr></tbody></table></td><td style=" + "padding:0;vertical-align: top;font-size:1px;line-height:1px;background-color:#e9e9e9;width:1px" + ">​</td></tr></tbody></table><table style=" + "border-collapse:collapse;border-spacing:0;font-size:1px;line-height:1px;background-color:#e9e9e9;Margin-left:auto;Margin-right:auto" + "width=" + "602" + "><tbody><tr><td style=" + "padding:0;vertical-align:top" + ">​</td></tr></tbody></table></body></html>";
        return body;
    }

    private Participant InitializeParticipant()
    {
        int collegeID = -1;
        if (DDLCollege.SelectedItem.Value == "-1")
        {
            collegeID = Participant.InsertCollege(TxtBxCollege.Text);
        }
        else
        {
            collegeID = int.Parse(DDLCollege.SelectedValue);
        }
        int partnerID;
        if (TxtBxPartnerID.Text == "")
            partnerID = 0;
        else
            partnerID = int.Parse(TxtBxPartnerID.Text.Substring(2));



        Participant participant = new Participant
        {
            Name = TxtBxName.Text,
            CollegeID = collegeID,
            WantAccomodation = CBWantAccomodation.Checked,
            Branch = (BranchType)Enum.Parse(typeof(BranchType), DDLBranch.SelectedValue),
            ContactNo = TxtBxContactNo.Text,
            EmailID = TxtBxEmail.Text,
            Gender = (GenderType)Enum.Parse(typeof(GenderType), RBLGender.SelectedValue),
            PartnerID = partnerID,
            Password = PasswordHasher.HashPassword(TxtBxPassword.Text),
            StudentNo = TxtBxStudentNo.Text,
            WantTShirt = CBWantTShirt.Checked,
            Year = int.Parse(DDLYear.SelectedValue)
        };
        return participant;
    }

    private Participant InitializeParticipantProfile()
    {
        int collegeID = -1;
        if (drpdwnProfileCollege.SelectedItem.Value == "-1")
        {
            collegeID = Participant.InsertCollege(txtbxProfileCollegeName.Text);
        }
        else
        {
            collegeID = int.Parse(drpdwnProfileCollege.SelectedValue);
        }
        int partnerID;
        if (txtbxProfilePartnerId.Text == "")
            partnerID = 0;
        else
            partnerID = int.Parse(txtbxProfilePartnerId.Text.Substring(2));



        Participant participant = new Participant
        {
            Name = txtbxProfileName.Text,
            CollegeID = collegeID,
            WantAccomodation = chkbxWantAccomodation.Checked,
            Branch = (BranchType)Enum.Parse(typeof(BranchType), drpdwnProfileBranch.SelectedValue),
            ContactNo = txtbxProfileContactNo.Text,
            EmailID = txtbxProfileEmail.Text,
            Gender = (GenderType)Enum.Parse(typeof(GenderType), rblProfileGender.SelectedValue),
            PartnerID = partnerID,            
            StudentNo = txtbxProfileStudentNumber.Text,
            WantTShirt = chkbxProfileWantTshirt.Checked,
            Year = int.Parse(drpdwnProfileYear.SelectedValue)
        };
        return participant;
    }

    private string GetForgotPasswordEmailBody(string password, string name)
    {
        string body;

        body = "<!DOCTYPE html PUBLIC " + "-//W3C//DTD XHTML 1.0 Transitional//EN" + "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" + "><html xmlns=" + "http://www.w3.org/1999/xhtml" + "><head><title>Tech trishna 2015 </title></head><body><table style=" + "border-collapse:collapse;border-spacing:0;Margin-left:auto;Margin-right:auto" + "><tbody><tr><td style=" + "padding:0;vertical-align:top;font-size:1px;line-height:1px;width:1px" + ">​</td><td style=" + "padding:0;vertical-align:top" + "><table  style=" + "border-collapse:collapse;border-spacing:0;Margin-left:auto;Margin-right:auto;width:600px;background-color:#ffffff;font-size:14px" + "><tbody><tr><td style=" + "\"padding:0;vertical-align:top;text-align:left;border:2px solid #EEE;\"" + "><div style=" + "font-size:12px;Margin-bottom:24px;mso-line-height-rule:at-least;color:#565656;font-family:Georgia,serif" + " align=" + "center" + "><img style=" + "border:0;-ms-interpolation-mode:bicubic;display:block;max-width:874px" + " src=" + "\"cid:12345\"" + " alt=\"Tech Trishna 2015\" width=" + "600" + " height=" + "96" + "/></div><table  style=" + "border-collapse:collapse;border-spacing:0;width:100%" + "><tbody><tr><td style=" + "padding:0;vertical-align:top;padding-left:32px;padding-right:32px" + "><h1 style=" + "Margin-top:0;color:#565656;font-weight:700;font-size:36px;Margin-bottom:18px;font-family:sans-serif;line-height:42px" + ">New Password</h1><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:16px;line-height:25px;Margin-bottom:25px>Dear " + name + ",</p><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:16px;line-height:25px;Margin-bottom:25px" + ">Your new password for Tech Trishna 2015 is <strong style=" + "font-weight:bold" + ">" + password + "</strong></p><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:16px;line-height:25px;Margin-bottom:25px" + ">For further details, please visit: <a href=" + "http:" + "//techtrishna.in" + ">techtrishna.in</a></p><blockquote style=" + "Margin-top:0;Margin-right:0;Margin-bottom:0;padding-right:0;font-style:italic;font-size:14px;border-left:2px solid #e9e9e9;Margin-left:0;padding-left:16px" + "><p style=" + "Margin-top:0;color:#565656;font-family:Georgia,serif;font-size:11px;line-height:25px;Margin-bottom:24px" + ">Note: This is a system generated email. Please do not reply.</p></blockquote></td></tr></tbody></table><div style=" + "font-size:8px;line-height:8px" + ">&nbsp;</div></td></tr></tbody></table></td><td style=" + "padding:0;vertical-align: top;font-size:1px;line-height:1px;background-color:#e9e9e9;width:1px" + ">​</td></tr></tbody></table><table style=" + "border-collapse:collapse;border-spacing:0;font-size:1px;line-height:1px;background-color:#e9e9e9;Margin-left:auto;Margin-right:auto" + "width=" + "602" + "><tbody><tr><td style=" + "padding:0;vertical-align:top" + ">​</td></tr></tbody></table></body></html>";

        return body;
    }

    protected void BtnGetPassword_Click(object sender, EventArgs e)
    {
        Participant p = Participant.GetParticipantDetails(TxtBxForgotEmailID.Text);
        if (p == null)
        {
            LblOutput.Text = "Email not registered";
        }
        else
        {
            string password = Membership.GeneratePassword(8, 4);
            bool passwordUpdated = Participant.UpdatePassword(TxtBxForgotEmailID.Text, PasswordHasher.HashPassword(password));
            if (passwordUpdated)
            {
                string body = GetForgotPasswordEmailBody(password, p.Name);
                Communication.Sendmail("register.techtrishna@gmail.com", "Tech Trishna 2015", TxtBxForgotEmailID.Text, "New Password", body);
                LblOutput.Text = "Please check your mail";
                //if(mailSent)

                //else
                //    LblOutput.Text = "Error! Please try again";
            }
            else
            {
                LblOutput.Text = "Error! Please try again";
            }
        }
    }
    protected void LBForgotPassword_Click(object sender, EventArgs e)
    {
        TableForgotPassword.Visible = true;
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        Participant participant = Participant.GetParticipantDetails(txtbxLoginEmail.Text);
        if (PasswordHasher.VerifyHashedPassword(participant.Password, txtbxLoginPassword.Text))
        {
            Session["EmailID"] = participant.EmailID;            
            Response.Redirect("Default.aspx");
        }
        else
        {
            LblResult.Text = "Invalid Details";
        }
    }

    protected void LBLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        bool partnerExists = true;
        if (txtbxProfilePartnerId.Text != "")
        {
            if (txtbxProfilePartnerId.Text == LblTTID.Text)
            {
                lblProfileResult.Text = "Partner ID should be different from your TTID";
                return;
            }
            else
            {
                partnerExists = Participant.CheckParticipantTTID(int.Parse(txtbxProfilePartnerId.Text.Substring(2)));
            }
        }
        if (partnerExists)
        {
            Participant participant = InitializeParticipantProfile();
            participant.TTID = int.Parse(LblTTID.Text.Substring(2));
            bool detailsUpdated = Participant.UpdateParticipantDetails(participant);
            if (detailsUpdated)
            {
                lblProfileResult.Text = "Details Updated";
                Session["EmailID"] = participant.EmailID;                
            }
            else
                LblResult.Text = "Error! Please try again.";
        }
        else
            LblResult.Text = "Invalid Partner ID";
    }
    protected void drpdwnProfileCollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpdwnProfileCollege.SelectedItem.Value == "-1")
            profileCollegeDiv.Visible = true;
        else
            profileCollegeDiv.Visible = false;
        if (drpdwnProfileCollege.SelectedItem.Value != "1")
        {
            profileStudentNumberDiv.Visible = false;
            profileAccomodationDiv.Visible = true;
            profilePartnerIdDiv.Visible = true;
        }
        else
        {
            profileStudentNumberDiv.Visible = true;
            profileAccomodationDiv.Visible = false;
            profilePartnerIdDiv.Visible = false;
        }
    }
}

