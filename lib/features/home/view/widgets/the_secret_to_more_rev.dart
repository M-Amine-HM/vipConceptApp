import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThesecrettomorerevContainer extends StatelessWidget {
  const ThesecrettomorerevContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showToastWidget(
                  reverseAnimation: StyledToastAnimation.fade,
                  //dismissOtherToast: false,
                  context: context,
                  animation: StyledToastAnimation.fade,
                  isIgnoring: false,
                  duration: Duration.zero,
                  animDuration: const Duration(milliseconds: 200),
                  position: const StyledToastPosition(align: Alignment.center),
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
                            // height: MediaQuery.sizeOf(context).height * 0.52,
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                      .thesecrettomorereviews,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  AppLocalizations.of(context)!
                                      .thesecrettomorereviewsmodal,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                //error message in textformfield is not working in the toast so need other way

                                const SizedBox(height: 20),
                                SizedBox(
                                  width: 140,
                                  child:Container(
                                    decoration: BoxDecoration(
                                      gradient: HomeLayout.gradient,
                                      borderRadius: BorderRadius.circular(20), // Same border radius as the button
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent, // Set background to transparent
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20), // Button shape
                                        ),
                                      ),
                                      onPressed: () {
                                        dismissAllToast(showAnim: true);
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.accept,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )

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
              child: Container(
                height: 50.0,
                //width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HomeLayout.blueWh),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => HomeLayout.gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: const Icon(Icons.info_rounded, color: Colors.white), // Set the base icon color to white
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppLocalizations.of(context)!.thesecrettomorereviews,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                showToastWidget(
                  reverseAnimation: StyledToastAnimation.fade,
                  //dismissOtherToast: false,
                  context: context,
                  animation: StyledToastAnimation.fade,
                  isIgnoring: false,
                  duration: Duration.zero,
                  animDuration: const Duration(milliseconds: 200),
                  position: const StyledToastPosition(align: Alignment.center),
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
                            // height: MediaQuery.sizeOf(context).height * 0.55,
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                      .alwaysanswer1starreviews,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  AppLocalizations.of(context)!
                                      .alwaysanswer1starreviewsmodal,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                //error message in textformfield is not working in the toast so need other way

                                const SizedBox(height: 20),
                                SizedBox(
                                  width: 140,
                                  child: Container(
                                  decoration: BoxDecoration(
                                    gradient: HomeLayout.gradient,
                                    borderRadius: BorderRadius.circular(20), // Same border radius as the button
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent, // Set background to transparent
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Button shape
                                      ),
                                    ),
                                    onPressed: () {
                                      dismissAllToast(showAnim: true);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.accept,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: 50.0,
                //width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HomeLayout.blueWh),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => HomeLayout.gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: const Icon(Icons.info_rounded, color: Colors.white), // Set the base icon color to white
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppLocalizations.of(context)!.alwaysanswer1starreviews,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
