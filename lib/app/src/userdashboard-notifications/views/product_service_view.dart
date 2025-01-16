import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/custom_button.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/book_service_card.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/profile_service_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    GalleryTab(),
    ReviewsTab(),
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
                      ontap: () {},
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
                      ontap: () {
                        Navigator.pop(context);
                      },
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
            SliverFillRemaining(child: tabs[selectedindex])
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
    int i;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpacing(v: 20),
          //business name and rating
          SymetricPadding(
            h: 20,
            v: 0,
            child: Row(
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
          ),
          //address , time open
          SymetricPadding(
            h: 20,
            v: 0,
            child: Row(
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
                  padding:
                      EdgeInsets.all(SizeConfig.fromDesignHeight(context, 10)),
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
          ),
          const AppSpacing(v: 20),

          // service list
          SymetricPadding(
              v: 0, h: 20, child: AppTextBold(text: 'Services', fontSize: 18)),

          for (i = 0; i < 4; i++)
            const SymetricPadding(h: 20, v: 0, child: BookServiceCard()),

          const AppSpacing(v: 35),

          //see all button
          SymetricPadding(
              h: 20,
              v: 0,
              child: LargeButtoncustom(
                label: 'See all',
                ontap: () {},
              )),

          const AppSpacing(v: 35),
        ],
      ),
    );
  }
}

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            child: Image.asset(images[index]),
          ),
        );
      },
    );
  }
}

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SymetricPadding(
      h: 20,
      v: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpacing(v: 10),
          AppTextBold(text: 'Reviews', fontSize: 20),
        ],
      ),
    );
  }
}

List<String> images = [
  "assets/images/img1.png",
  "assets/images/img2.png",
  "assets/images/img3.png",
  "assets/images/img4.jpg",
  "assets/images/img5.jpg",
  "assets/images/img6.png",
];
