/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 $(document).ready(function(){
              $(".uname").change(function(){
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
     
 