$(document).ready(function() {



  $('.add').click(function(){
    // $('#choices').clone(true).appendTo('#choices');

    $('#choices').append('<p><input type="text" name="choices[]" class = "input"></p>');

  });

  $('.remove').click(function(){
    $('#choices p:last').remove();
  });
});
