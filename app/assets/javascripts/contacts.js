$(function() {
  // limits the number of categories
  $('#phones').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#phones').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();

  function check_to_hide_or_show_add_link() {
    if ($('.nested-fields').length == 3) {
      $('#add-phone').hide();
    } else {
      $('#add-phone').show();
    }
  }
})
