import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/config/appconfig.dart';
import 'package:flaury_mobile/main.dart';

Future<void> main() async {
  final devconfig = Appconfig(name: "development", satchcolor: AppColors.red);
  maincommon(devconfig);
}
