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
//= require jquery-ui
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
  // $('.home-footer').css('top',$(document).height() + 'px');

// submit on enter - comments
  $("#texarea.form-control.text.required").keypress(function(event) {
    if (event.which == 13) {
      console.log(event);
      event.preventDefault();
      $(this).closest("#new_comment").submit();
      // $("#" + event.toElement.parentElement.id + " form").submit();
    }
  });

  // problem: only submits to the first post- prob because they all have the same id

//toggle comments
// http://www.theappguruz.com/blog/dynamic-event-binding-demo-jquery
// problems:
// 2-posts created with ajax can't toggle
  // $("form#new_comment.simple_form.new_comment").hide();
  // $("div.comm-btn"on("click", function() {
  // $("form#new_comment.simple_form.new_comment").toggle();
  // });

  $("form#new_comment.simple_form.new_comment").hide();
  $(document).on('click', '.comm-btn', function (event) {
     var nextID = 'id' + (new Date()).getTime();
     var comm = "<div id=\"div" + nextID + "\">";
     $(".comm-btn").closest("#new_comment").append(comm);
    // $("div.post-background").closest("#new_comment").append(comm);
    $("#" + event.toElement.parentElement.nextElementSibling.id + " form").toggle();
  });

})
