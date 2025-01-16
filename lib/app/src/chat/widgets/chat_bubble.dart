import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math; //

class Triangle extends CustomPainter {
  final Color bgColor;

  Triangle(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SentChatBubble extends StatelessWidget {
  final String message;
  final String time;

  const SentChatBubble({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 14)),
            decoration: const BoxDecoration(
              color: AppColors.greychat,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextRegular(
                  text: message,
                  fontSize: 10,
                  overflow: TextOverflow.clip,
                ),
                const AppSpacing(v: 10),

                // timestamp
                AppTextRegular(
                  text: time,
                  fontSize: 8,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ),
        CustomPaint(painter: Triangle(AppColors.greychat)),
      ],
    ));

    return Padding(
      padding: EdgeInsets.only(
          right: 0.0,
          left: SizeConfig.fromDesignWidth(context, 50),
          top: SizeConfig.fromDesignHeight(context, 5),
          bottom: SizeConfig.fromDesignHeight(context, 5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const AppSpacing(v: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}

class ReceivedChatBubble extends ConsumerWidget {
  final String message;
  final String time;

  const ReceivedChatBubble(
      {super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: Triangle(AppColors.secondary),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 14)),
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppTextRegular(
                  text: message,
                  fontSize: 10,
                  overflow: TextOverflow.clip,
                ),
                const AppSpacing(v: 10),

                // timestamp
                AppTextRegular(
                  text: time,
                  fontSize: 8,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ),
      ],
    ));

    return Padding(
      padding: EdgeInsets.only(
          right: SizeConfig.fromDesignWidth(context, 55),
          left: 0,
          top: SizeConfig.fromDesignHeight(context, 5),
          bottom: SizeConfig.fromDesignHeight(context, 5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const AppSpacing(v: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
