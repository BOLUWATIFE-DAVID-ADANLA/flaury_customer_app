import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/bookings/views/bookings_page.dart';
import 'package:flaury_mobile/app/src/chat/views/chat_page.dart';
import 'package:flaury_mobile/app/src/profile/views/proflie_page.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/providers/providers.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navstate = ref.watch(bottomNavProvider);
    final index = navstate.currentindex;
    return Scaffold(
      body: _Pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return GoogleFonts.montserrat(
                    color: AppColors.primary,
                    fontSize: SizeConfig.fontSize(context, 12),
                    fontWeight: FontWeight.w700,
                  );
                }
                return GoogleFonts.montserrat(
                  color: AppColors.black,
                  fontSize: SizeConfig.fontSize(context, 12),
                  fontWeight: FontWeight.w700,
                );
              },
            ),
            indicatorColor: Colors.transparent),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            ref.read(bottomNavProvider.notifier).updatePage(index);
          },
          selectedIndex: index,
          backgroundColor: AppColors.white,
          destinations: const [
            NavigationDestination(
              icon: SvgAssets(svg: home),
              label: 'Home',
              selectedIcon: SvgAssets(
                svg: home,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgAssets(svg: bookings),
              label: 'Bookings',
              selectedIcon: SvgAssets(
                svg: bookings,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgAssets(svg: chaticon),
              label: 'Chat',
              selectedIcon: SvgAssets(
                svg: chaticon,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgAssets(svg: profile),
              label: 'profile',
              selectedIcon: SvgAssets(
                svg: profile,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Widget> _Pages = [
  const HomepageView(),
  const BookingsPage(),
  const ChatPage(),
  const ProfilePage(),
];
