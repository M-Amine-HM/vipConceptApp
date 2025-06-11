import 'package:flutter/material.dart';
import 'package:localboss/features/auth/viewModels/auth_provider.dart';
import 'package:localboss/features/business/viewModels/business_data.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:localboss/features/reviews/viewModels/reviews_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Loading extends StatefulWidget {
  final int opacity;

  const Loading({super.key, required this.opacity});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String state = "";
  bool startLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        color: Color.fromARGB(widget.opacity, 255, 255, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 150,
              child: Lottie.asset("lib/core/assets/animations/loading.json")),
          Consumer<AuthProvider>(builder: (context, value, child) {
            if (value.isLoggedIn && !startLoading) {
              startLoading = true;
              state = AppLocalizations.of(context)!.loadinglocations;
              Provider.of<BusinessData>(context, listen: false)
                  .loadBuisnessList()
                  .then((selectedBusiness) {
                if (selectedBusiness != null) {
                  setState(() {
                    state = AppLocalizations.of(context)!.loadingreviews;
                  });
                  Provider.of<ReviewsData>(context, listen: false)
                      .loadReviews(selectedBusiness)
                      .then((_) {
                    value.finishLoading();
                  });
                } else {
                  value.finishLoading();
                }
              });
            }

            return Text("${state.isEmpty ? AppLocalizations.of(context)!.signingin : state}...",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: HomeLayout.blueDark,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.none,
            ));
          })
        ],
      ),
    ));
  }
}
