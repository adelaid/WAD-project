/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var logID = 'log',
  log = $('<div id="'+logID+'"></div>');
$('body').append(log);
  $('[type*="radio"]').change(function () {
    var me = $(this);
    log.html(me.attr('value'));
  });