


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Shopkeeper</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-2.2.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>

        <script>
            function fetch_pending_shopkeeper()
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "./fetch_shopkeeper?status=" + "pending", true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    {
                        var res = xhr.responseText.trim();
                        alert(res);
                        var obj = JSON.parse(res);
                        var jsa = obj["ans"];

                        var ans = "";
                        ans += "<h1>Blocked Shopkeerpers</h1>";
                        ans += "<table class='table' style='margin-left:20px;'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <th>Shopkeeper name</th> <th>Photo</th> <th>email</th><th>city</th><th>shopname</th><th></th> </tr>";
                        ans += "</thead>";

                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<tr>";
                            ans += "<td>" + js["name"] + "</td>";
                            //ans += "<td>" + js["photo"] + "</td>";


                            ans += "<td><img src=\"" + js["photo"] + "\" width='100' height='100'  /></td>";
                            ans += "<td>" + js["email"] + "</td>";
                            ans += "<td>" + js["city"] + "</td>";
                            ans += "<td>" + js["shop_name"] + "</td>";

                            ans += "<td><input type='button'  value='Activate' onclick=\"activate_shopkeeper('"+js["email"]+"','active')\" class='btn btn-success' /></td>";
                            //ans += "<td><input type='button' onclick=\"edit_category('"+js["category_name"]+"','"+js["description"]+"')\" value='Edit' class='btn btn-danger'  data-toggle='modal' data-target='#myModal1' /></td>";
                            ans += "</tr>";
                        }


                        ans += "</tbody>";


                        ans += "</table>";

                        document.getElementById("main_content").innerHTML = ans;

                    }
                };
                xhr.send();
                fetchactiveshopkeepers();

            }
            function  fetchactiveshopkeepers()
            {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "./fetch_shopkeeper?status=" + "active", true);
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    {
                        var res = xhr.responseText.trim();
                        alert(res);
                        var obj = JSON.parse(res);
                        var jsa = obj["ans"];

                        var ans = "";
                        ans += "<h1>Active Shopkeerpers</h1>";
                        ans += "<table class='table' style='margin-left:20px;'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <th>Shopkeeper name</th> <th>Photo</th> <th>email</th><th>city</th><th>shopname</th><th></th> </tr>";
                        ans += "</thead>";

                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<tr>";
                            ans += "<td>" + js["name"] + "</td>";
                            //ans += "<td>" + js["photo"] + "</td>";


                            ans += "<td><img src=\"" + js["photo"] + "\" width='100' height='100'  /></td>";
                            ans += "<td>" + js["email"] + "</td>";
                            ans += "<td>" + js["city"] + "</td>";
                            ans += "<td>" + js["shop_name"] + "</td>";

                            ans += "<td><input type='button'  value='Block' onclick=\"activate_shopkeeper('"+js["email"]+"','pending')\" class='btn btn-success' /></td>";
                            //ans += "<td><input type='button' onclick=\"edit_category('"+js["category_name"]+"','"+js["description"]+"')\" value='Edit' class='btn btn-danger'  data-toggle='modal' data-target='#myModal1' /></td>";
                            ans += "</tr>";
                        }


                        ans += "</tbody>";


                        ans += "</table>";

                        document.getElementById("main_content1").innerHTML = ans;

                    }
                };
                xhr.send();




            }
            
            function activate_shopkeeper(email,pending)
            {
                alert(pending);
                var xhr=new XMLHttpRequest();
                xhr.open("GET","./activate_shopkeeper?status="+pending+"&email="+email,true);
                xhr.onreadystatechange=function ()
                {
                    if(xhr.readyState==4 && xhr.status==200)
                    {
                        var res=xhr.responseText.trim();
                        alert(res);
                        fetch_pending_shopkeeper();
                    }
                };
                xhr.send();
                
            }

        </script>
    </head>
    <body onload="fetch_pending_shopkeeper()">

        <div id="main_content">


        </div><hr>


        <div id="main_content1"></div>
    </body>
</html>
