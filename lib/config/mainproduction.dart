import 'package:flaury_mobile/config/appconfig.dart';
import 'package:flaury_mobile/maincommon.dart';

Future<void> main() async {
  final devconfig = Appconfig(
    name: "development",
  );
  maincommon(devconfig);
}
