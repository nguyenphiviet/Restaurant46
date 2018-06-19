$( document ).ready(function() {
  $('#my-calendar').zabuto_calendar({
    today: true,
  });
});

$(document).ready(function(){
  $('.search-btn').click(function(){
    $('.search-bar').toggle(500);
  });

  $('.quantity').on('change', function(){
    var quantity = $(this).val();
    var dish_id = $(this).prev('input').val();
    $.ajax({
      url: 'carts/' + dish_id,
      method: 'PUT',
      data: {quantity: quantity}
    });
  });
});
