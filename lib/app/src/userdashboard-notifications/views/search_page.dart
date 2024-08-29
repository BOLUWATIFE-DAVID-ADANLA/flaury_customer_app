import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/custom_button.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/bottom_modal.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: AppColors.white,
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
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.black,
                      ),
                      hintext: 'search',
                      obscureText: false,
                      onchanged: (String value) {},
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 2),
                  ),
                  SvgAssetsicons(
                    ontap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => CustomModal(
                                  size: 'big',
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppSpacing(
                                      v: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppTextBold(
                                            text: 'Filter', fontSize: 16),
                                        SvgAssetsicons(
                                          svg: close,
                                          height: SizeConfig.fromDesignHeight(
                                              context, 20),
                                          ontap: () => Navigator.pop(context),
                                        )
                                      ],
                                    ),
                                    AppTextRegular(
                                      text: 'Apply filter to search',
                                      fontSize: 14,
                                      color: AppColors.grey,
                                    ),
                                    const AppSpacing(v: 40),

                                    //select categories
                                    AppTextBold(
                                      text: 'Select category',
                                      fontSize: 14,
                                    ),

                                    const AppSpacing(v: 20),
                                    CustomDropDown(
                                      items: [],
                                      onChanged: (value) {},
                                      hint: 'Select category',
                                    ),

                                    const AppSpacing(v: 40),
                                    AppTextBold(
                                      text: 'Enter your Location',
                                      fontSize: 14,
                                    ),

                                    const AppSpacing(v: 20),
                                    CustomDropDown(
                                      items: [],
                                      onChanged: (value) {},
                                      hint: 'Enter Your Location',
                                    ),
                                    const AppSpacing(v: 40),
                                    Center(
                                      child: AppTextBold(
                                          text: 'Price Range', fontSize: 14),
                                    ),

                                    const AppSpacing(v: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        RangeTextfield(
                                          hinttext: 'Min',
                                        ),
                                        AppTextBold(
                                          text: '---',
                                          fontSize: 20,
                                        ),
                                        RangeTextfield(
                                          hinttext: 'Max',
                                        )
                                      ],
                                    ),

                                    const AppSpacing(v: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FilterButton(
                                          label: 'Reset',
                                          ontap: () {},
                                          textcolor: AppColors.primary,
                                          color: AppColors.primarylight,
                                        ),
                                        FilterButton(
                                          label: 'Apply Filter',
                                          ontap: () {},
                                          textcolor: AppColors.white,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    )
                                  ]));
                    },
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
