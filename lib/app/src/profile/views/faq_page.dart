import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/custom_padding.dart';
import 'package:flaury_mobile/app/util/faqs_text.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/src/bookings/widgets/booking_status_button.dart';
import 'package:flaury_mobile/app/src/profile/widgets/faq_tiles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pages
List<Widget> tabs = [
  const PaymentFaq(),
  const CuponsFaq(),
  const BookingFaqs(),
];

class FaqPage extends ConsumerStatefulWidget {
  const FaqPage({super.key});

  @override
  ConsumerState<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends ConsumerState<FaqPage> {
  int selectedIndex = 0;
  void _selectTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SymetricPadding(
            h: 20,
            v: 0,
            child: Column(
              children: [
                const AppSpacing(v: 20),

                // appbar
                Row(
                  children: [
                    SvgAssetsicons(
                      svg: back,
                      height: SizeConfig.fromDesignHeight(context, 20),
                      ontap: () => Navigator.pop(context),
                    ),
                    const AppSpacing(h: 6),
                    AppTextBold(text: 'FAQ', fontSize: 18),
                    const AppSpacing(v: 20),
                  ],
                ),
                const AppSpacing(v: 20),

                AppTextRegular(
                    text: 'Discover Your Beauty & Wellness Solutions',
                    fontSize: 16),
                const AppSpacing(v: 20),
                // status row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Payment
                    InkWell(
                        onTap: () => _selectTab(0),
                        child: BookingButton(
                          label: status[0],
                          isWhiteButton: selectedIndex != 0,
                        )),

                    // Coupons

                    InkWell(
                        onTap: () => _selectTab(1),
                        child: BookingButton(
                          label: status[1],
                          isWhiteButton: selectedIndex != 1,
                        )),

                    // Bookings
                    InkWell(
                        onTap: () => _selectTab(2),
                        child: BookingButton(
                          label: status[2],
                          isWhiteButton: selectedIndex != 2,
                        )),
                  ],
                ),

                const AppSpacing(v: 32),

                // status body
                Expanded(child: tabs[selectedIndex])
              ],
            ),
          ),
        ));
  }
}

class PaymentFaq extends ConsumerWidget {
  const PaymentFaq({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsets.only(bottom: SizeConfig.fromDesignHeight(context, 20)),
        child: FaqTiles(
          title: paymentsFaqs[index]["question"] ?? '',
          label: paymentsFaqs[index]["answer"] ?? '',
        ),
      ),
      itemCount: paymentsFaqs.length,
    );
  }
}

class CuponsFaq extends ConsumerWidget {
  const CuponsFaq({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsets.only(bottom: SizeConfig.fromDesignHeight(context, 20)),
        child: FaqTiles(
          title: couponFaqs[index]["question"] ?? '',
          label: couponFaqs[index]["answer"] ?? '',
        ),
      ),
      itemCount: couponFaqs.length,
    );
  }
}

class BookingFaqs extends ConsumerWidget {
  const BookingFaqs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsets.only(bottom: SizeConfig.fromDesignHeight(context, 20)),
        child: FaqTiles(
          title: bookingFaqs[index]["question"] ?? '',
          label: bookingFaqs[index]["answer"] ?? '',
        ),
      ),
      itemCount: bookingFaqs.length,
    );
  }
}

List<String> status = [
  'Payment',
  'Coupons',
  'Bookings',
];
