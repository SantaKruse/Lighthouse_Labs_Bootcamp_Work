$(document).ready(function() {  
  $("#loginimage").click(function(){
    $("body").fadeOut();
  });

  function getQuestion(assignID,difficulty, cb) {
    $.ajax({
      url: '/generate_question',
      method: 'GET',
      data: {assignment_id: assignID, difficulty: difficulty},
      success: function(data) {
        cb(data); // javascript callback used to keep context when get info needed
      },
    });
  }

  // everytime a radio input is clicked grab input's val so we can use ajax
  $("input").on('click', function() {
    var self = this;
    var value = $(this).val();
    var assignment_id = $(this).data('assignmentid');

    if ($(this).parent().parent().parent().attr('class') == 'rating_response assignments'){
      
      getQuestion(assignment_id,value, function(data) {
        var el = $(self).parent().parent().parent().find('#question_text') // grabs the element that needs to be updated
        el.text(data.question); // inputs the question the html element
        el.parent().parent().parent().find('.question_response').fadeIn(); // shows the elements with class question_response 
      });
    }
  });




  $(".cannon").on('click',function(){
    $(this).fadeOut();
  });

});

