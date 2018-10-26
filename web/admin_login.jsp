

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            
            function login1()
            {
                
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;

                if (password.length < 6)

                {
                    alert("password must be of 6 characters");
                }
                
                if(password.length>=6)
                {
                    var xhr= new XMLHttpRequest();
                    xhr.open("GET","./adminlogin?username="+username+"&password="+password,true);
                    xhr.onreadystatechange=function ()
                    {
                        if(xhr.readyState==4 && xhr.status==200)
                        {
                            var res=xhr.responseText.trim()
                            if(res=="Success")
                            {
                            
                            document.getElementById("l1").innerHTML="";
                            window.location.href="admin_home.jsp";
                        }
                         else
                        {
                            document.getElementById("l1").style.color='red';
                            document.getElementById("l1").innerHTML=res;
                            
                        }
                        }
                       
                        
                        
                    };
                    xhr.send();
                    
                }
               

            }
             
            
            function check_username()
            {
                    var username2=document.getElementById("username2").value;
                
                
                    var xhr=new XMLHttpRequest();
                    xhr.open("GET","./forgot_password?username="+username2,true);
                    xhr.onreadystatechange= function ()
                    {
                        if(xhr.readyState==4 && xhr.status==200)
                        {
                            var res=xhr.responseText.trim();
                            if(res=="username is valid")
                            {
                                 document.getElementById("l2").style.color='green';
                                document.getElementById("l2").innerHTML=res;
                            }
                            else
                            {
                                 document.getElementById("l2").style.color='red';
                                document.getElementById("l2").innerHTML=res;
                            }
                        }
                    };
                    xhr.send();
        
                
                
                
            }
            
            function forgot_password()
            {
                var username2=document.getElementById("username2").value;
                var new_password=document.getElementById("new_password").value;
                var confirm_password=document.getElementById("confirm_password").value;
                if(new_password!=confirm_password)
                {
                    alert("new password and confirm password should be same");
                }
                else
                {
                    var xhr=new XMLHttpRequest();
                    xhr.open("GET","./forgot_password2?username="+username2+"&new_password="+new_password,true);
                    xhr.onreadystatechange=function()
                    {
                        var res=xhr.responseText.trim();
                        if(res=="Password changed successfully")
                        {
                             document.getElementById("l1").style.color='green';
                            document.getElementById("l1").innerHTML=res;
                            $('#myModal1').modal('hide');
                        }
                        else
                        {
                            document.getElementById("l2").innerHTML=res;
                        }
                    };
                    xhr.send();
                }
            }

        </script>
    </head>
    <body>
        
        <div clss="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron" style="background-color: white;">
                        <center><h1>Admin Login</h1></center>
                    </div>
                </div>
            </div>
            <div class=" col-md-6 col-md-offset-3" id="myForm"> 
                <form role="form">


                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;">Username</label>
                        <input  type="text" id="username" name="username" class="form-control" placeholder="abc@gmail.com"><br>

                    </div>

                    <div class="form-group" id='contact'>
                        <label style="font-family: cursive; font-size: 20px;"> Enter password</label>
                        <input  type="password" class="form-control" placeholder="******" id="password" name="password" ><br>

                    </div>



                </form>
                <input type="button" onclick="login1()" value="Login" class="btn btn-primary"/>
           <button type="button"  data-toggle="modal" data-target="#myModal1" class="btn btn-danger"   > Forgot Password</button> <br>
                <label id="l1"></label>
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
                                <input  type="text" id="username2"  name="username2" class="form-control" placeholder="abc@gmail.com"  onblur="check_username()"><br>
                                
                            </div>

                            
                                
                                <div class="form-group" id='contact'>
                                <label style="font-family: cursive; font-size: 20px;">New password</label>
                                <input  type="password" class="form-control" placeholder="******" id="new_password" name="new_password" ><br>

                            </div>
                                
                                <div class="form-group" id='contact'>
                                <label style="font-family: cursive; font-size: 20px;">Confirm password</label>
                                <input  type="password" class="form-control" placeholder="******" id="confirm_password" name="confirm_password"  ><br>

                            </div>
                                
                        </form>
                                <input type="button" class="btn btn-primary" value="Update Password" onclick="forgot_password()"/>
                                <label id="l2"></label>
                    </div>
                    <div class="modal-footer">

                    </div>                    
                </div>
            </div>
        </div>
    </body>
</html>
