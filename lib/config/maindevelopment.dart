import 'package:flaury_mobile/config/appconfig.dart';
import 'package:flaury_mobile/maincommon.dart';
import 'package:flaury_mobile/shared/app_colors.dart';

Future<void> main() async {
  final devconfig = Appconfig(name: "development", satchcolor: AppColors.red);
  maincommon(devconfig);
}
