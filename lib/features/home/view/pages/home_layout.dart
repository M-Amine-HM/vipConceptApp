import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localboss/features/home/view/widgets/end_drawer.dart';
import 'package:localboss/features/reviews/viewModels/reviews_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({super.key, required this.child});

  static Color blueCyan = const Color.fromRGBO(22, 121, 171, 1);
  static LinearGradient blueCyanGradient = const LinearGradient(
    colors: [Color.fromRGBO(51, 200, 135, 1), Color.fromRGBO(117, 108, 235, 1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static Color bgGrey = const Color.fromRGBO(217, 217, 217, 1);
  static Color blueDark = const Color.fromRGBO(16, 44, 87, 1);
  static Color blueWh = const Color.fromRGBO(235, 244, 246, 1);
  static Color textColor = const Color.fromRGBO(0, 0, 0, 1);

  static Color oneStar = const Color.fromRGBO(200, 0, 54, 1);
  static Color twoStars = const Color.fromRGBO(255, 105, 105, 1);
  static Color threeStars = const Color.fromRGBO(252, 220, 42, 1);
  static Color fourStars = const Color.fromRGBO(135, 169, 34, 1);
  static Color fiveStars = const Color.fromRGBO(16, 44, 87, 1);

  static LinearGradient gradient = const LinearGradient(
    colors: [Color(0xff32C984), Color(0xff7868EF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient blueCyanGradientDaul = const LinearGradient(
    colors: [Color.fromRGBO(51, 200, 135, 0.5), Color.fromRGBO(117, 108, 235, 0.5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const EndDrawer(),
      body: child,
      bottomNavigationBar: Consumer<ReviewsData>(
        builder: (context, value, child) => BottomNavigationBar(
          selectedIconTheme: const IconThemeData(fill: 0.9),
          selectedItemColor: blueCyan,
          unselectedItemColor: Colors.black,
          currentIndex: GoRouterState.of(context).fullPath == '/home' ? 0 : 2,
          onTap: (index) async {
            bool canNotSwithch =
                Provider.of<ReviewsData>(context, listen: false).isLoading;
            if (canNotSwithch) return;
            switch (index) {
              case 0:
                if (GoRouterState.of(context).fullPath != '/home') {
                  context.pop();
                }
                break;
              case 1:
                if (value.selectedBusiness == null) return;
                await Share.share(
                    "${AppLocalizations.of(context)!.clicktosend} ${value.selectedBusiness!.title} ${AppLocalizations.of(context)!.yourreviews}: ${value.selectedBusiness!.newReviewUri}");
                break;
              case 2:
                if (GoRouterState.of(context).fullPath == '/home') {
                  context.push("/reviews");
                }
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: ShaderMask(
                shaderCallback: (bounds) => HomeLayout.gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: const Icon(Icons.home, size: 24, color: Colors.white),
              ),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: ShaderMask(
                shaderCallback: (bounds) => HomeLayout.gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: const Icon(Icons.add, size: 24, color: Colors.white),
              ),
              label: AppLocalizations.of(context)!.getmore,
            ),
            BottomNavigationBarItem(
              icon: ShaderMask(
                shaderCallback: (bounds) => HomeLayout.gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: const Icon(Icons.comment, size: 24, color: Colors.white),
              ),
              label: AppLocalizations.of(context)!.reviews,
            ),
          ],
        ),
      ),
    );
  }
}

bool dataExist = false;
