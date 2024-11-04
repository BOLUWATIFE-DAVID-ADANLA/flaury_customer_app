import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/bookings/widgets/booking_status_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingsPage extends ConsumerStatefulWidget {
  const BookingsPage({super.key});

  @override
  ConsumerState<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends ConsumerState<BookingsPage> {
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
                //app bar
                const AppSpacing(v: 20),

                //status buttons
                Row(
                  children: [
                    SvgAssetsicons(
                      svg: back,
                      height: SizeConfig.fromDesignHeight(context, 20),
                      ontap: () => Navigator.pop(context),
                    ),
                    const AppSpacing(h: 6),
                    AppTextBold(text: 'My Bookings', fontSize: 18),
                    const AppSpacing(v: 20),
                  ],
                ),
                const AppSpacing(v: 20),

                // status row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //upcoming
                    BookingButton(
                      label: status[0],
                      color: selectedIndex == 0
                          ? AppColors.primary
                          : AppColors.white,
                      ontap: () => _selectTab(0),
                      textcolor: selectedIndex == 0
                          ? AppColors.white
                          : AppColors.black,
                    ),

                    //completed
                    BookingButton(
                      label: status[1],
                      color: selectedIndex == 1
                          ? AppColors.primary
                          : AppColors.white,
                      ontap: () => _selectTab(1),
                      textcolor: selectedIndex == 1
                          ? AppColors.white
                          : AppColors.black,
                    ),

                    // cancelled
                    BookingButton(
                      label: status[2],
                      color: selectedIndex == 2
                          ? AppColors.primary
                          : AppColors.white,
                      ontap: () => _selectTab(2),
                      textcolor: selectedIndex == 2
                          ? AppColors.white
                          : AppColors.black,
                    ),
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

enum BookingStatus {
  upcoming('Upcoming'),
  completed('Completed'),
  cancelled('Cancelled');

  final String status;
  const BookingStatus(this.status);
}

List<String> status = [
  BookingStatus.upcoming.status,
  BookingStatus.completed.status,
  BookingStatus.cancelled.status,
];

List<Widget> tabs = [
  Center(
    child: Text('upcoming'),
  ),
  Center(
    child: Text('Completed'),
  ),
  Center(
    child: Text('Cancelled'),
  ),
];
