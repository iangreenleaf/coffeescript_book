/*
 * formatTemperature(degrees, scale='K')
 */
function formatTemperature(degrees, scale) {
  if (typeof scale === "undefined") {
    scale = "K";
  }
  var formatted = degrees.toFixed(1);
  formatted += (scale.toUpperCase() === 'K') ? " " : "°";
  return formatted + scale.toUpperCase();
}

console.log(formatTemperature(22.35, "C"));
console.log(formatTemperature(42));

function formattedAverageTemperature(scale /*, temperatures...*/) {
  var sum = 0;
  for (i=1; i<arguments.length; i++) {
    sum += arguments[i];
  }
  return formatTemperature(sum / (arguments.length - 1), scale)
}

console.log(formattedAverageTemperature("F", 98, 10, 32));
