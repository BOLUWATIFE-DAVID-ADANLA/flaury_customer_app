import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/homepage.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomepageView(),
      bottomNavigationBar:
          NavigationBar(backgroundColor: AppColors.white, destinations: const [
        NavigationDestination(icon: SvgAssets(svg: home), label: 'Home'),
        NavigationDestination(
            icon: SvgAssets(svg: bookings), label: 'Bookings'),
        NavigationDestination(icon: SvgAssets(svg: chaticon), label: 'Chat'),
        NavigationDestination(icon: SvgAssets(svg: profile), label: 'profile'),
      ]),
    );
  }
}

final List<Widget> _Pages = [
  HomepageView(),
];
