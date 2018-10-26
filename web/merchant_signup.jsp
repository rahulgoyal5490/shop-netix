<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merchant Sign Up</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </head>
    <script>

        function signup() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var cpassword= document.getElementById("cpassword").value;
            var contact = document.getElementById("contact").value;
            var address = document.getElementById("address").value;
            var city = document.getElementById("city").value;
            var sq=document.getElementById("sq").value;
            var sa = document.getElementById("sa").value;
            var merchant_name = document.getElementById("merchant_name").value;
            var shop_name = document.getElementById("shop_name").value;
            // var shop_name= document.getElementById("shop_name").value;
            if (email == "" || password == "" || contact == "" || address == "" || city == "" || sa == "" || merchant_name == "" || shop_name == "" || sq==-1)
            {
                alert("all fields are mandatory");
            }
            else if(password!=cpassword)                
                {
                    alert("Password and Confirm password should be same");
                }
            
        
        else
        {
           
                
                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;

                alert("found " + controls.length + " controls in form");

                var flag = 0;


                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }

                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length != 0)
                        {
                            ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    } else    // for other input types  text,password,select
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        //formdata.append("rn",document.getElementById("rn").value);
                        //formdata.append(firstfile.name,firstfile);

                        formdata.append(controls[i].name, controls[i].value);
                    }
//                    alert(ans);
//                    alert(flag);
                }

                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
                {
                    alert(ans);
                    alert(formdata);

                    var xhr = new XMLHttpRequest;


                    xhr.open("POST", "./merchantsignup", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                               

                        }
                    };



                    xhr.send(formdata);
                }
            
            
            
            
        }
        }

        function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];

                var reader = new FileReader();

                alert("File name: " + firstfile.name);
                alert("File size: " + firstfile.size + " bytes");

                reader.onload = (function (f)
                {
                    return function read(e)
                    {
                        document.getElementById(imageid).src = e.target.result;
                    };
                })(firstfile);

                reader.readAsDataURL(firstfile);
            }
            


    </script>




    <body>
        <div clss="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron" style="background-color: white;">
                        <center><h1>Merchant Signup</h1></center>
                    </div>
                </div>
            </div>
            <div class=" col-md-6 col-md-offset-3" id="myForm"> 
               <form role="form"  action="#" method="POST" enctype="multipart/form-data" id="form1">


                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;"> Enter E-mail</label>
                        <input  type="text" id="email" name="email" class="form-control" placeholder="E-mail"  ><br>

                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Enter password</label>
                        <input  type="password" class="form-control" placeholder="password" id="password" name="password" ><br>

                    </div>
                   
                   <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Confirm password</label>
                        <input  type="password" class="form-control" placeholder="confirm password" id="cpassword" name="cpassword" ><br>

                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Enter contact</label>
                        <input  type="number" class="form-control" placeholder="contact" id="contact" name="contact" ><br>

                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Enter your Name</label>
                        <input  type="text" class="form-control" placeholder="name" id="merchant_name" name="merchant_name" ><br>
                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Enter your Shop Name</label>
                        <input  type="text" class="form-control" placeholder="shop name" id="shop_name" name="shop_name" ><br>
                    </div>


                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Enter Address</label>
                        <input  type="text" class="form-control" placeholder="Address" id="address" name="address" ><br>

                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Enter City</label>
                        <input  type="text" class="form-control" placeholder="City" id="city" name="city" ><br>

                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Select Security Question</label><br>
                        <select id="sq" name="sq" class="form-control" >

                            <option value="-1"> Select your security question</option>
                            <option value="What is your nick name?"> What is your nick name?</option>
                            <option value="What is your age?"> What is your age?</option>
                            <option value="What is your date of birth?">  What is your date of birth?</option>
                            <option value="What is your favourite color?"> What is your favourite color ?</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Enter Security answer</label>
                        <input  type="text" class="form-control" placeholder="security answer" id="sa" name="sa" ><br>
                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Select your photo</label>
                        <input  type="file" class="form-control"  id="photo" name="photo" onchange="readandpreview(this,'photo1')" ><br>
                    </div>

                    <div class="form-group">

                        <img src="" id="photo1" name="photo1"  style="width: 100px; height: 100px;"/><br>
                    </div>






                </form>
                <input type="button" onclick="signup()" value="SignUP" class="btn btn-primary"/>

                <label id="l1"></label>
            </div>



        </div>

    </body>
</html>
