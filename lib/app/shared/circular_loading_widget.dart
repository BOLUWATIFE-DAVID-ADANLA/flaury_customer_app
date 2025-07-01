import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flutter/material.dart';

class CircularLoadingWidget extends StatefulWidget {
  final bool isButton;
  final bool showTitle;

  const CircularLoadingWidget(
      {super.key, this.isButton = false, this.showTitle = true});

  @override
  State<CircularLoadingWidget> createState() => _CircularLoadingWidgetState();
}

class _CircularLoadingWidgetState extends State<CircularLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isButton) {
      return Padding(
        padding: EdgeInsets.all(3.5),
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          width: 45,
          height: 45,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Circular progress indicator
              SizedBox(
                width: 35,
                height: 35,
                child: const CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(0, 112, 186, 0.08),
                  color: AppColors.primary,
                  // valueColor: _controller.drive(
                  //   ColorTween(
                  //       end: Color.fromRGBO(0, 112, 186, 1),
                  //       begin: Color.fromRGBO(0, 51, 84, 1)),
                  // ),
                  strokeWidth: 3,
                  value: null, // null makes it spin indefinitely
                ),
              ),
              // Inner text
              if (widget.showTitle)
                Container(
                  margin: EdgeInsets.all(2),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: (0.1)),
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                      child: SvgAssets(
                    svg: appicon,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  )),
                ),
            ],
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        // backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            width: 100,
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Circular progress indicator
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: const Color.fromRGBO(0, 112, 186, 0.08),
                    valueColor: _controller.drive(
                      ColorTween(
                          end: AppColors.primary,
                          begin: AppColors.primarylight),
                    ),
                    strokeWidth: 6,
                    value: null, // null makes it spin indefinitely
                  ),
                ),
                // Inner text

                Container(
                  margin: EdgeInsets.all(2),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: (0.1)),
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                      child: SvgAssets(
                    svg: appicon,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
