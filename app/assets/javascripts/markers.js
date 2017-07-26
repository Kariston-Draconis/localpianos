var settings = {url: '/api_current'}
var piano_locations

$.ajax(settings).done(function(result) {
  console.log(result.nearbys);
  piano_locations = result.nearbys
})
  
