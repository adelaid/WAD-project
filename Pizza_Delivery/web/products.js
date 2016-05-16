/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



//$(document).ready(function(){
//              $("#crust").change(function(){
//                  var crust = $(this).val();
//                 
//                      $("#a").html("<font color=gray> aaa.</font>");
//                       $.ajax({
//                          type: "POST",
//                          url: "CheckAjaxC",
//                          data: "crust="+ crust,
//                         success: function(msg2){
//  $("#a").html(msg2);
//}
//                      }); 
//                     
//              });
//              
//              
//            
//              
//          });
              $(document).ready(function(){
        $('#crust').change(function(){
            $('.crust').hide();
            $('#' + $(this).val()).show();
            
        });
    });
    
      $(document).ready(function(){
        $('#sauce').change(function(){
            $('.sauce').hide();
            $('#' + $(this).val()).show();
        });
    });
    
        $(document).ready(function(){
        $('#cheese').change(function(){
            $('.cheese').hide();
            $('#' + $(this).val()).show();
        });
    });
    
 