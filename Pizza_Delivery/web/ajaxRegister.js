/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 $(document).ready(function(){
              $("#uname").change(function(){
                  var uname = $(this).val();
                 
                      $(".status").html("<font color=gray> Checking availability...</font>");
                       $.ajax({
                          type: "POST",
                          url: "CheckAjaxC",
                          data: "uname="+ uname,
                         success: function(msg){
  $(".status").html(msg);
}
                      }); 
                     
              });
              
              
            
              
          });
          
    $(document).ready(function () {
   $("#rpassword").keyup(checkPasswordMatch);
   
});

function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#rpassword").val();

    if (password != confirmPassword)
        $(".message").html("Passwords do not match!");
    else
        $(".message").html("Passwords match.");
    
    
    
}

  var name;
     $("form").on("focusout", function(event){
         $(".field").each(function(){
             if($(this).val() === ""){
                 name = $(this).attr('name');
                 $("#"+name+" span").show();
             }
             else{
                  name = $(this).attr('name');
                 $("#"+name+" span").hide();
             }
         })
         event.preventDefault();
     })
          

     
 