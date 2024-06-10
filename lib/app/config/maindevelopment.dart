import 'package:flaury_mobile/app/config/appconfig.dart';
import 'package:flaury_mobile/main.dart';
import 'package:flaury_mobile/app/shared/app_colors.dart';

Future<void> main() async {
  final devconfig = Appconfig(name: "development", swatchcolor: AppColors.red);
  maincommon(devconfig);
}
