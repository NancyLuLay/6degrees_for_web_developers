// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require cocoon
//= require jquery.purr
//= require best_in_place
//= require_tree .

// Navbar color change when scrolling down
$(document).ready(function(){
  // navbar
  setInterval(function(){
    if ($(this).scrollTop() > 50) {
      $('#navbar').css('background-color', '#3f3f3f');
    } else {
      $('#navbar').css('background-color', 'transparent');
    }
  });

// footer
  $('.home-footer').css('top',$(document).height() + 'px');

// submit on enter - comments
  $("#comment_comment_body").keypress(function(event) {
    if (event.which == 13) {
      $(this).closest('form').submit();
    }
  });

//toggle comments
  $("form#new_comment.simple_form.new_comment").hide();
  $("div#comm-btn.btn.btn-default").click(function(event) {
      $("form#new_comment.simple_form.new_comment").toggle();
  });

})
