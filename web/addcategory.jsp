<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Category</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
         <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            function photo_edit()
            {
                   var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form3").elements;

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


                    xhr.open("POST", "./editphoto", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                               fetch();
                               $('#myModal2').modal('hide');

                        }
                    };



                    xhr.send(formdata);
                }

                
                
            }
            
            
            function edit_photo(category_name,photo)
            {
                document.getElementById("category_name3").value=category_name;
                document.getElementById("im3").src=photo;
                
            }
            
            function edit_category(category_name,description)
            {
                alert(category_name+" "+description );
             document.getElementById("category_name2").value=category_name;
             document.getElementById("category_description2").value=description;
   //             document.getElementById("im2").src=photo;
                
                
            }
        
              function del_category(category_name)
            {
                
                alert(category_name);
                var ans = confirm('Are you sure you want to delete?');
                if(ans==true)
                {
                    
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET","./DeleteCategory?category_name="+category_name,true);
                    xhr.onreadystatechange =function ()
                    {
                        if(xhr.readyState==4 && xhr.status==200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                            if(res=="success")
                            
                            
                            {
                                fetch();
                            }
                        }
                    };
                    xhr.send();
                }
            }

            function fetch()
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "./GetAllCategory", true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    {
                        var res = xhr.responseText.trim();
                //        document.getElementById("res").innerHTML = res;
                alert(res);

                        var obj = JSON.parse(res);
                        var jsa = obj["ans"];

                        var ans = "";

                        ans += "<table class='table' style='margin-left:20px;'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <th>Category name</th> <th>Category description</th> <th>photo</th><th></th><th></th> </tr>";
                        ans += "</thead>";

                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<tr>";
                            ans += "<td>" + js["category_name"] + "</td>";
                            ans += "<td>" + js["description"] + "</td>";
                         //   ans += "<td>" + js["photo"] + "</td>";
                            
                            ans += "<td><img src=\""+js["photo"]+"\" width='100' height='100'  /><br><a href=\"#\" onclick=\"edit_photo('"+js["category_name"]+"','"+js["photo"]+"')\" data-toggle='modal' data-target='#myModal2' >Edit Picture</a></td>";
                            ans += "<td><input type='button' onclick=\"del_category('"+js["category_name"]+"')\" value='Delete' class='btn btn-danger' /></td>";
                            ans += "<td><input type='button' onclick=\"edit_category('"+js["category_name"]+"','"+js["description"]+"')\" value='Edit' class='btn btn-danger'  data-toggle='modal' data-target='#myModal1' /></td>";
                            ans += "</tr>";
                        }


                        ans += "</tbody>";


                        ans += "</table>";

                        document.getElementById("main_content").innerHTML = ans;

                    }
                };
                xhr.send();

            }



            function add()
            {
                var cn=document.getElementById("category_name").value;
                var cd=document.getElementById("category_description").value;
                if(cn=="" || cd=="")
                {
                    alert("all fields are mandatory");
                }
                else{
                
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


                    xhr.open("POST", "./addcategory", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                               fetch();

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
            
            function final_edit()
            {
                   var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form2").elements;

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


                    xhr.open("POST", "./editcategory", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                               fetch();
                               $('#myModal1').modal('hide');

                        }
                    };



                    xhr.send(formdata);
                }

            }



        </script>
    </head>
    <body onload="fetch()">
        <div clss="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron" style="background-color: white;">
                        <center><h1>Manage Category</h1></center>
                    </div>
                </div>
            </div>
            <div class=" col-md-6 col-md-offset-3" id="myForm"> 
                <form role="form"  action="#" method="POST" enctype="multipart/form-data" id="form1">


                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;">Category Name</label>
                        <input  type="text" id="category_name" name="category_name" class="form-control" placeholder="category name" ><br>

                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Category Description</label>
                        <input  type="text" class="form-control" placeholder="Description" id="category_description" name="category_description" ><br>

                    </div>

                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;"> Category Photo</label>
                        <input  type="file" class="form-control"  id="category_photo" name="category_photo" onchange="readandpreview(this, 'im1')" > 
                        <img src="" id="im1" style="width:100px; height:100px;">

                    </div>


                </form>
                <input type="button" onclick="add()" value="Add Category" class="btn btn-primary"/>

                <label id="l1"></label>
            </div>
            <div id="main_content" style="margin-top: 20px;">
                
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
                      <form role="form"  action="#" method="POST" enctype="multipart/form-data" id="form2">


                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;">Category Name</label>
                        <input  type="text" id="category_name2" name="category_name2" class="form-control" placeholder="category name" disabled><br>

                    </div>

                    <div class="form-group">
                        <label style="font-family: cursive; font-size: 20px;"> Category Description</label>
                        <input  type="text" class="form-control" placeholder="Description" id="category_description2" name="category_description2" ><br>

                    </div>

<!--                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;"> Category Photo</label>
                       <input  type="file" class="form-control"  id="category_photo2" name="category_photo2" onchange="readandpreview(this, 'im2')" > 
                        <img src="" id="im2" style="width:100px; height:100px;">

                    </div>
-->

                </form>
                        <input type="button"  value="Edit Category" class="btn btn-primary" onclick="final_edit()"/>

                <label id="l2"></label>
                    </div>
                    <div class="modal-footer">

                    </div>                    
                </div>
            </div>
        </div>
        
        
        
        
        
            <div id="myModal2" class="modal fade">
            <div class="modal-dialog"> 
                <div class="modal-content">                    
                    <div class="modal-header">
                        <a href="#" class="close" data-dismiss="modal">&times;</a>
                                                
                    </div>
                    <div class="modal-body">
                      <form role="form"  action="#" method="POST" enctype="multipart/form-data" id="form3">


                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;">Category Name</label>
                        <input  type="text" id="category_name3" name="category_name2" class="form-control" placeholder="category name" disabled><br>

                    </div>


                    <div class="form-group" >
                        <label style="font-family: cursive; font-size: 20px;"> Category Photo</label>
                       <input  type="file" class="form-control"  id="category_photo3" name="category_photo2" onchange="readandpreview(this, 'im3')" > 
                        <img src="" id="im3" style="width:100px; height:100px;">

                    </div>


                </form>
                        <input type="button"  value="Edit photo" class="btn btn-primary" onclick="photo_edit()"/>

                <label id="l2"></label>
                    </div>
                    <div class="modal-footer">

                    </div>                    
                </div>
            </div>
        </div>
    </body>
</html>
