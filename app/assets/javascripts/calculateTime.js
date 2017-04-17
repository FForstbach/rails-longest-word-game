$(document).ready(function(){

  var timeNow = new Date();

  $("#word_input").on("submit", function (){
    var timeClick = new Date();
    console.log(timeClick);
    console.log(timeNow);
    var timeTotal = ( timeClick - timeNow ) / 1000
    console.log(timeTotal);
    $("#time_value").attr("value", timeTotal);
  });
});
