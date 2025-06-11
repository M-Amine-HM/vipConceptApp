import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:localboss/features/reviews/viewModels/reviews_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
//import 'package:syncfusion_flutter_gauges/gauges.dart' as flgauges;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewNeededContainer extends StatefulWidget {
  const ReviewNeededContainer({super.key});

  @override
  State<ReviewNeededContainer> createState() => _ReviewNeededContainerState();
}

class _ReviewNeededContainerState extends State<ReviewNeededContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsData>(
        builder: (context, value, child) => SizedBox(
              height: 200.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Container(
                    width: 220.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HomeLayout.blueWh),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text(
                                AppLocalizations.of(context)!.reviewneeded,
                                style: TextStyle(
                                    color: HomeLayout.blueDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppLocalizations.of(context)!
                                                .language ==
                                            "English"
                                        ? 18
                                        : 16),
                              ),
                            ),
                            const SizedBox(height: 8),
                            FittedBox(
                              child: Text(
                                value.selectedBusiness != null
                                    ? getNeededReviewsNbr(value)
                                    : "1",
                                style: TextStyle(
                                    color: HomeLayout.blueDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "5${AppLocalizations.of(context)!.starsreview}",
                              style: TextStyle(
                                  color: HomeLayout.blueDark,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 3),
                            SizedBox(
                                width: 150.0,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: HomeLayout.gradient,
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Same border radius as the button
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (value.selectedBusiness == null)
                                        return;
                                      await Share.share(
                                        "${AppLocalizations.of(context)!.clicktosend} ${value.selectedBusiness!.title} ${AppLocalizations.of(context)!.yourreviews}: ${value.selectedBusiness!.newReviewUri}",
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .transparent, // Set background to transparent
                                      shadowColor: Colors
                                          .transparent, // Remove button shadow
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .getthemnow,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppLocalizations.of(context)!
                                                          .language ==
                                                      "English"
                                                  ? 14
                                                  : 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 220.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HomeLayout.blueWh),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.progressto} ${value.selectedBusiness != null ? (value.selectedBusiness!.averageRating + step).toStringAsFixed(1) : "5"}",
                            style: TextStyle(
                                color: HomeLayout.blueDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: CircularPercentIndicator(
                              linearGradient: HomeLayout.blueCyanGradient,
                              radius: 65.0,
                              lineWidth: 12.0,
                              percent: value.selectedBusiness != null
                                  ? getProgressPercentage(value)
                                  : 0.3, // 70% progress
                              circularStrokeCap: CircularStrokeCap.round,
                              // progressColor: Colors.blue,
                              backgroundColor: Colors.grey[300]!,
                              center: Text(
                                value.selectedBusiness != null
                                    ? "${getProgressPercentage(value)}%"
                                    : "0.5%",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: HomeLayout.blueDark,
                                    fontWeight: FontWeight.w700),
                              ),
                              startAngle:
                                  180, // Start the progress from 180 degrees (top center)
                              arcType: ArcType
                                  .HALF, // Use HALF arc to show only the top half
                            ),
                          ),
                          // Expanded(
                          //   child: flgauges.SfRadialGauge(axes: <flgauges
                          //       .RadialAxis>[
                          //     flgauges.RadialAxis(
                          //         showLabels: false,
                          //         showTicks: false,
                          //         startAngle: 180,
                          //         endAngle: 0,
                          //         radiusFactor: 1,
                          //         canScaleToFit: false,
                          //         axisLineStyle: flgauges.AxisLineStyle(
                          //           thickness: 0.2,
                          //           color: HomeLayout.bgGrey,
                          //           thicknessUnit:
                          //               flgauges.GaugeSizeUnit.factor,
                          //           cornerStyle:
                          //               flgauges.CornerStyle.startCurve,
                          //         ),
                          //         pointers: <flgauges.GaugePointer>[
                          //           flgauges.RangePointer(
                          //               value: value.selectedBusiness != null
                          //                   ? getProgressPercentage(value)
                          //                   : 0,
                          //               width: 0.2,
                          //               sizeUnit: flgauges.GaugeSizeUnit.factor,
                          //               cornerStyle:
                          //                   flgauges.CornerStyle.bothCurve)
                          //         ],
                          //         annotations: <flgauges.GaugeAnnotation>[
                          //           flgauges.GaugeAnnotation(
                          //               positionFactor: 0,
                          //               angle: 90,
                          //               widget: Text(
                          //                 value.selectedBusiness != null
                          //                     ? "${getProgressPercentage(value)}%"
                          //                     : "0.0%",
                          //                 style: TextStyle(
                          //                     fontSize: 32,
                          //                     color: HomeLayout.blueDark,
                          //                     fontWeight: FontWeight.w700),
                          //               ))
                          //         ])
                          //   ]),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  if (value.selectedBusiness != null &&
                      value.reviews.isNotEmpty)
                    Container(
                      width: 220.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HomeLayout.blueWh),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.lastreview,
                                style: TextStyle(
                                    color: HomeLayout.blueDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              ...getLastReviewText(value),

                              ///const SizedBox(height: 3),
                              SizedBox(
                                  width: 150.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: HomeLayout.gradient,
                                      borderRadius: BorderRadius.circular(
                                          8), // Same border radius as the button
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Handle button press
                                        context.push("/reviews");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set button background to transparent
                                        shadowColor: Colors
                                            .transparent, // Remove button shadow (optional)
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8), // Button shape matches container
                                        ),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          AppLocalizations.of(context)!.viewall,
                                          style: const TextStyle(
                                            color: Colors
                                                .white, // Text color remains white
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                ]),
              ),
            ));
  }
}

