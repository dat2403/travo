import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travo/core/constants/color_constants.dart';
import 'package:travo/core/constants/dimension_constants.dart';
import 'package:travo/core/constants/text_style_constant.dart';
import 'package:travo/core/helper/asset_helper.dart';
import 'package:travo/core/helper/image_helper.dart';
import 'package:travo/representation/screens/main_app.dart';
import 'package:travo/representation/widgets/app_contained_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routeName = '/intro-screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // print(_pageController.page);
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const Gap(AppDimension.kMediumPadding * 2),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimension.kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultTextStyle.bold.fontHeader,
              ),
              const Gap(AppDimension.kMediumPadding),
              Text(
                description,
                style: TextStyles.defaultTextStyle.medium,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                  AssetHelper.intro1,
                  'Book a flight',
                  'Found a flight that matches your destination and schedule? Book it instantly.',
                  Alignment.centerRight),
              _buildItemIntroScreen(
                  AssetHelper.intro2,
                  'Find a hotel room',
                  'Select the day, book your room. We give you the best price.',
                  Alignment.center),
              _buildItemIntroScreen(
                  AssetHelper.intro3,
                  'Enjoy your trip',
                  'Easy discovering new places and share these between your friends and travel together.',
                  Alignment.centerLeft),
            ],
          ),
          Positioned(
            left: AppDimension.kMediumPadding,
            right: AppDimension.kMediumPadding,
            bottom: AppDimension.kMediumPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: AppDimension.kMinPadding*1.5,
                      dotHeight: AppDimension.kMinPadding,
                      activeDotColor: ColorPalette.yellowColor,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                          flex: 4,
                          child: AppContainedButton(
                            onTap: () {
                              if (snapshot.data != 2) {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                );
                              }else {
                                Navigator.of(context).pushNamed(MainApp.routeName);
                              }
                            },
                            buttonTitle: snapshot.data != 2 ? 'Next' : 'Get started',
                          ));
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
