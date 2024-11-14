import 'package:iq_weather/app/app.dart';
import 'package:iq_weather/bootstrap.dart';
import 'package:iq_weather/config/flavor.dart';

Future<void> main() async {
  flavor = Flavor.staging;
  await bootstrap(() => const App());
}
