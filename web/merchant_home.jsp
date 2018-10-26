<%-- 
    Document   : merchant_home
    Created on : 25 Oct, 2018, 5:04:09 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
         <script>
            function change()
            {
            var email=document.getElementById("email").value;
            var old_password=document.getElementById("old_password").value;
            var new_password=document.getElementById("new_password").value;
            var confirm_password=document.getElementById("confirm_password").value;
            
            alert(email+"   "+old_password+"   "+new_password+"  "+confirm_password);
            
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
                xhr.open("GET","./merchant_checkpassword?email="+email+"&old_password="+old_password+"&new_password="+new_password,true);
                 xhr.onreadystatechange=function ()
                 {
                     if(xhr.readyState==4 && xhr.status==200)
                     {
                         var res=xhr.responseText.trim();
                         if(res=="password changed successfully")
                         {
                            alert(res);
                             window.location.href="merchant_login_in.jsp";
                         
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
         /*function manage_category()
         {
             window.location.href="addcategory.jsp";
         }*/
         
         function check_password()
         {
             var email=document.getElementById("email").value;
             var old_password=document.getElementById("old_password").value;
             var new_password=document.getElementById("new_password").value;
             
             if(old_password=="" || new_password=="")
             {
                 alert("New Password and old password cannot be blank   ");
             }
             else
             {
                 var xhr=new XMLHttpRequest();
                 xhr.open("GET","./merchant_checkpassword?email="+email+" &old_password="+old_password+" &new_password="+new_password,true);
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
        
        </script>

    </head>
    <body>
                <%
            String email = session.getAttribute("email").toString();
            String password = session.getAttribute("password").toString();
        %>

        <h2><%="Welcome  " +email%></h2>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <button type="button"  data-toggle="modal" data-target="#myModal1" class="btn btn-primary"   > Change Password</button>
                    
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
                                <label style="font-family: cursive; font-size: 20px;">E-mail</label>
                                <input  type="text" id="email" value="<%= email %>" name="email" class="form-control" placeholder="E-mail" disabled><br>

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
                                <input  type="password"  class="form-control" placeholder="******" id="confirm_password" name="confirm_password"  ><br>

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
