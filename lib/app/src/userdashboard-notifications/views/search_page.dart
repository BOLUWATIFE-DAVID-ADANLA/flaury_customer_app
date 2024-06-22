import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: SafeArea(
            child: SymetricPadding(
          h: 20,
          v: 0,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const ImageIcon(AssetImage(back), size: 20),
                  ),
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 260),
                    child: MainCustomTextfield(
                      hintext: 'Serach',
                      obscureText: false,
                      onchanged: (String value) {},
                    ),
                  ),
                  SvgAssetsicons(
                    ontap: () {},
                    svg: filter,
                    height: SizeConfig.fromDesignHeight(context, 42),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
