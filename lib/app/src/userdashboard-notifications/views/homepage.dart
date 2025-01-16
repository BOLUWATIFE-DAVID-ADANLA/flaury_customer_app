import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/categories_icons.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/homepage_header.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    //greeting

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              const HomepageHeaderSection(),

              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),

                    // categories
                    SymetricPadding(
                        h: 20,
                        v: 0,
                        child: AppTextBold(text: 'Categories', fontSize: 18)),
                    SizedBox(height: SizeConfig.fromDesignHeight(context, 10)),
                    CustomPaddingLeft(
                      pad: 20,
                      child: SizedBox(
                        height: SizeConfig.fromDesignHeight(context, 113),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryitems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      SizeConfig.fromDesignWidth(context, 10),
                                  left: SizeConfig.fromDesignWidth(context, 0)),
                              child: CategoriesIcons(
                                label: categoryitems[index]['label'],
                                svg: categoryitems[index]['icon'],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    //nearby salons

                    SymetricPadding(
                        h: 20,
                        v: 0,
                        child:
                            AppTextBold(text: "Nearby Salon's", fontSize: 18)),
                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 10),
                    ),
                    CustomPaddingLeft(
                      pad: 20,
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 17,
                          children: [
                            ServiceCard(
                              ontap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.productServiceview);
                              },
                              img: catimg,
                              address: 'Adebayo, Ado-Ekiti',
                              businessName: 'Davole spa',
                              currentdistance: 20,
                              rating: 2.3,
                              totalReviews: 100,
                            ),
                            ServiceCard(
                              rating: 2.3,
                              totalReviews: 100,
                              currentdistance: 15,
                              img: img2,
                              address: 'Ajebandele, Ado-Ekiti',
                              businessName: 'Dubai executive',
                            ),
                            ServiceCard(
                              currentdistance: 10,
                              rating: 2.3,
                              totalReviews: 100,
                              img: catimg,
                              address: 'Bashiri, Ado-Ekiti',
                              businessName: "Kemi beauty home",
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 30),
                    ),

                    //special offers
                    SymetricPadding(
                        h: 20,
                        v: 0,
                        child:
                            AppTextBold(text: "Special Offers", fontSize: 18)),
                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 10),
                    ),
                    const CustomPaddingLeft(
                      pad: 20,
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 17,
                          children: [
                            SpecialOfferServiceCard(
                              discount: 10,
                              img: catimg,
                              address: 'Bdebayo, Ado-Ekiti',
                              businessName: 'Kavole spa',
                              currentdistance: 22,
                              rating: 4.7,
                              totalReviews: 100000,
                            ),
                            SpecialOfferServiceCard(
                              rating: 2.3,
                              discount: 10,
                              totalReviews: 130,
                              img: img2,
                              address: 'Ajebandele, Ado-Ekiti',
                              businessName: 'Dubai executive',
                            ),
                            SpecialOfferServiceCard(
                              discount: 10,
                              currentdistance: 60,
                              rating: 3.3,
                              totalReviews: 1220,
                              img: catimg,
                              address: 'Bashiri, Ado-Ekiti',
                              businessName: "Kemi beauty home",
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 30),
                    ),

                    //recommended
                    SymetricPadding(
                        h: 20,
                        v: 0,
                        child: AppTextBold(text: "Recommended", fontSize: 18)),
                    SizedBox(
                      height: SizeConfig.fromDesignHeight(context, 10),
                    ),
                    const CustomPaddingLeft(
                      pad: 20,
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 17,
                          children: [
                            ServiceCard(
                              img: catimg,
                              address: 'Adebayo, Ado-Ekiti',
                              businessName: ' Davole spa',
                              currentdistance: 20,
                              rating: 2.3,
                              totalReviews: 100,
                            ),
                            ServiceCard(
                              rating: 2.3,
                              totalReviews: 100,
                              currentdistance: 15,
                              img: img2,
                              address: 'Ajebandele, Ado-Ekiti',
                              businessName: ' Dubai executive',
                            ),
                            ServiceCard(
                              currentdistance: 10,
                              rating: 2.3,
                              totalReviews: 100,
                              img: catimg,
                              address: 'Bashiri, Ado-Ekiti',
                              businessName: "Kemi beauty home",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> categoryitems = [
  {
    'label': 'Makeup',
    'icon': makeup,
  },
  {
    'label': 'Haircut',
    'icon': haircut,
  },
  {
    'label': 'Nail Technician',
    'icon': nails,
  },
  {
    'label': 'Facials',
    'icon': facials,
  },
  {
    'label': 'Hair Stylist',
    'icon': hairStyle,
  },
  {
    'label': 'Massage therapy',
    'icon': massage,
  },
  {
    'label': 'spa',
    'icon': spa,
  },
];
