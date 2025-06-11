
import 'package:flutter/material.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:localboss/features/reviews/view/widgets/reviews_list.dart';
import 'package:localboss/features/reviews/viewModels/reviews_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({
    super.key,
  });

  @override
  State<ReviewsPage> createState() => _ReviewsContainerState();
}

class _ReviewsContainerState extends State<ReviewsPage> {
  bool showAll = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Row(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return HomeLayout.gradient.createShader(bounds); // Apply the gradient here
              },
              child: const Icon(
                Icons.reviews,
                size: 24,
                color: Colors.white,
              ),
            )
,
            const SizedBox(
              width: 8,
            ),
            Text(
              AppLocalizations.of(context)!.reviews,
              style: TextStyle(
                  color: HomeLayout.textColor,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: showAll ? HomeLayout.gradient : null,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showAll = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: showAll
                            ? Colors.transparent // Make button background transparent when gradient is applied
                            : Theme.of(context).colorScheme.surfaceContainer,
                        shadowColor: Colors.transparent, // Remove shadow if gradient is used
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.all_inbox_outlined,
                            color: showAll
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppLocalizations.of(context)!.allreviews,
                            style: TextStyle(
                              color: showAll
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: !showAll ? HomeLayout.gradient : null,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showAll = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !showAll
                            ? Colors.transparent
                            : Theme.of(context).colorScheme.surfaceContainer,
                        shadowColor: Colors.transparent,
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.reply_all_outlined,
                            color: !showAll
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onSurface,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppLocalizations.of(context)!.nonreplied,
                            style: TextStyle(
                              color: !showAll
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //const SizedBox(height: 8,),
          Consumer<ReviewsData>(builder: (context, value, child){
            value.reviews.forEach((r){
              (r.updateTime);
              (r.comment);
            });
            return Expanded(
              child: ReviewsList(
              reviews: value.reviews,
              showAll: showAll,
            ));
          })
        ],
      )
    );
  }
}