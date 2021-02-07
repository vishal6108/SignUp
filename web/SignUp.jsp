<%-- 
    Document   : SignUp
    Created on : 18-Jan-2021, 5:37:39 pm
    Author     : Amit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background: url(img/Black-butler-sebastian-michaelis-wallpapers-HD.jpg); background-size: cover; background-attachment: fixed; ">   
     <div class="container">
         <div class="row">
             <div class="col m6 offset-m3"">
                 <div class = "card">
                     <div class="card-content">
                         
                         <h3 style="margin-top: 10px;" class ="center-align">Register Here!</h3>
                         <h5 id="msg" class ="center-align"></h5>
                         <div class="form center-align">
                             <form action="Register" method="post" id="myform"> 
                             <input type="text" name = "user_name" placeholder="Enter Your Name">
                             <input type="password" name = "user_pass" placeholder="Enter Your Password">
                             <input type="email" name = "email" placeholder="Enter Your Email">
                              
                             
                             <div class="file-field input-field">
                                 <div class="btn red">
                                     <span>File</span>
                                     <input type="file" name ="image">
                                 </div>
                                 <div class="file-path-wrapper">
                                     <input class="file-path validate" type="text">
                                 </div>
                             </div>
                             
                              <button type="submit" class="btn red" name="">Submit
                              </button>

                             </form>
                         </div>


                         <div class="loader" style="display: none;" >


                             <div class="progress">
                                 <div class="indeterminate"></div>
                             </div>
                              
                             <h6 style="margin-bottom: 10px;" class="center-align">Please Wait...</h6>
                         </div>
                         
                     </div>
                 </div>
                     
             </div>
         </div>
         
    </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function(){

  console.log("Helllo")
  
  $("#myform").on('submit',function(event){
     
        event.preventDefault();
     
//     var f = $(this).serialize();
       let f = new FormData(this); 
     console.log(f);
     
     $(".loader").show();
     $(".form").hide();
     
     $.ajax({
         url: "Register",
         data : f,
         type : 'post',
         
         success: function(data,textStatus,jqHXR) {
         console.log(data);
         console.log("success......")
          $(".loader").hide();
          $(".form").show();
          
          if(data.trim() === 'Done')
          {
              $('#msg').html("Successfully Registerd !!")
              $('#msg').addClass('green-text')
          }
          else
          {
              $('#msg').html("Something went wrong on Server !!")
              $('#msg').addClass('red-text')
          }
         
         },
         
         error : function(jqHXR,textStatus,errorThrown) {
         console.log(data);
         console.log("error......")
         $(".loader").hide();
         $(".form").show();
         $('#msg').html("Something went wrong on Server !!")
         $('#msg').addClass('red-text')
         },
         processData: false,
         contentType: false,
         
         
         })
         })
         })
        </script>
    </body>
</html>
 