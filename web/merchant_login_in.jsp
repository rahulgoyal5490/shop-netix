<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
         <script>
            
            function login1()
            {
                alert("function login1 called");
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;

                if (password.length < 1)

                {
                    alert("password must be of 1 charaters");
                }
                
                if(password.length>=1)
                {
                    var xhr= new XMLHttpRequest();
                    xhr.open("GET","./merchantlogin?email="+email+"&password="+password,true);
                    xhr.onreadystatechange=function ()
                    {
                        if(xhr.readyState==4 && xhr.status==200)
                        {
                            var res=xhr.responseText.trim()
                            if(res=="Success")
                            {
                                alert(res);
                            document.getElementById("l1").innerHTML="";
                            window.location.href="merchant_home.jsp";
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
            var email2;
            function check_email()
            {
                 email2=document.getElementById("email2").value;
                if(email2=="")
                {
                    alert("E-mail is required");
                }
                else
                {
                    var xhr=new XMLHttpRequest();
                    xhr.open("GET","./check_email?email="+email2,true);
                    xhr.onreadystatechange=function ()
                    {
                        if(xhr.readyState==4 && xhr.status==200)
                        {
                            var res=xhr.responseText.trim();
                            alert(res);
                            if(res=="email is invalid")
                            {
                                document.getElementById("sq12").style.display="none";
                                
                                document.getElementById("sa12").style.display="none";
                                document.getElementById("sub2").style.display="none";
                            }
                            else
                            {
                                document.getElementById("sq12").style.display="block";
                                document.getElementById("sq2").value=res;
                                document.getElementById("sa12").style.display="block";
                                document.getElementById("sub2").style.display="block";
                                
                            }
                        }
                    };
                    xhr.send();
                }
                
            }
            
            function check_answer()
            {
                //var email=document.getElementById("email2");
                var security_answer=document.getElementById("sa3").value;
                if(security_answer=="")
                {
                    alert("security answer is required");
                }
                else if(email2=="")
                {
                    alert("email is required");
                }
                else
                {
                    var xhr=new XMLHttpRequest();
                    xhr.open("GET","./check_answer?security_answer="+security_answer+"&email2="+email2,true);
                    xhr.onreadystatechange=function ()
                    {
                        if(xhr.readyState==4 && xhr.status==200)
                        {
                            var res=xhr.responseText.trim();
                            alert(res);
                            if(res=="success")
                            {
                                document.getElementById("l2").innerHTML="Your Password will be send with sms";
                            }
                            
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
                        <label style="font-family: cursive; font-size: 20px;">Enter E-mail</label>
                        <input  type="text" id="email" name="email" class="form-control" placeholder="E-mail"><br>
                        

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
                                <label style="font-family: cursive; font-size: 20px;">Enter Email</label>
                                <input  type="text" id="email2"  name="email2" class="form-control" placeholder="E-mail"><br>
                               
                                
                            </div>
                        </form>
                         <input type="button" value="submit" onclick="check_email()" class="btn btn-primary"/>
                         <form class="form">
                            
                                
                             <div class="form-group"  id="sq12" style="display: none;">
                                <label style="font-family: cursive; font-size: 20px;"  >Security Question</label>
                                <input  type="text" class="form-control" placeholder="Security Question" id="sq2" name="sq2" disabled ><br>

                            </div>
                                
                            <div class="form-group" style="display: none;" id="sa12">
                                <label style="font-family: cursive; font-size: 20px;">Security Answer</label>
                                <input  type="text" class="form-control" placeholder="Security Answer" id="sa3" name="sa3"  ><br>

                            </div>
                                
                        </form>
                        <input type="button" class="btn btn-primary" value="submit" onclick="check_answer()" style="display: none;" id="sub2"/>
                                <label id="l2"></label>
                    </div>
                    <div class="modal-footer">

                    </div>                    
                </div>
            </div>
        </div>

    </body>
</html>
