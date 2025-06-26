import 'package:flaury_mobile/app/src/authentication/controllers/password_visiblity_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordvisible = ChangeNotifierProvider((ref) => Passwordvisible());
final passwordsvisible = ChangeNotifierProvider((ref) => Visibilitynew());
final confirmvisible = ChangeNotifierProvider((ref) => Visibilityconfirm());
