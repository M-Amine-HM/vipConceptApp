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

class MonthlyreviewsContainer extends StatefulWidget {
  const MonthlyreviewsContainer({super.key});

  @override
  State<MonthlyreviewsContainer> createState() =>
      _MonthlyreviewsContainerState();
}

class _MonthlyreviewsContainerState extends State<MonthlyreviewsContainer> {
  late List<List<_ChartData>> data;
  //late TooltipBehavior tooltip;

  @override
  void initState() {
    final reviews = Provider.of<ReviewsData>(context, listen: false).reviews;
    final monthCounts = ReviewsStats.monthlyReviews(reviews);

    final sortedKeys = monthCounts.keys.toList()
      ..sort((a, b) => a.compareTo(b));

    data = [[], [], [], [], []];
    for (var key in sortedKeys) {
      for (int i = 0; i < 5; i++) {
        data[i]
            .add(_ChartData(monthNames[key.month - 1], monthCounts[key]![i]));
      }
    }

    //tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  int sumData(List<List<_ChartData>> data) {
    int last = data[0].length - 1;
    if (last < 0) return 0;
    int sum = 0;

    for (int i = 0; i < 5; i++) {
      sum += data[i][last].y;
    }
    return sum;
  }

  bool boolMonthlyReviews = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: HomeLayout.blueWh),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FittedBox(
                  child: Text(
                    AppLocalizations.of(context)!.monthlyreviews,
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
                      position:
                          const StyledToastPosition(align: Alignment.center),
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
                          IntrinsicWidth(
                            child: IntrinsicHeight(
                              child: Container(
                                //  height: MediaQuery.sizeOf(context).height * 0.35,
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
                                    Text(
                                      AppLocalizations.of(context)!
                                          .whatdoesitmean,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      AppLocalizations.of(context)!
                                          .mrwhatdoesitmeanmodal,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
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
                                            // backgroundColor: HomeLayout.blueDark,
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
                  icon: boolMonthlyReviews
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
                      boolMonthlyReviews = !boolMonthlyReviews;
                    });
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[0].isNotEmpty ? sumData(data).toString() : "0",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    if (data.isNotEmpty && data[0].isNotEmpty)
                      Text(
                        data[0][data[0].length - 1].x,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                  ]),
            ),
            if (boolMonthlyReviews)
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        barGroups: List.generate(
                          data.length,
                          (index) => BarChartGroupData(
                            x: index,
                            barRods: data[index]
                                .asMap()
                                .entries
                                .map(
                                  (entry) => BarChartRodData(
                                    toY: entry.value.y > 0
                                        ? entry.value.y.toDouble() + 1
                                        : 0.5, // Set minimum value as 0.2
                                    color: _getColor(
                                        index), // Get color based on index
                                    width: 60,
                                    borderRadius: BorderRadius.circular(3),
                                    backDrawRodData: BackgroundBarChartRodData(
                                      show: true,
                                      toY: 2, // max Y value
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                              getTitlesWidget: (value, _) {
                                int index = value.toInt();
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    data[index % data.length][0].x,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
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
                          show: false, // Hide axis borders
                        ),
                        gridData: FlGridData(show: false), // Hide grid lines
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            // tooltipBgColor: Colors.blueAccent,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                '${data[groupIndex][rodIndex].x}\n',
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
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        maxY: 3, // Set max Y value for the chart
                        alignment: BarChartAlignment.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.square,
                            color: HomeLayout.fiveStars,
                            size: 14,
                          ),
                          Text(
                            " 5 ${AppLocalizations.of(context)!.stars}",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.square,
                            color: HomeLayout.fourStars,
                            size: 14,
                          ),
                          Text(
                            " 4 ${AppLocalizations.of(context)!.stars}",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.square,
                            color: HomeLayout.threeStars,
                            size: 14,
                          ),
                          Text(
                            " 3 ${AppLocalizations.of(context)!.stars}",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.square,
                            color: HomeLayout.twoStars,
                            size: 14,
                          ),
                          Text(
                            " 2 ${AppLocalizations.of(context)!.stars}",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.square,
                            color: HomeLayout.oneStar,
                            size: 14,
                          ),
                          Text(
                            " 1 ${AppLocalizations.of(context)!.stars}",
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}

Color _getColor(int index) {
  switch (index) {
    case 0:
      return HomeLayout.oneStar;
    case 1:
      return HomeLayout.twoStars;
    case 2:
      return HomeLayout.threeStars;
    case 3:
      return HomeLayout.fourStars;
    case 4:
      return HomeLayout.fiveStars;
    default:
      return Colors.blue; // Default color
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final int y;
}
