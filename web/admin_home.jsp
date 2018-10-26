<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            function change()
            {
            var username=document.getElementById("username").value;
            var old_password=document.getElementById("old_password").value;
            var new_password=document.getElementById("new_password").value;
            var confirm_password=document.getElementById("confirm_password").value;
            
            if(old_password=="" || new_password=="" || confirm_password=="")
            {
                alert("All fields are mandatory");
            }
               
              if(new_password.length < 6)
              {
                  alert("New Password must be of atleast 6 characters ");
              }
              
             if(new_password!= confirm_password)
             {
                 alert('new password and confirm password should be same');
             }
             
             if(old_password!="" && new_password!="" && confirm_password!="" && new_password== confirm_password && new_password.length>=6)
             {
                 alert('as');
                 var xhr=new XMLHttpRequest();
                 xhr.open("GET","./change_password?username="+username+"&old_password="+old_password+"&new_password="+new_password+"&confirm_password="+confirm_password,true);
                 xhr.onreadystatechange=function ()
                 {
                     if(xhr.readyState==4 && xhr.status==200)
                     {
                         var res=xhr.responseText.trim();
                         if(res=="password changed successfully")
                         {
                            alert(res);
                             window.location.href="admin_login.jsp";
                         
                         }
                         else
                         {
                                document.getElementById("l1").innerHTML=res;
                         }
                     }
                 };
                 xhr.send();
                 
             }
         }
         function manage_category()
         {
             window.location.href="addcategory.jsp";
         }
         
         function check_password()
         {
             var username=document.getElementById("username").value;
             var old_password=document.getElementById("old_password").value;
             var new_password=document.getElementById("new_password").value;
             
             if(old_password=="" || new_password=="")
             {
                 alert("New Password and old password cannot be blank   ");
             }
             else
             {
                 var xhr=new XMLHttpRequest();
                 xhr.open("GET","./checkpassword?username="+username+"&old_password="+old_password+"&new_password="+new_password,true);
                 xhr.onreadystatechange=function()
                 {
                     if(xhr.readyState==4 && xhr.status==200)
                     {
                         var res=xhr.responseText.trim();
                         document.getElementById("l1").innerHTML=res;
                         
                     }
                 };
                 xhr.send();
             }
         }
         
         function manage_shopkeeper()
         {
             window.location.href="manage_shopkeeper.jsp";
             
         }
        
        </script>


    </head>
    <body>
        <%
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();
        %>

        <h2><%="Welcome  " + username%></h2>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <button type="button"  data-toggle="modal" data-target="#myModal1" class="btn btn-primary"   > Change Password</button>
                    <input type="button" class="btn btn-primary" value="Manage Category" onclick="manage_category()"/>
                    <input type="button" class="btn btn-primary" value="Manage Shopkeepers" onclick="manage_shopkeeper()"/>
                </div>
            </div>
        </div>
        <div id="myModal1" class="modal fade">
            <div class="modal-dialog"> 
                <div class="modal-content">                    
                    <div class="modal-header">
                        <a href="#" class="close" data-dismiss="modal">&times;</a>
                        <h5>Login Here</h5>                        
                    </div>
                    <div class="modal-body">
                        <form id="form1" class="form">
                            <div class="form-group" >
                                <label style="font-family: cursive; font-size: 20px;">Username</label>
                                <input  type="text" id="username" value="<%= username%>" name="username" class="form-control" placeholder="abc@gmail.com" disabled><br>

                            </div>

                            <div class="form-group" id='contact'>
                                <label style="font-family: cursive; font-size: 20px;">Old password</label>
                                <input  type="password" class="form-control" placeholder="******" id="old_password" name="old_password" ><br>

                            </div>
                                
                                <div class="form-group" id='contact'>
                                <label style="font-family: cursive; font-size: 20px;">New password</label>
                                <input  type="password" class="form-control" placeholder="******" id="new_password" name="new_password" ><br>

                            </div>
                                
                                <div class="form-group" id='contact'>
                                <label style="font-family: cursive; font-size: 20px;">Confirm password</label>
                                <input  type="password" onblur="check_password()" class="form-control" placeholder="******" id="confirm_password" name="confirm_password"  ><br>

                            </div>
                                
                        </form>
                                <input type="button" class="btn btn-primary" value="Change Password" onclick="change()"/>
                                
                                <label id="l1"></label>
                    </div>
                    <div class="modal-footer">

                    </div>                    
                </div>
            </div>
        </div>
    </body>
</html>
