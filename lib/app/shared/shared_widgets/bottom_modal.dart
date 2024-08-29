import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class CustomModal extends StatefulWidget {
  final List<Widget> children;
  final String size;
  final CrossAxisAlignment crossAxisAlignment;
  const CustomModal(
      {super.key,
      required this.children,
      required this.size,
      this.crossAxisAlignment = CrossAxisAlignment.center});

  @override
  State<CustomModal> createState() => _CustomModal();
}

class _CustomModal extends State<CustomModal> {
  @override
  Widget build(BuildContext context) {
    double getHeight() {
      switch (widget.size) {
        case 'big':
          return MediaQuery.of(context).viewInsets.bottom +
              SizeConfig.fromDesignHeight(context, 550);
        case 'medium':
          return MediaQuery.of(context).viewInsets.bottom +
              SizeConfig.fromDesignHeight(context, 450);
        case 'small':
          return MediaQuery.of(context).viewInsets.bottom +
              SizeConfig.fromDesignHeight(context, 355);
        default:
          return MediaQuery.of(context).viewInsets.bottom +
              SizeConfig.fromDesignHeight(context, 355);
      }
    }

    return Container(
      height: getHeight(),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.fromDesignWidth(context, 20)),
        child: Column(
            crossAxisAlignment: widget.crossAxisAlignment,
            children: widget.children),
      ),
    );
  }
}

class ModalToggle extends StatelessWidget {
  const ModalToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.fromDesignHeight(context, 5),
      width: SizeConfig.fromDesignWidth(context, 134),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.grey,
      ),
    );
  }
}
