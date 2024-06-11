import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/pages/notifier/welcome_notifier.dart';
import 'package:shop_app/pages/welcome/widgets.dart';

// final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome pages
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    // first page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/reading.png",
                      title: "First see Learning",
                      subTitle:
                          "Forget about the paper, now learning all in one place",
                      index: 1,
                    ),
                    //second page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/man.png",
                      title: "Connect with everyone",
                      subTitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      index: 2,
                    ),
                    //third page
                    appOnboardingPage(
                      _controller,
                      imagePath: "assets/images/boy.png",
                      title: "FAlways Fascinated Learning",
                      subTitle:
                          "Anywhere, anytime. The time is at your discretion so study whereveryou can",
                      index: 3,
                    ),
                  ],
                ),
                // for showing dots
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: index,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
