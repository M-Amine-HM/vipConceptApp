import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localboss/features/business/view/widgets/loading.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:localboss/features/home/view/widgets/stars.dart';
import 'package:localboss/features/reviews/view/widgets/latest_reviews.dart';
import 'package:localboss/features/reviews/viewModels/reviews_provider.dart';
import 'package:localboss/features/home/view/widgets/average.dart';
import 'package:localboss/features/home/view/widgets/monthly_reviews.dart';
import 'package:localboss/features/home/view/widgets/real_rating_trend.dart';
import 'package:localboss/features/home/view/widgets/total_reviews.dart';
import 'package:localboss/features/home/view/widgets/real_rating.dart';
import 'package:localboss/features/home/view/widgets/review_needed.dart';
import 'package:localboss/features/home/view/widgets/the_secret_to_more_rev.dart';
import 'package:localboss/features/home/view/widgets/qr_code.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  final step = 0.1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsData>(
      builder: (context, value, child) => value.isLoading ? const Loading(opacity: 255) : Container(
        color: Colors.white,
        child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: HomeLayout.bgGrey,
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "lib/core/assets/images/back.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 10),
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align children to the top
                                  children: <Widget>[
                                    Consumer<ReviewsData>(
                                      builder: (context, value, child) {
                                        return Row(
                                          children: [
                                            Container(
                                              width: 60, // Diameter of the CircleAvatar (2 * radius)
                                              height: 60, // Diameter of the CircleAvatar (2 * radius)
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: HomeLayout.gradient,
                                              ),
                                              child: const CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.transparent, // Make the background of CircleAvatar transparent
                                                child: Icon(Icons.business, color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  value.selectedBusiness != null
                                                      ? value.selectedBusiness!.title
                                                      : "No Business",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                // de : detche
                                                Text(
                                                  value.selectedBusiness != null
                                                      ? value.selectedBusiness!
                                                          .businessType
                                                      : "Type of Business",
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${value.selectedBusiness != null ? value.selectedBusiness!.averageRating.toStringAsFixed(1) : 0}",
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Stars(averageRating:value.selectedBusiness?.averageRating ?? 0.0),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "(${value.selectedBusiness != null ? value.selectedBusiness!.totalReviewCount : 0})",
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                    ),
                                    Builder(
                                      builder: (context) => IconButton(
                                        icon: const Icon(Icons.menu),
                                        onPressed: () {
                                          Scaffold.of(context).openEndDrawer();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height:
                                  value.reviews.isNotEmpty ? 240.0 : 200.0), // Space to avoid overlap with other content
                        ],
                      ),
                      const Positioned(
                        top:
                            150.0, // Adjust this value to control how much the container overlaps
                        left: 10, // Center horizontally
                        child: RealRatingContainer(),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ReviewNeededContainer(),
                  ),
                  const SizedBox(height: 10),
                  if(value.reviews.isNotEmpty) ..._analyticsWidgets(value),
                ],
              ),
            ),
          ),
    );
  }

  List<Widget> _analyticsWidgets(ReviewsData value){
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ThesecrettomorerevContainer(),
      ),
      
      const SizedBox(height: 10),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: RealRaringTrendContainer(),
      ),
      const SizedBox(
        height: 10,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: AverageContainer(),
      ),
      const SizedBox(
        height: 10,
      ),
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TotalreviewsContainer()),
      const SizedBox(height: 10),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: MonthlyreviewsContainer(),
      ),
      const SizedBox(
        height: 10,
      ),
      LatestReviews(latestReviews: value.reviews,),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: QrCodeContainer(link: value.selectedBusiness != null ? value.selectedBusiness!.newReviewUri : "",),
      ),
    ];
  }

  String getNeededReviewsNbr(ReviewsData currentData) {
    if(currentData.selectedBusiness == null){
      return "0";
    }

    if (currentData.selectedBusiness!.averageRating == 0) {
      return "1";
    } else if (currentData.selectedBusiness!.averageRating + step >= 5) {
      return "999+";
    }
    double nextStage = (currentData.selectedBusiness!.averageRating * 10).toInt() / 10 + step;
    int x = 1;

    while ((currentData.selectedBusiness!.averageRating * currentData.selectedBusiness!.totalReviewCount +
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
    if(currentBusiness.selectedBusiness == null){
      return 0;
    }
    double start = (currentBusiness.selectedBusiness!.averageRating * 10).toInt() / 10;

    return double.parse(
        ((currentBusiness.selectedBusiness!.averageRating - start) * 100).toStringAsFixed(1));
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
            color: HomeLayout.blueDark, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      const SizedBox(height: 5),
      Text(
        "${timeAgo.split(" ")[1]} ago",
        style: TextStyle(
            color: HomeLayout.blueDark, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ];
  }
}

