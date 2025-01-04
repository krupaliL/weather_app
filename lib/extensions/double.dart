// This extension convert m/s to km/h
// m/s is the  default util for wind speed in openWeatherMap but we need to convert it to km/h

extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}