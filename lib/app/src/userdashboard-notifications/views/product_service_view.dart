import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/categories_icons.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/profile_service_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductServiceView extends ConsumerStatefulWidget {
  const ProductServiceView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductServiceViewState();
}

class _ProductServiceViewState extends ConsumerState<ProductServiceView> {
  int selectedindex = 0;
  void _selectTab(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List<Widget> tabs = const [
    ServiceTab(),
    Center(child: Text('gallery')),
    Center(child: Text('reviews')),
    Center(child: Text('about')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.background,
              shadowColor: AppColors.background,
              pinned: true,
              stretch: true,
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              expandedHeight: SizeConfig.fromDesignHeight(context, 300),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(fit: StackFit.expand, children: [
                  Image.asset(
                    catimg,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: SizeConfig.fromDesignWidth(context, 20),
                    top: SizeConfig.fromDesignHeight(context, 20),
                    child: ProfileButtons(
                      icon: blackFave,
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    right: SizeConfig.fromDesignWidth(context, 100),
                    top: SizeConfig.fromDesignHeight(context, 20),
                    child: ProfileButtons(
                      icon: share,
                      ontap: () {},
                    ),
                  ),
                  Positioned(
                    right: SizeConfig.fromDesignWidth(context, 305),
                    top: SizeConfig.fromDesignHeight(context, 20),
                    child: ProfileButtons(
                      icon: back,
                      ontap: () {},
                    ),
                  )
                ]),
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground
                ],
              ),
            ),
            // this is the tabbar

            SliverAppBar(
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 52,
                  decoration: const BoxDecoration(
                      color: AppColors.background,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey,
                            blurStyle: BlurStyle.normal,
                            blurRadius: 5,
                            spreadRadius: 5)
                      ]),
                  child: CustomPaddingTBRL(
                    r: 14,
                    b: 0,
                    l: 14,
                    t: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => _selectTab(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextBold(text: 'Services', fontSize: 16),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 3,
                                  width: selectedindex == 0
                                      ? SizeConfig.fromDesignWidth(context, 61)
                                      : 0,
                                  color: selectedindex == 0
                                      ? AppColors.primary
                                      : Colors.transparent,
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () => _selectTab(1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextBold(text: 'Gallery', fontSize: 16),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 3,
                                  width: selectedindex == 1
                                      ? SizeConfig.fromDesignWidth(context, 51)
                                      : 0,
                                  color: selectedindex == 1
                                      ? AppColors.primary
                                      : Colors.transparent,
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () => _selectTab(2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextBold(text: 'Reviews', fontSize: 16),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 3,
                                  width: selectedindex == 2
                                      ? SizeConfig.fromDesignWidth(context, 61)
                                      : 0,
                                  color: selectedindex == 2
                                      ? AppColors.primary
                                      : Colors.transparent,
                                ),
                              ],
                            )),
                        InkWell(
                            onTap: () => _selectTab(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextBold(text: 'About', fontSize: 16),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 3,
                                  width: selectedindex == 3
                                      ? SizeConfig.fromDesignWidth(context, 41)
                                      : 0,
                                  color: selectedindex == 3
                                      ? AppColors.primary
                                      : Colors.transparent,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: tabs[selectedindex])
          ],
        ),
      ),
    );
  }
}

class ServiceTab extends ConsumerWidget {
  const ServiceTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSpacing(v: 20),
        //business name and rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppTextBold(text: 'Timeless Salon', fontSize: 20),
                SizedBox(
                  width: SizeConfig.fromDesignWidth(context, 5),
                ),
                const SvgAssets(svg: verifiedBadge),
              ],
            ),
            Row(
              children: [
                AppTextBold(text: '40', fontSize: 16),
                SizedBox(width: SizeConfig.fromDesignWidth(context, 5)),
                SvgAssets(
                  svg: reviewStar,
                  height: SizeConfig.fromDesignHeight(context, 16),
                ),
                SizedBox(width: SizeConfig.fromDesignWidth(context, 5)),
                AppTextBold(text: '(1200)', fontSize: 12),
              ],
            ),
          ],
        ),
        //address , time open
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //addresss
                    AppTextBold(text: 'Dome Hills, Idan', fontSize: 16),
                    SizedBox(
                      width: SizeConfig.fromDesignWidth(context, 5),
                    ),
                    const SvgAssets(
                      svg: mapPosition,
                    ),
                    //diatance
                    SizedBox(
                      width: SizeConfig.fromDesignWidth(context, 5),
                    ),
                    AppTextSemiBold(text: '20 km', fontSize: 12),
                  ],
                ),
                AppTextSemiBold(
                    text: 'Open until 8:00pm',
                    fontSize: 14,
                    color: AppColors.grey),

                // cupon
                Container(
                  height: SizeConfig.fromDesignHeight(context, 18),
                  width: SizeConfig.fromDesignWidth(context, 76),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.category,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SvgAssets(svg: cupon),
                      SizedBox(
                        width: SizeConfig.fromDesignWidth(context, 2),
                      ),
                      Center(
                          child: AppTextSemiBold(
                              text: 'SAVE UP TO 10%', fontSize: 6)),
                    ],
                  ),
                )
              ],
            ),

            // chat with me button
            Container(
              padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 10)),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: AppColors.primary),
              child: AppTextBold(
                text: 'Chat with me',
                fontSize: 12,
                color: AppColors.white,
              ),
            )
          ],
        ),
        const AppSpacing(v: 20),

        // service list
        AppTextBold(text: 'Services', fontSize: 18),

        SizedBox(
          height: SizeConfig.fromDesignHeight(context, 39),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryitems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.fromDesignWidth(context, 10),
                    left: SizeConfig.fromDesignWidth(context, 0)),
                child: CategoriesServiceIcons(
                  label: categoryitems[index],
                ),
              );
            },
          ),
        ),

        //
        const AppSpacing(v: 400)
      ],
    );
  }
}

List<String> categoryitems = [
  "Makeup service",
  "Nail Services",
  "Lashes & Brows",
  "Hair Services",
  "Basic Facials",
  "Massage therapy",
  "Gele (Hair-tie)",
  "Body treatment",
];
