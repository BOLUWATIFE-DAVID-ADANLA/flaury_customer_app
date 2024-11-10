import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class AppSpacing extends StatelessWidget {
  const AppSpacing({super.key, this.v = 0, this.h = 0});
  //horizontal space
  // factory AppSpacing.h12() => const AppSpacing(h: 12);
  // factory AppSpacing.h14() => const AppSpacing(h: 14);
  // factory AppSpacing.h16() => const AppSpacing(h: 16);
  // factory AppSpacing.h18() => const AppSpacing(h: 18);
  // factory AppSpacing.h20() => const AppSpacing(h: 20);
  // factory AppSpacing.h22() => const AppSpacing(h: 22);
  // factory AppSpacing.h24() => const AppSpacing(h: 24);
  // factory AppSpacing.h26() => const AppSpacing(h: 26);
  // factory AppSpacing.h28() => const AppSpacing(h: 28);
  // factory AppSpacing.h30() => const AppSpacing(h: 30);
  // factory AppSpacing.h32() => const AppSpacing(h: 32);
  // vertical space
  // factory AppSpacing.v12() => const AppSpacing(v: 12);
  // factory AppSpacing.v14() => const AppSpacing(v: 14);
  // factory AppSpacing.v16() => const AppSpacing(v: 16);
  // factory AppSpacing.v18() => const AppSpacing(v: 18);
  // factory AppSpacing.v20() => const AppSpacing(v: 20);
  // factory AppSpacing.v22() => const AppSpacing(v: 22);
  // factory AppSpacing.v24() => const AppSpacing(v: 24);
  // factory AppSpacing.v26() => const AppSpacing(v: 26);
  // factory AppSpacing.v28() => const AppSpacing(v: 28);
  // factory AppSpacing.v30() => const AppSpacing(v: 30);
  // factory AppSpacing.v32() => const AppSpacing(v: 32);
  final int h;
  final int v;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.fromDesignWidth(context, h.toDouble()),
      height: SizeConfig.fromDesignHeight(context, v.toDouble()),
    );
  }
}
