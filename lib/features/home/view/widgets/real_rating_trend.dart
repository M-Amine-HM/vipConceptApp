import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localboss/core/constants.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:localboss/features/reviews/utils/reviews_stats.dart';
import 'package:localboss/features/reviews/viewModels/reviews_provider.dart';
import 'package:provider/provider.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RealRaringTrendContainer extends StatefulWidget {
  const RealRaringTrendContainer({
    super.key,
  });

  @override
  State<RealRaringTrendContainer> createState() =>
      _RealRaringTrendContainerState();
}

enum ChartType { day, month, year }

class _RealRaringTrendContainerState extends State<RealRaringTrendContainer> {
  late List<_ChartData> data;

  ///late TooltipBehavior tooltip;

  @override
  void initState() {
    _updateData(ChartType.month);
    // tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  bool boolRealRatingTrend = true;
  ChartType chartType = ChartType.month;

  void _updateData(ChartType type) {
    final reviews = Provider.of<ReviewsData>(context, listen: false).reviews;

    if (type == ChartType.year) {
      final yearData = ReviewsStats.realRatingTrendPerYear(reviews);
      final sortedKeys = yearData.keys.toList()..sort((a, b) => a.compareTo(b));

      data = sortedKeys.map((key) {
        return _ChartData("${key.year}", yearData[key]!);
      }).toList();
    }
    if (type == ChartType.month) {
      final monthData = ReviewsStats.realRatingTrendPerMonth(reviews);
      final sortedKeys = monthData.keys.toList()
        ..sort((a, b) => a.compareTo(b));

      data = sortedKeys.map((key) {
        String monthName = monthNames[key.month - 1];

        return _ChartData(monthName, monthData[key]!);
      }).toList();
      // data = [
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      //   ...data,
      // ];
    }
    if (type == ChartType.day) {
      final weekData = ReviewsStats.realRatingTrendPerDay(reviews);
      final sortedKeys = weekData.keys.toList()..sort((a, b) => a.compareTo(b));

      data = sortedKeys.map((key) {
        String monthName = monthNames[key.month - 1];

        return _ChartData("$monthName ${key.day}", weekData[key]!);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: HomeLayout.blueWh),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                FittedBox(
                  child: Text(
                    AppLocalizations.of(context)!.realratingtrend,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: ShaderMask(
                    shaderCallback: (bounds) => HomeLayout.gradient
                        .createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: const Icon(Icons.info_rounded,
                        color:
                            Colors.white), // Set the base icon color to white
                  ),
                  onPressed: () {
                    showToastWidget(
                      reverseAnimation: StyledToastAnimation.fade,
                      //dismissOtherToast: false,
                      context: context,
                      animation: StyledToastAnimation.fade,
                      isIgnoring: false,
                      duration: Duration.zero,
                      animDuration: const Duration(milliseconds: 200),
                      position: const StyledToastPosition(
                          //92216274
                          align: Alignment.center),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ModalBarrier(
                            color: Colors.black.withOpacity(0.7),
                            dismissible:
                                false, // Prevents dismissing the toast by tapping outside
                          ),
                          // Container(
                          //   color: Colors.black,
                          //   height: 50,
                          //   width: 50,
                          // ),
                          IntrinsicHeight(
                            child: IntrinsicWidth(
                              child: Container(
                                // height: MediaQuery.sizeOf(context).height * 0.35,
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            //alignment: Alignment.topRight,
                                            onPressed: () {
                                              dismissAllToast(showAnim: true);
                                            },
                                            icon: const Icon(
                                              Ionicons.close_circle_outline,
                                              size: 35,
                                            )),
                                      ],
                                    ),

                                    FittedBox(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .whatdoesitmean,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        AppLocalizations.of(context)!
                                            .rrtwhatdoesitmeanmodal,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),

                                    //error message in textformfield is not working in the toast so need other way

                                    const SizedBox(height: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: HomeLayout.gradient,
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Same border radius as the button
                                      ),
                                      width: 140,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            // backgroundColor:
                                            //     HomeLayout.blueDark,
                                            // shape: RoundedRectangleBorder(
                                            //   borderRadius:
                                            //       BorderRadius.circular(20),
                                            // ),
                                            ),
                                        onPressed: () {
                                          dismissAllToast(showAnim: true);
                                        },
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .accept,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
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
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: boolRealRatingTrend
                      ? ShaderMask(
                          shaderCallback: (bounds) => HomeLayout.gradient
                              .createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height)),
                          child: const Icon(
                              CupertinoIcons.arrowtriangle_down_circle_fill,
                              color: Colors
                                  .white), // Set the base icon color to white
                        )
                      : ShaderMask(
                          shaderCallback: (bounds) => HomeLayout.gradient
                              .createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height)),
                          child: const Icon(
                              CupertinoIcons.arrowtriangle_up_circle_fill,
                              color: Colors
                                  .white), // Set the base icon color to white
                        ),
                  onPressed: () {
                    setState(() {
                      boolRealRatingTrend = !boolRealRatingTrend;
                    });
                  },
                )
              ],
            ),
            if (boolRealRatingTrend)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: chartType == ChartType.day
                              ? HomeLayout.blueCyanGradient
                              : HomeLayout.blueCyanGradientDaul,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              chartType = ChartType.day;
                              _updateData(ChartType.day);
                            });
                          },
                          child: Text(
                            AppLocalizations.of(context)!.day,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: chartType == ChartType.month
                              ? HomeLayout.blueCyanGradient
                              : HomeLayout.blueCyanGradientDaul,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          // style: TextButton.styleFrom(
                          //     backgroundColor: chartType == ChartType.month
                          //         ? HomeLayout.blueCyan
                          //         : Colors.grey),
                          onPressed: () {
                            setState(() {
                              chartType = ChartType.month;
                              _updateData(ChartType.month);
                            });
                          },
                          child: Text(
                            AppLocalizations.of(context)!.month,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: chartType == ChartType.year
                              ? HomeLayout.blueCyanGradient
                              : HomeLayout.blueCyanGradientDaul,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          // style: TextButton.styleFrom(
                          //     backgroundColor: chartType == ChartType.year
                          //         ? HomeLayout.blueCyan
                          //         : Colors.grey),
                          onPressed: () {
                            setState(() {
                              chartType = ChartType.year;
                              _updateData(ChartType.year);
                            });
                          },
                          child: Text(
                            AppLocalizations.of(context)!.year,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: data.length * 40,
                          child: BarChart(
                            BarChartData(
                              barGroups: data
                                  .asMap()
                                  .entries
                                  .map(
                                    (entry) => BarChartGroupData(
                                      x: entry.key,
                                      barRods: [
                                        BarChartRodData(
                                          gradient: HomeLayout.blueCyanGradient,
                                          toY: entry.value.y,
                                          //color: HomeLayout.blueDark,
                                          width: 25,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          backDrawRodData:
                                              BackgroundBarChartRodData(
                                            show: true,
                                            toY:
                                                6, // maximum value for the y-axis
                                            color: HomeLayout.blueCyan,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),

                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, _) {
                                      final index = value.toInt();
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: FittedBox(
                                          child: Text(
                                            data[index].x,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false, // Hide Y-axis labels
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false, // Hide the borders
                              ),
                              gridData: FlGridData(
                                  show: false), // Hide the grid lines
                              barTouchData: BarTouchData(
                                enabled: true,
                                touchTooltipData: BarTouchTooltipData(
                                  //getTooltipColor: Colors.blue,
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
                                    return BarTooltipItem(
                                      '${data[groupIndex].x}\n',
                                      TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${rod.toY}',
                                          style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              maxY: 7, // Set the maximum y value

                              alignment: BarChartAlignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
