import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String address, businessName, img;
  final int? currentdistance, totalReviews;
  final double? rating;

  const ServiceCard({
    super.key,
    required this.address,
    required this.businessName,
    required this.img,
    this.currentdistance,
    this.totalReviews,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.fromDesignWidth(context, 250),
      height: SizeConfig.fromDesignHeight(context, 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.fromDesignHeight(context, 129),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.fromDesignHeight(context, 5),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppTextBold(text: businessName, fontSize: 16),
                      SizedBox(
                        width: SizeConfig.fromDesignWidth(context, 5),
                      ),
                      const SvgAssets(svg: verifiedBadge),
                    ],
                  ),
                  Row(
                    children: [
                      AppTextBold(text: '$rating', fontSize: 12),
                      SizedBox(width: SizeConfig.fromDesignWidth(context, 5)),
                      const SvgAssets(svg: reviewStar),
                      SizedBox(width: SizeConfig.fromDesignWidth(context, 5)),
                      AppTextBold(text: '($totalReviews)', fontSize: 8),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  //addresss
                  AppTextSemiBold(text: address, fontSize: 10),
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 5),
                  ),
                  Container(
                    height: 4,
                    width: 4,
                    color: AppColors.black,
                  ),
                  //diatance
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 5),
                  ),
                  AppTextSemiBold(
                      text: '$currentdistance km away', fontSize: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SpecialOfferServiceCard extends StatelessWidget {
  final String address, businessName, img;
  final int? currentdistance, discount, totalReviews;
  final double? rating;
  const SpecialOfferServiceCard(
      {super.key,
      required this.address,
      required this.businessName,
      required this.img,
      this.currentdistance,
      this.totalReviews,
      this.rating,
      this.discount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.fromDesignWidth(context, 250),
      height: SizeConfig.fromDesignHeight(context, 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.fromDesignHeight(context, 129),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  img,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.fromDesignHeight(context, 5),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppTextBold(text: businessName, fontSize: 16),
                      SizedBox(
                        width: SizeConfig.fromDesignWidth(context, 5),
                      ),
                      const SvgAssets(svg: verifiedBadge),
                    ],
                  ),
                  Row(
                    children: [
                      AppTextBold(text: '$rating', fontSize: 12),
                      SizedBox(width: SizeConfig.fromDesignWidth(context, 5)),
                      const SvgAssets(svg: reviewStar),
                      SizedBox(width: SizeConfig.fromDesignWidth(context, 5)),
                      AppTextBold(text: '($totalReviews)', fontSize: 10),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  //addresss
                  AppTextSemiBold(text: address, fontSize: 10),
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 5),
                  ),
                  Container(
                    height: 4,
                    width: 4,
                    color: AppColors.black,
                  ),
                  //diatance
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 5),
                  ),
                  AppTextSemiBold(
                      text: '$currentdistance km away', fontSize: 10),
                ],
              ),
            ],
          ),

          //cupon
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
                        text: 'SAVE UP TO $discount%', fontSize: 6)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
