/// {@template weather_location}
/// Represents available locations.
/// {@endtemplate}
enum WeatherLocation {
  local(latitude: double.infinity, longitude: double.infinity),
  iqbOffice(latitude: 49.01815, longitude: 8.46501),
  buergerParkSaarbruecken(latitude: 49.23821, longitude: 6.98167);

  /// {@macro weather_location}
  const WeatherLocation({required this.latitude, required this.longitude});

  /// The latitude.
  final double latitude;

  /// The longitude.
  final double longitude;
}
