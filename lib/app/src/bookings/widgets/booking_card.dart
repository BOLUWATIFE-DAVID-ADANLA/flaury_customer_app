import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/bookings/widgets/booking_status_button.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatefulWidget {
  final bool isBookingCompleted;
  const BookingCard({
    this.isBookingCompleted = false,
    super.key,
  });

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  bool _isSwitched = false;

  void toggleItem() {
    setState(() {
      if (_isSwitched) {
        ///remind me logic
        print('you have been reminded of your booking ');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(color: AppColors.primary)),
      child: Column(
        children: [
          // date time remind me button
          Row(
            mainAxisAlignment: widget.isBookingCompleted
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              AppTextSemiBold(
                fontSize: 14,
                text: 'Jan 14, 2024-10:0 AM',
              ),
              if (!widget.isBookingCompleted)
                AppTextSemiBold(
                  fontSize: 14,
                  text: 'Remind me',
                ),
              if (!widget.isBookingCompleted)
                Switch(
                    activeColor: AppColors.primarylight,
                    activeTrackColor: AppColors.primary,
                    value: _isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        _isSwitched = value;
                      });
                      toggleItem();
                    })
            ],
          ),

          const Divider(color: AppColors.grey),
          const AppSpacing(v: 12),
          Row(children: [
            //image
            Container(
              width: SizeConfig.fromDesignWidth(context, 150),
              height: SizeConfig.fromDesignHeight(context, 89),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage(
                        img2,
                      ),
                      fit: BoxFit.cover)),
            ),
            const AppSpacing(
              h: 9,
            ),
            // salon name service type adderess
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextBold(text: 'Timeless salon', fontSize: 18),
                AppTextSemiBold(text: 'idan hills', fontSize: 14),
                AppTextSemiBold(
                  text: 'This is a placeholder',
                  fontSize: 12,
                )
              ],
            )
          ]),
          const AppSpacing(v: 12),

          const Divider(color: AppColors.grey),
          const AppSpacing(v: 10),

          widget.isBookingCompleted
              ?
              // button when booking is completed
              InkWell(
                  onTap: () {
                    //logic  view receipt
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: AppColors.white),
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.fromDesignHeight(context, 10),
                        horizontal: SizeConfig.fromDesignWidth(context, 100)),
                    child: AppTextSemiBold(
                      text: 'View receipt',
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                )
              :
              // this is the row of button that showup when
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BookingButton(
                      isWhiteButton: true,
                      label: 'Cancel booking',
                      ontap: () {
                        // logic to cancel booking
                      },
                    ),
                    BookingButton(
                        label: 'View receipt',
                        ontap: () {
                          // logic to view receipt
                        }),
                  ],
                ),

          const AppSpacing(v: 10),
        ],
      ),
    );
  }
}