const step = 0.1;
String getNeededReviewsNbr(ReviewsData currentData) {
  if (currentData.selectedBusiness!.averageRating == 0) {
    return "1";
  } else if (currentData.selectedBusiness!.averageRating + step >= 5) {
    return "0";
  }
  double nextStage =
      (currentData.selectedBusiness!.averageRating * 10).toInt() / 10 + step;
  int x = 1;

  while ((currentData.selectedBusiness!.averageRating *
                  currentData.selectedBusiness!.totalReviewCount +
              5 * x) /
          (currentData.selectedBusiness!.totalReviewCount + x) <
      nextStage) {
    x++;
    if (x >= 1000) {
      break;
    }
  }

  return x >= 1000 ? "${x - 1}+" : "$x";
}

double getProgressPercentage(ReviewsData currentBusiness) {
  double start =
      (currentBusiness.selectedBusiness!.averageRating * 10).toInt() / 10;

  return double.parse(
      ((currentBusiness.selectedBusiness!.averageRating - start) * 100)
          .toStringAsFixed(1));
}

List<Widget> getLastReviewText(ReviewsData currentBusiness) {
  DateTime sentDate = DateTime.parse(currentBusiness.reviews[0].updateTime);
  DateTime now = DateTime.now();

  Duration timeElapsed = now.difference(sentDate);

  // Calculate time elapsed in days, hours, minutes, etc.
  int days = timeElapsed.inDays;
  int hours = timeElapsed.inHours.remainder(24);
  int minutes = timeElapsed.inMinutes.remainder(60);
  int seconds = timeElapsed.inSeconds.remainder(60);

  // Format the output based on the elapsed time and locale
  String timeAgo;

  if (days > 0) {
    timeAgo = "$days day${days > 1 ? 's' : ''}";
  } else if (hours > 0) {
    timeAgo = "$hours hour${hours > 1 ? 's' : ''}";
  } else if (minutes > 0) {
    timeAgo = "$minutes minute${minutes > 1 ? 's' : ''}";
  } else {
    timeAgo = "$seconds second${seconds > 1 ? 's' : ''}";
  }

  return [
    Text(
      timeAgo.split(" ")[0],
      style: TextStyle(
          color: HomeLayout.blueDark,
          fontWeight: FontWeight.bold,
          fontSize: 30),
    ),
    const SizedBox(height: 5),
    Text(
      "${timeAgo.split(" ")[1]} ago",
      style: TextStyle(
          color: HomeLayout.blueDark,
          fontWeight: FontWeight.bold,
          fontSize: 16),
    ),
  ];
}
