function getVals(){
  // Get slider values
  var parent = this.parentNode;
  var slides = parent.getElementsByTagName("input");
    var slide1 = parseFloat( slides[0].value );
    var slide2 = parseFloat( slides[1].value );
  // Neither slider will clip the other, so make sure we determine which is larger
  if( slide1 > slide2 ){ var tmp = slide2; slide2 = slide1; slide1 = tmp; }
  const numberWithCommas = (x) => {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  }

  var displayElement = parent.getElementsByClassName("rangeValues")[0];
      displayElement.innerHTML = numberWithCommas(slide1) + " $ - "
        + numberWithCommas(slide2) + " $";

  // displayElement.innerHTML = "$ " + slide1 + "k - $" + slide2 + "k";
  document.getElementById("range_min_price").value = slide1;
  document.getElementById("range_max_price").value = slide2;
}

window.onload = function(){
  // Initialize Sliders
  var sliderSections = document.getElementsByClassName("range-slider");
      for( var x = 0; x < sliderSections.length; x++ ){
        var sliders = sliderSections[x].getElementsByTagName("input");
        for( var y = 0; y < sliders.length; y++ ){
          if( sliders[y].type ==="range" ){
            sliders[y].oninput = getVals;
            // Manually trigger event first time to display values
            sliders[y].oninput();
          }
        }
      }
}
$( document ).ready(function() {
  $(".range-filter").change(function(){
    setTimeout(function(){
      $("#filter_form").submit();
    },1000)
  });
  $(".click-filter").change(function(){
    $("#filter_form").submit();
  });

  $("label[for='tendency_']").click(function(e) {
    e.preventDefault();
    $(this).parent().find("input[type='checkbox']").click();
    alert(1);
  });

  $(".check-filter").click(function(){
    if ($(this).prop( "checked" )){
      $(this).parent().find("label[for='tendency_']").addClass("color-blue");
    } else {
      $(this).parent().find("label[for='tendency_']").removeClass("color-blue");
    }
    // $("#filter_form").submit();
  });


});
