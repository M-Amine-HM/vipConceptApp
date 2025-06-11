import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:localboss/features/reviews/viewModels/reviews_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RealRatingContainer extends StatelessWidget {
  const RealRatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsData>(
        builder: (context, value, child) => SizedBox(
              height:
                  value.selectedBusiness != null && !value.reviews.isNotEmpty
                      ? 200
                      : 270,
              width: MediaQuery.of(context).size.width - 20,
              child: value.selectedBusiness != null && !value.reviews.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: HomeLayout.gradient,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .getyourfirstreview,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          height: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              color: HomeLayout.blueWh,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .doyouthinkthereisanerror,
                                  style: TextStyle(
                                    color: HomeLayout.textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: HomeLayout.gradient,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (value.selectedBusiness != null) {
                                        value.loadReviews(
                                            value.selectedBusiness!);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.reloaddata,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width - 2,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              "lib/core/assets/images/realRating2.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        color: HomeLayout.blueDark,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    AppLocalizations.of(context)!.realrating,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: HomeLayout.blueDark),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Ionicons.alert_circle_outline,
                                    color: HomeLayout.blueDark,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    showToastWidget(
                                      reverseAnimation:
                                          StyledToastAnimation.fade,
                                      //dismissOtherToast: false,
                                      context: context,
                                      animation: StyledToastAnimation.fade,
                                      isIgnoring: false,
                                      duration: Duration.zero,
                                      animDuration:
                                          const Duration(milliseconds: 200),
                                      position: const StyledToastPosition(
                                          align: Alignment.center),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ModalBarrier(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            dismissible:
                                                false, // Prevents dismissing the toast by tapping outside
                                          ),
                                          // Container(
                                          //   color: Colors.black,
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          IntrinsicWidth(
                                            child: IntrinsicHeight(
                                              child: Container(
                                                // height: MediaQuery.sizeOf(context)
                                                //         .height *
                                                //     0.35,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 10, 20, 0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 7,
                                                      offset:
                                                          const Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  //mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                            //alignment: Alignment.topRight,
                                                            onPressed: () {
                                                              dismissAllToast(
                                                                  showAnim:
                                                                      true);
                                                            },
                                                            icon: const Icon(
                                                              Ionicons
                                                                  .close_circle_outline,
                                                              size: 35,
                                                            )),
                                                      ],
                                                    ),

                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .whatdoesitmean,
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      AppLocalizations.of(
                                                              context)!
                                                          .rlwhatdoesitmeanmodal,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),

                                                    //error message in textformfield is not working in the toast so need other way
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            HomeLayout.gradient,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20.0), // Same border radius as the button
                                                      ),
                                                      width: 140,
                                                      child: TextButton(
                                                        style: TextButton.styleFrom(
                                                            // backgroundColor:
                                                            //     HomeLayout
                                                            //         .blueDark,
                                                            // shape:
                                                            //     RoundedRectangleBorder(
                                                            //   borderRadius:
                                                            //       BorderRadius
                                                            //           .circular(
                                                            //               20),
                                                            // ),
                                                            ),
                                                        onPressed: () {
                                                          dismissAllToast(
                                                              showAnim: true);
                                                        },
                                                        child: Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .accept,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Text(
                              //TODO: here
                              value.selectedBusiness != null
                                  ? ((value.selectedBusiness!.averageRating *
                                                  1000)
                                              .toInt() /
                                          1000)
                                      .toString()
                                  : "0.0",
                              //"5.21",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w400,
                                  color: HomeLayout.blueDark),
                            )
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
