// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$("#menu-toggle").click(function(e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});
$(function () {
  $(".shop_car").click(function(e) {
    $("#shop_cont").addClass('show');
  });
  $("#close_cont").click(function(e) {
    $("#shop_cont").removeClass('show');
  });
})
