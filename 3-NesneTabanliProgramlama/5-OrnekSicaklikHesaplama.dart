void main() {
  double celsius = 25;
  double fahrenheit = celsiusToFahrenheit(celsius);
  print ("$celsius santigrate is $fahrenheit fahrenheit");
}

double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}
