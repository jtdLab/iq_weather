import 'package:iq_weather/app/app.dart';
import 'package:iq_weather/bootstrap.dart';
import 'package:iq_weather/config/flavor.dart';

void main() {
  flavor = Flavor.development;
  bootstrap(() => const App());
}
